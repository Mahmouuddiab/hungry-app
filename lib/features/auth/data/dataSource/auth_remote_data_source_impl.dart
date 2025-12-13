import 'package:hungry_app/core/api/dio_helper.dart';
import 'package:hungry_app/core/pref%20helper/pref_helper.dart';
import 'package:hungry_app/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:hungry_app/features/auth/data/models/UserModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<UserModel> register(String name, String email, String password, String rePassword,String phone)async{
    final response = await DioHelper.postData(
        url: "https://ecommerce.routemisr.com/api/v1/auth/signup",
        data: {
          "name":name,
          "email":email,
          "password":password,
          "rePassword":rePassword,
          "phone":phone
        }
    );
    if(response.statusCode== 200 || response.statusCode== 201){
      final user = UserModel.fromJson(response.data) ;
      if(user.token != null){
        PrefHelper.saveToken(user.token!);
      }
      else{
        print('No token received from server!');
      }
      return user ;
    }
    else{
      throw Exception("can't register ${response.statusCode}");
    }
  }

  @override
  Future<UserModel> login(String email, String password)async{
    final response = await DioHelper.postData(
        url: "https://ecommerce.routemisr.com/api/v1/auth/signin",
        data: {
          "email":email,
          "password":password
        }
    );
    if(response.statusCode== 200 || response.statusCode== 201){
      final user = UserModel.fromJson(response.data);
      if(user.token != null){
        PrefHelper.saveToken(user.token!);
      }
      else{
        print('No token received from server!');
      }
      return user ;
    }
    else{
      throw Exception("can't login ${response.statusCode}");
    }
  }
  
}

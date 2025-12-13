import 'package:hungry_app/core/api/dio_helper.dart';
import 'package:hungry_app/features/home/data/dataSource/home_remote_data_source.dart';
import 'package:hungry_app/features/home/data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  @override
  Future<List<ProductModel>> getProducts()async{
   final response = await DioHelper.getData(url: "https://sonic-zdi0.onrender.com/api/products");
   if(response.statusCode==200){
     final List data = response.data['data'];
     return data.map((json)=>ProductModel.fromJson(json)).toList() ;
   }
   else{
     throw Exception(response.data);
   }
  }

}
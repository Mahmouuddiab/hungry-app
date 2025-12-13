import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/usecase/product_usecase.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeStates>{
  GetProductsUseCase getProductsUseCase;
  HomeCubit(this.getProductsUseCase):super(HomeInitialState());
  Future<void> getProducts()async{
    emit(HomeLoadingState());
    try{
      final products = await getProductsUseCase.call();
      emit(HomeSuccessState(products: products));
    }
    catch(e){
      emit(HomeErrorState(error: e.toString()));
    }
  }
}
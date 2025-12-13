import 'package:hungry_app/features/home/domain/entity/product_entity.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingState extends HomeStates{}
class HomeSuccessState extends HomeStates{
  final List<ProductEntity> products;
  HomeSuccessState({required this.products});
}
class HomeErrorState extends HomeStates{
  String error;
  HomeErrorState({required this.error});
}
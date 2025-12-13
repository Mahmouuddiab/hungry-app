import 'package:hungry_app/features/home/domain/entity/product_entity.dart';

abstract class HomeRepository{
  Future<List<ProductEntity>> getProducts();
}
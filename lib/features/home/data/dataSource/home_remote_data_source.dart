import 'package:hungry_app/features/home/data/models/ProductModel.dart';

abstract class HomeRemoteDataSource{
  Future<List<ProductModel>> getProducts();
}
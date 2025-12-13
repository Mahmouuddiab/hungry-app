import 'package:hungry_app/features/home/data/dataSource/home_remote_data_source.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';
import 'package:hungry_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  Future<List<ProductEntity>> getProducts() async {
    final model = await homeRemoteDataSource.getProducts();
    return model
        .map(
          (e) => ProductEntity(
            id: e.id!,
            name: e.name!,
            description: e.description!,
            image: e.image!,
            rating: e.rating!,
            price: e.price!,
          ),
        ).toList();
  }
}

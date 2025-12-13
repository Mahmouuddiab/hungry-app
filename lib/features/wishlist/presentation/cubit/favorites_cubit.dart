import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_states.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  void toggleFavorite(ProductEntity product) {
    // Get the current list of favorites.
    final currentFavorites =
    state is FavoritesLoaded ? (state as FavoritesLoaded).favoriteProducts : [];

    // Create a new list to avoid modifying the current state directly.
    final newFavorites = List<ProductEntity>.from(currentFavorites);

    // Check if the product is already in the list.
    if (newFavorites.any((p) => p.id == product.id)) {
      // Remove it if it exists.
      newFavorites.removeWhere((p) => p.id == product.id);
    } else {
      // Add it if it doesn't.
      newFavorites.add(product);
    }

    // Emit the new state with the updated list of favorites.
    emit(FavoritesLoaded(newFavorites));
  }

  bool isFavorite(ProductEntity product) {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).favoriteProducts.any((p) => p.id == product.id);
    }
    return false;
  }
}

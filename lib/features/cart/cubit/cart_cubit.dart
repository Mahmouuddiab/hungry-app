import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  void addToCart(ProductEntity product) {
    // Get the current list of cart.
    final currentCart =
    state is CartLoaded ? (state as CartLoaded).cartProducts : [];

    // Create a new list to avoid modifying the current state directly.
    final newCart = List<ProductEntity>.from(currentCart);

    // Check if the product is already in the list.
    if (newCart.any((p) => p.id == product.id)) {
      // Remove it if it exists.
      newCart.removeWhere((p) => p.id == product.id);
    } else {
      // Add it if it doesn't.
      newCart.add(product);
    }

    // Emit the new state with the updated list of cart.
    emit(CartLoaded(newCart));
  }

  bool isAddToCart(ProductEntity product) {
    if (state is CartLoaded) {
      return (state as CartLoaded).cartProducts.any((p) => p.id == product.id);
    }
    return false;
  }
}

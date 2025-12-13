import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_cubit.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_states.dart';
import 'package:hungry_app/features/wishlist/presentation/widgets/favorite_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoritesCubit,FavoritesState>(
      builder: (context, state) {
        if(state is FavoritesInitial){
          return Center(child: Text("favorites is empty"),) ;
        }
        if(state is FavoritesLoaded){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title: Text("Wishlist",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
              ),),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: state.favoriteProducts.length,
              itemBuilder: (context, index) {
                var favorite = state.favoriteProducts[index];
                return FavoriteItem(product: favorite) ;
              },
            ),
          ) ;
        }
        return SizedBox() ;
      },
    ) ;
  }
}

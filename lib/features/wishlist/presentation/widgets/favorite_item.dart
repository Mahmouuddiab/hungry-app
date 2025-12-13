import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_cubit.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_states.dart';

class FavoriteItem extends StatelessWidget {
  ProductEntity product;
  FavoriteItem({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit,FavoritesState>(
        builder: (context, state) {
          final cubit = context.read<FavoritesCubit>();
          return ListTile(
            leading: Image.network(product.image,width: 70,height: 70,),
            title: Text(product.name,style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(product.description,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
            trailing: IconButton(
                onPressed: (){
                  cubit.toggleFavorite(product);
                },
                icon: Icon(Icons.delete_forever,color: AppColors.red,size: 31,)),
          ) ;
        },
    );
  }
}

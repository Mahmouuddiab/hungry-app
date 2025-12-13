import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_cubit.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_states.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductItem extends StatelessWidget {
  ProductEntity productEntity;
  ProductItem({
    super.key,
    required this.productEntity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.grey.shade200,
              Colors.grey.shade300,
              Colors.grey.shade400,
            ]
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child:Image.network(productEntity.image,height: 100,width: 100,fit: BoxFit.cover,)),
          SizedBox(height: 5,),
          CustomText(text: productEntity.name,color: AppColors.primary,fontSize: 17,fontWeight: FontWeight.bold,),
          SizedBox(height: 5,),
          CustomText(text: productEntity.description,flow: TextOverflow.ellipsis,color: AppColors.black,fontSize: 14,),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.star,color: AppColors.yellow,size: 28,),
              SizedBox(width: 3,),
              CustomText(text: "${productEntity.rating}",fontWeight: FontWeight.bold,fontSize: 15,color: AppColors.primary,),
              Spacer(),
              BlocBuilder<FavoritesCubit,FavoritesState>(
                  builder: (context, state) {
                    final cubit= context.read<FavoritesCubit>();
                    final isFavorite = cubit.isFavorite(productEntity);
                    return IconButton(
                        onPressed: (){
                          cubit.toggleFavorite(productEntity);
                        },
                        icon: Icon(Icons.favorite,color:isFavorite? AppColors.primary:AppColors.gray,size: 28,)) ;
                  },
              )
            ],
          )

        ],
      ),
    );
  }
}
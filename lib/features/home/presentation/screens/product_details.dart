import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';
import 'package:hungry_app/features/home/presentation/widgets/side.dart';
import 'package:hungry_app/shared/custom_snackbar.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity product;
  ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              text: product.name,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.primary,
            ),
          ),
          Center(
            child: Image.network(
              product.image,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              text: "Description:",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              text: product.description,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              text: "Side Options:",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 15,),
          Expanded(child:
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12,),
            itemCount: SideModel.sides.length,
              itemBuilder: (context, index) {
                final side = SideModel.sides[index];
                return Image.asset(side.image,fit: BoxFit.cover,) ;
              },
          )
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 12),
                    CustomText(
                      text: "Burger Price:",
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "${product.price} EGP",
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                BlocBuilder<CartCubit,CartStates>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<CartCubit>().addToCart(product);
                          CustomSnackBar.success(context, "Added to Cart");
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(),
                        ),
                        child: CustomText(
                          text: "Add to Cart",
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ) ;
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

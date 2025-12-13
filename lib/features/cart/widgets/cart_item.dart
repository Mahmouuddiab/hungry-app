import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/home/domain/entity/product_entity.dart';
import 'package:hungry_app/shared/custom_text.dart';


class CartItem extends StatefulWidget {
  ProductEntity product;

   CartItem({super.key,required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
     int number=1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 10,
      shadowColor: Colors.grey,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Image.network(widget.product.image,height: 90,width: 90,fit: BoxFit.cover,),
                    CustomText(
                      text: "\$ ${widget.product.price * number}".toString(),
                      fontWeight: FontWeight.bold,)
                  ],
                ),
                CustomText(text: widget.product.name,fontSize: 14,fontWeight: FontWeight.bold,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary
                      ),
                      child: IconButton(
                          onPressed: (){
                            setState(() {
                              number++;
                            });
                          },
                          icon: Icon(CupertinoIcons.add,color: AppColors.white,)),
                    ),
                    CustomText(text:number.toString(),fontWeight: FontWeight.bold,),
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary
                      ),
                      child: IconButton(
                          onPressed: (){
                            setState(() {
                              if(number>1){
                                number--;
                              }
                            });
                          },
                          icon: Center(child: Icon(CupertinoIcons.minus,color: AppColors.white,))),
                    )
                  ],
                ),
                BlocBuilder<CartCubit,CartStates>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: (){
                          context.read<CartCubit>().addToCart(widget.product);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(),
                        ),
                        child: CustomText(text: "Remove",color: AppColors.white,fontWeight: FontWeight.bold,)) ;
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

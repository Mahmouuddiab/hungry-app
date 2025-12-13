import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/cart/widgets/cart_item.dart';
import 'package:hungry_app/features/payment/payment_screen.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
      builder: (context, state) {
        if(state is CartInitial){
          return Center(child: Text("cart is empty"),) ;
        }
        if(state is CartLoaded){
          return Scaffold(
            appBar: AppBar(
              title: CustomText(text: "Cart",fontWeight: FontWeight.bold,color: AppColors.primary,),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: state.cartProducts.length,
              itemBuilder: (context, index) {
                final product= state.cartProducts[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                  },
                    child: CartItem(product: product)) ;
              },
            ),
          ) ;
        }

        return SizedBox() ;
      },
    );
  }
}

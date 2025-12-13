import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/cubit/cart_states.dart';
import 'package:hungry_app/features/cart/screen/cart_screen.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/home_states.dart';
import 'package:hungry_app/features/home/presentation/screens/product_details.dart';
import 'package:hungry_app/features/home/presentation/widgets/category.dart';
import 'package:hungry_app/features/home/presentation/widgets/food_category.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_item.dart';
import 'package:hungry_app/shared/custom_text.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   HomeCubit homeCubit = getIt<HomeCubit>();
   List category = ['All', 'Combo', 'Sliders', 'Classic', 'Hot'];
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35,),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "what do you search for?",
                    hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.primary),
                    isDense: true,
                    suffixIcon: Icon(Icons.search,size: 30,color: AppColors.primary,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppColors.primary,width: 1.3)
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              BlocBuilder<CartCubit,CartStates>(
                builder: (context, state) {
                  if(state is CartLoaded){
                    return Badge(
                      backgroundColor: AppColors.red,
                      alignment: Alignment.topCenter,
                      label: CustomText(text: "${state.cartProducts.length}",fontSize: 14,fontWeight: FontWeight.bold,),
                      child: IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                          },
                          icon: Icon(Icons.shopping_cart,color: AppColors.primary,size: 31,)),
                    ) ;
                  }
                  return SizedBox() ;
                },
              )
            ],
          ),
          SizedBox(height: 30,),
          FoodCategory(selectedIndex: selectedIndex, category: category),
          SizedBox(height: 10,),
          BlocBuilder<HomeCubit,HomeStates>(
              bloc: homeCubit..getProducts(),
            builder: (context, state) {
              if(state is HomeLoadingState){
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ) ;
              }
              if(state is HomeSuccessState){
                return Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.73
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product= state.products[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product),));
                          },
                            child: ProductItem(productEntity: product)
                        )  ;
                      },
                  ),
                ) ;
              }
              if(state is HomeErrorState){
                return Center(child: CustomText(text: state.error,),) ;
              }
              return SizedBox() ;
            },
          ),
        ],
      ),
    );
  }
}

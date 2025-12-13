import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:hungry_app/features/layout/presentation/cubit/layout_states.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({super.key});
   LayoutCubit cubit =LayoutCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit,LayoutStates>(
        bloc: cubit,
        builder: (context, state) => Scaffold(
          body: cubit.tabs[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => cubit.changeBottomNavIndex(value),
            currentIndex: cubit.currentIndex,
              backgroundColor: AppColors.primary,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.yellow,
              unselectedItemColor: AppColors.white,
              iconSize: 30,
              elevation: 0,
              selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold
              ),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold
              ),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Wishlist"),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
              ]
          ),
        ),
    );
  }
}

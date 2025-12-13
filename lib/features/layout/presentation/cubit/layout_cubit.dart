import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/presentation/screens/home_screen.dart';
import 'package:hungry_app/features/layout/presentation/cubit/layout_states.dart';
import 'package:hungry_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:hungry_app/features/wishlist/presentation/screens/wishlist_screen.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(LayoutInitialState());
  int currentIndex = 0;
  List<Widget> tabs = [HomeScreen(),WishlistScreen(),ProfileScreen()];
  void changeBottomNavIndex(int selectedIndex){
    currentIndex = selectedIndex;
    emit(ChangeBottomNavIndex());
  }
}
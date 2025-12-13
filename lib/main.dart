import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/cart/cubit/cart_cubit.dart';
import 'package:hungry_app/features/wishlist/presentation/cubit/favorites_cubit.dart';
import 'core/di/di.dart';
import 'features/auth/presentation/screens/register_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit(),),
        BlocProvider(create: (context) => CartCubit(),)
      ],
      child: MaterialApp(
        title: 'Hungry App',
        debugShowCheckedModeBanner: false,
        home: RegisterScreen()
      ),
    );
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_eco_task/screens/products_ui_screen.dart';


import 'core/network/dio_helper.dart';
import 'core/network/observal.dart';


void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ProductsScreen.routeName: (context) => const ProductsScreen(),
      },
      initialRoute: ProductsScreen.routeName,
    );
  }
}

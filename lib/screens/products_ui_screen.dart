import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:route_eco_task/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_eco_task/cubit/product_state.dart';

import '../core/custom_textfield.dart';
import '../core/strings.dart';


class ProductsScreen extends StatelessWidget {
  static const String routeName = "ProductsScreen";

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();
          final products = cubit.products;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Image.asset("assets/images/Route 5.png"),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  CustomTextfield(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .75),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: borderSide,
                              left: borderSide,
                              top: borderSide,
                              bottom: borderSide,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.transparent,
                          ),
                          child: Column(

                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                    color: Colors.grey,


                                  ),

                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.network(
                                          products[index].images[0],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    color: Colors.white),
                                                child: ImageIcon(
                                                  AssetImage(
                                                      "assets/images/..png"),
                                                  color: Colors.blueAccent,
                                                  size: 30,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9,right: 3,left: 3),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index].title,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        products[index].description,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('EGP ${products[index].price}'),
                                          SizedBox(width: 10,),
                                          Text(
                                            "${(products[index].price + products[index].price * products[index].discountPercentage / 100).toStringAsFixed(2).replaceAll('.', ',')}EGP",
                                            style: TextStyle(fontSize: 12,
                                                decoration:
                                                TextDecoration.lineThrough,
                                                decorationColor:
                                                Colors.blueAccent,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              "Review (${products[index].rating.toStringAsFixed(1)})"),
                                          ImageIcon(
                                            AssetImage(
                                                "assets/images/🦆 emoji _white medium star_.png"),
                                            color: Colors.yellow,
                                          ),
                                          Spacer(),
                                          ImageIcon(
                                            AssetImage(
                                                "assets/images/🦆 icon _plus circle_.png"),size: 29,
                                            color: Colors.blueAccent,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

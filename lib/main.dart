import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/provider/cart_provider.dart';
import 'package:my_coffee_delivery/views/on_boarding/on_boarding_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: const MaterialApp(
      title: "My coffee delivery",
      home: OnBoardingView(),
    ),
  ));
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'pages/product_list_page.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart'; // ✅ tetap dipakai

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Online',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(), // ✅ tampilkan HomePage saat app dijalankan
      routes: {
        '/cart': (_) => const CartPage(),
        '/material': (_) => const ProductListPage(category: 'material'),
        '/sembako': (_) => const ProductListPage(category: 'sembako'),
      },
    );
  }
}

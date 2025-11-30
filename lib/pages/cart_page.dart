import 'package:flutter/material.dart';
import '../cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Cart();

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: cart.items.isEmpty
          ? const Center(child: Text('Keranjang kosong'))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final item = cart.items[i];
                return ListTile(
                  leading: Image.asset(item.product.image, width: 50),
                  title: Text(item.product.name),
                  subtitle: Text('Jumlah: ${item.quantity}'),
                  trailing: Text('Rp ${(item.product.price * item.quantity).toStringAsFixed(0)}'),
                );
              },
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}

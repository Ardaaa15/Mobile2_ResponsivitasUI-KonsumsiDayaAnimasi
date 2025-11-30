import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductListPage extends StatelessWidget {
  final String category;
  const ProductListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter produk berdasarkan kategori
    final filteredProducts =
        demoProducts.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context); // ✅ kembali ke HomePage
          },
        ),
        title: Text(
          category == 'material' ? 'Material Bangunan' : 'Sembako',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filteredProducts.isEmpty
            ? const Center(
                child: Text('Produk belum tersedia.'),
              )
            : GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // tampil 3 kolom di desktop
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: filteredProducts[index]);
                },
              ),
      ),
    );
  }
}

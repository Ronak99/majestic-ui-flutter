import 'package:categories/data/data.dart';
import 'package:categories/models/product.dart';
import 'package:flutter/material.dart';

class CategoriesMainPanel extends StatelessWidget {
  const CategoriesMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xfffffefe),
      child: Column(
        children: [
          _buildFilters(),
          const Expanded(
            child: ProductGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(0, 1),
            blurRadius: 2,
          )
        ],
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            FilterChip(
              label: const Row(
                children: [
                  Text('Filters'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
              onSelected: (_) {},
            ),
            const SizedBox(width: 8),
            FilterChip(
              label: const Row(
                children: [
                  Text('Sort'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
              onSelected: (_) {},
            ),
            const SizedBox(width: 8),
            FilterChip(
              label: const Row(
                children: [
                  Text('Brand'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
              onSelected: (_) {},
            ),
            const SizedBox(width: 8),
            FilterChip(
              label: const Text('Imported'),
              onSelected: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) =>
          ProductCard(product: dummyProducts[index]),
      itemCount: dummyProducts.length,
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              if (product.isPremium)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Premium',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.weight}g${product.pieceCount != null ? ' • ${product.pieceCount} pcs' : ''}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(
                      ' ${product.rating}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' (${product.reviewCount})',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 16, color: Colors.green),
                    Text(
                      ' ${product.deliveryTime} MINS',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'MRP ₹${product.mrp}',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  side: const BorderSide(color: Colors.green),
                ),
                child: const Text('ADD'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

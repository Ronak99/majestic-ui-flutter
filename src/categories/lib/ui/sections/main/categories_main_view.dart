import 'package:categories/data/data.dart';
import 'package:categories/models/filter.dart';
import 'package:categories/models/product.dart';
import 'package:categories/utils/colors.dart';
import 'package:categories/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CategoriesMainPanel extends StatelessWidget {
  const CategoriesMainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
          vertical: 4, horizontal: defaultViewPadding),
      child: Row(
          children: filters
              .map(
                (item) => Container(
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400]!,
                        offset: const Offset(0, 0),
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.only(
                    left: 12,
                    right: item.isDropdown ? 4 : 12,
                    top: item.isDropdown ? 2 : 4,
                    bottom: item.isDropdown ? 2 : 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        item.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (item.isDropdown)
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                        ),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final viewWidth = MediaQuery.of(context).size.width -
        leftPanelWidth -
        (defaultViewPadding * 2);

    return GridView.builder(
      padding: const EdgeInsets.all(defaultViewPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          // Add scrolling if needed
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use minimum space needed
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with aspect ratio
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  color: lightBackgroundColor,
                  // child: Image.network(
                  //   product.imageUrl,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              const SizedBox(height: 8),
              // Product details section
              Column(
                mainAxisSize: MainAxisSize.min, // Use minimum space needed
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomChip(text: '${product.weight}g'),
                      const SizedBox(width: 4),
                      const CustomChip(text: 'Chocolate Chip'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Rating row
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (e) => const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '(30,895)',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Delivery time row
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 10,
                        color: Colors.green[800]!,
                      ),
                      Text(
                        ' ${product.deliveryTime} MINS',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Price row
                  Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                '₹${product.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'MRP ',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                '₹${product.mrp}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;

  const CustomChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: lightBackgroundColor,
      ),
      padding: const EdgeInsets.all(4),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue[900],
          fontWeight: FontWeight.w700,
          fontSize: 9,
        ),
      ),
    );
  }
}

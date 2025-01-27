import 'package:categories/models/category_item.dart';
import 'package:categories/models/product.dart';

final categoryItems = <CategoryItem>[
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'All',
    id: 'all',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Fresh Vegetables',
    id: 'fresh_vegetables',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Fresh Fruits',
    id: 'fruits',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Exotics',
    id: 'exotics',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Coriander & Others',
    id: 'others',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Flowers & Leaves',
    id: 'flowers',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Seasonal',
    id: 'seasonal',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Freshly Cut & Sprouts',
    id: 'cut_and_sprouts',
  ),
  CategoryItem(
    image: 'https://picsum.photos/50',
    name: 'Frozen Veg',
    id: 'frozen_veg',
  ),
];

// Dummy data for demonstration
final dummyProducts = [
  Product(
    name:
        'Cadbury Studio Assorted Flavours Signature Pralines Chocolate Gift Pack',
    imageUrl: 'https://example.com/chocolate1.jpg',
    price: 716,
    mrp: 1000,
    weight: 234,
    pieceCount: '18',
    rating: 4.2,
    reviewCount: 224,
    deliveryTime: 10,
    discount: 28,
    isPremium: true,
  ),
  Product(
    name: 'Kinder Schoko Bons Crispy',
    imageUrl: 'https://example.com/chocolate2.jpg',
    price: 37,
    mrp: 40,
    weight: 22.4,
    rating: 4.8,
    reviewCount: 5690,
    deliveryTime: 10,
    discount: 7,
  ),
  Product(
    name:
        'Cadbury Studio Assorted Flavours Signature Pralines Chocolate Gift Pack',
    imageUrl: 'https://example.com/chocolate1.jpg',
    price: 716,
    mrp: 1000,
    weight: 234,
    pieceCount: '18',
    rating: 4.2,
    reviewCount: 224,
    deliveryTime: 10,
    discount: 28,
    isPremium: true,
  ),
  Product(
    name: 'Kinder Schoko Bons Crispy',
    imageUrl: 'https://example.com/chocolate2.jpg',
    price: 37,
    mrp: 40,
    weight: 22.4,
    rating: 4.8,
    reviewCount: 5690,
    deliveryTime: 10,
    discount: 7,
  ),
  Product(
    name:
        'Cadbury Studio Assorted Flavours Signature Pralines Chocolate Gift Pack',
    imageUrl: 'https://example.com/chocolate1.jpg',
    price: 716,
    mrp: 1000,
    weight: 234,
    pieceCount: '18',
    rating: 4.2,
    reviewCount: 224,
    deliveryTime: 10,
    discount: 28,
    isPremium: true,
  ),
  Product(
    name: 'Kinder Schoko Bons Crispy',
    imageUrl: 'https://example.com/chocolate2.jpg',
    price: 37,
    mrp: 40,
    weight: 22.4,
    rating: 4.8,
    reviewCount: 5690,
    deliveryTime: 10,
    discount: 7,
  ),
];

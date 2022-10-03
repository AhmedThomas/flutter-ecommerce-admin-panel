// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      price: snap['price'],
      quantity: snap['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
      id: 1,
      name: 'T-shirt #1',
      category: 'T-shirts',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      imageUrl:
          'https://img.freepik.com/free-psd/mockup-black-t-shirt-light-beige-background_125540-1410.jpg?w=996&t=st=1663821539~exp=1663822139~hmac=7c7e79eaf6e0e20dd5ed3f052695f308cdcb33b2b9c0c0bdb09e95d20e673d0f',
      price: 199,
      quantity: 10,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: 2,
      name: 'T-shirt #2',
      category: 'T-shirts',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      imageUrl:
          'https://img.freepik.com/free-psd/polo-shirt-mockup_125540-1417.jpg?w=996&t=st=1663821540~exp=1663822140~hmac=388c50df4499e4a9747164e3f9b786309fdfabb2c4b9a6f53d9ba0649dab9598',
      price: 199,
      quantity: 14,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      id: 3,
      name: 'Jeans #1',
      category: 'Jeans',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      imageUrl:
          'https://img.freepik.com/free-photo/jeans_1203-8094.jpg?w=740&t=st=1663822224~exp=1663822824~hmac=bb0d637affac6f0fad03b9b1c67369195940cc2b207e01829e96d0918e59c2a7',
      price: 299,
      quantity: 4,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: 4,
      name: 'Jeans #1',
      category: 'Jeans',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      imageUrl:
          'https://img.freepik.com/free-photo/shopping-textile-black-trousers-white_1203-6504.jpg?w=996&t=st=1663822233~exp=1663822833~hmac=9ec6e260ae695936cc2f4de7742a1e4cc2a8ff9a72ae61c4da92fdcf2ccaca61',
      price: 299,
      quantity: 20,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: 5,
      name: 'Shoes #1',
      category: 'Shoes',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      imageUrl:
          'https://img.freepik.com/free-photo/pair-trainers_144627-3800.jpg?w=740&t=st=1663822413~exp=1663823013~hmac=78eb9f3ccda706052f6ab2cc732f678a4b3f459c9ee51452efadc924b7266b5c',
      price: 499,
      quantity: 21,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      id: 6,
      name: 'Shoes #2',
      category: 'Shoes',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
      imageUrl:
          'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?w=996&t=st=1663822412~exp=1663823012~hmac=bba4a494bfad88f87ac1bd3916e423db13683203c1439b060b034932a0a81fcb',
      price: 499,
      quantity: 9,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}

import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final databaseHelper = SqlDatabase();

  @override
  Widget build(BuildContext context) {
    List<ProductModel>products=[];
    allFavouriteProducts() async {
      products= await databaseHelper.getAllProducts();

    }
    allFavouriteProducts();

    return  Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: GridView.builder(
            // padding: const EdgeInsets.all(10.0),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              childAspectRatio: 2 / 3.6,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return CustomProductWidget(
                onPressedCart: () => {},
                product: product,
              );
            },
          ),
        ),
          
      ],
    );
  }
}

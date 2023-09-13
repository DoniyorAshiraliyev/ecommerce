import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/models/product.dart';
import 'package:ecommerce/presentation/screens/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/category.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../components/category_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Category
        SizedBox(
          height: 50,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Category category = Category.fromJson(categories[index]);
                  return CategoryItem(
                    onTap: () {
                      if (state is HomeSuccessProductState) {
                        if (category.id == state.category) return;
                      }
                      if (category.id == "all") {
                        context.read<HomeBloc>().add(HomeGetAllProduct());
                        return;
                      }
                      context.read<HomeBloc>().add(
                          HomeGetProductWithCategory(category: category.id));
                    },
                    category: category,
                    selectedId: "selectedCategoryId",
                  );
                },
              );
            },
          ),
        ),

        BlocBuilder<HomeBloc, HomeState>(
          bloc: context.read<HomeBloc>(),
          builder: (context, state) {
            return Stack(
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
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return InkWell(
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(product: product),
                            ),
                          )
                        },
                        child: CustomProductWidget(
                          onPressedCart: () => {},
                          product: product,
                        ),
                      );
                    },
                  ),
                ),
                if (state is HomeLoadingState)
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}

class CustomProductWidget extends StatelessWidget {
  final ProductModel product;
  final void Function()? onPressedCart;

  const CustomProductWidget(
      {Key? key,
      required this.onPressedCart,
      required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: 200,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 70,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 173, 254, 230),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "\$${product.price}",
                        style: TextStyle(
                          color: Color.fromARGB(255, 147, 118, 31),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: CachedNetworkImage(
                  width: 100,
                  height: 150,
                  imageUrl: product.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        value: downloadProgress.progress,
                        strokeWidth: 1,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  product.category.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${product.rating.count}"),
                    Text(
                      product.rating.rate.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/models/product.dart';
import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  final ProductModel product;
  final Color color;


  const CustomProductWidget(
      {Key? key,
        required this.product,
        required this.color

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
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
                  color: color.withOpacity(0.3),
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
    );
  }
}

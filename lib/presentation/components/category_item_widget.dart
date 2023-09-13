import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final void Function()? onTap;
  final Category category;
  final String? selectedId;

  const CategoryItem(
      {Key? key,
        required this.onTap,
        required this.category,
        required this.selectedId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        color: selectedId != null && selectedId == category.id
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.onPrimary,
        child: Container(
          height: 55,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.greenAccent.shade100,
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                width: 40,
                imageUrl: category.imageUrl,
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
              const SizedBox(width: 5),
              Text(category.name),
            ],
          ),
        ),
      ),
    );
  }
}
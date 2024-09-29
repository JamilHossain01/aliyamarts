import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aliyamart/controller/category_controller.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final CategoryController _categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _categoryController.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final category = _categoryController.categories[index];

              return InkWell(
                onTap: () {
                  // Handle the tap event here
                },
                child: Column(
                  children: [
                    Image.network(
                      category.categoryImage,
                      width: 47,
                      height: 47,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.categoryName,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

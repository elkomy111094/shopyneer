import 'package:flutter/material.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:size_config/size_config.dart';

class HorizontalGridView extends StatelessWidget {
  final List<Category> categories;

  const HorizontalGridView({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h, // Adjust based on item height
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Two rows
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 30 / 22, // Square items
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
              onTap: () {
                Nav.categoryDetailsPage(context);
              },
              child: CategoryCard(category: category));
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Nav.categoryDetailsPage(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: primary.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.h),
                    child: Picture(
                      category.imageUrl,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    )),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            child: Text(
              category.title,
              overflow: TextOverflow.ellipsis,
              style: getRegularBlack12Style(),
            ),
          ),
        ],
      ),
    );
  }
}

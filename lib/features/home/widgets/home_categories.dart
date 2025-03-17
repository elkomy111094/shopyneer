import 'package:flutter/material.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
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
            child: Stack(
              clipBehavior:
                  Clip.none, // السماح للعناصر بالخروج خارج حدود الـ Stack
              children: [
                // إطار متحرك (Glow Effect) في حال كان العنصر Hot
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: category.title == 'فساتين'
                        ? Border.all(
                            color: Colors.redAccent, width: 2) // Border عند hot
                        : Border.all(color: Colors.transparent, width: 0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000.h),
                      child: Picture(
                        category.imageUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),

                // شريط "HOT" المائل
                if (category.title == 'فساتين')
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Transform.rotate(
                      angle: 0, // لإمالة الشريط
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.h, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.local_fire_department,
                                color: Colors.white,
                                size: 14.sp), // أيقونة اللهب
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
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

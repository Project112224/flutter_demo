import 'package:flutter/material.dart';
import 'package:flutter_demo/util/app_style.dart';

import '../../../bean/categories/category_bean.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.category,
    required this.onTap,
  });

  final CategoryBean? category;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.3),
        border: Border.all(color: Colors.white),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              category?.strCategoryThumb ?? '',
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            ),
            Text(
              category?.strCategory ?? '--',
              style: AppStyle.subTitle,
            ),
            const Divider(color: Colors.white),
            const SizedBox(height: 5),
            Text(
              category?.strCategoryDescription ?? '',
              style: AppStyle.content,
            ),
          ],
        ),
      ),
    );
  }
}

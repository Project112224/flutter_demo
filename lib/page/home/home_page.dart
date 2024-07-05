import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bean/categories/category_bean.dart';
import '../../bloc/home/home_cubit.dart';
import '../../models/get_it_model.dart';
import '../../util/app_color.dart';
import '../../util/app_style.dart';
import '../../util/router/page_name.dart';
import '../../util/router/router_provider.dart';
import 'widgets/category_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColor.main,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Category',
                  style: AppStyle.title,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (_, state) {
                      List<CategoryBean> categories = state.categories ?? [];
                      return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (_, index) {
                          return categories.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : CategoryItem(
                                  category: categories[index],
                                  onTap: () => getIt<RouterProvider>().pushPage(
                                    PageName.detailPage,
                                    context,
                                    blocQuery: {
                                      'category': categories[index].strCategory
                                    },
                                  ),
                                );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

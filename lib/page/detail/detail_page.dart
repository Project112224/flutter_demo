import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bean/search/search_bean.dart';
import '../../models/get_it_model.dart';
import '../../bloc/detail/detail_bloc.dart';
import '../../generated/l10n.dart';
import '../../models/native_method.dart';
import '../../util/app_color.dart';
import '../../util/app_font_config.dart';
import '../../util/restart/restart_widget.dart';
import '../../util/router/router_provider.dart';
import 'widgets/meal_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColor.main,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (_, state) {
              final count = state.category?.length ?? 0;
              return count == 0
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (_, index) {
                        SearchBean? data = state.category?[index];
                        return MealItem(data: data);
                      },
                      itemCount: count,
                    );
            },
          ),
        )),
      ),
    );
  }
}

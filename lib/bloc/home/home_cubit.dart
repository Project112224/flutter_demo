import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bean/categories/category_bean.dart';

import '../../models/get_it_model.dart';
import '../../util/http/app_repository/app_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    getIt<AppRepository>()
        .getCategories()
        .listen((categories) => emit(HomeState(categories: categories)));
  }
}

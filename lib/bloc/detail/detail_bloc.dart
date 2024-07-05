import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../bean/search/search_bean.dart';
import '../../models/get_it_model.dart';
import '../../util/http/app_repository/app_repository.dart';
import '../../util/router/router_provider.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

  final storage = const FlutterSecureStorage();

  DetailBloc(RouteData? data) : super(DetailState()) {

    final query = data?.blocQuery as Map<String, dynamic>?;
    final category = query?['category'];
    debugPrint('File: ${toString()} - category: $category');

    getIt<AppRepository>()
        .getSearch(category)
        .listen((category) => add(InitialEvent(category: category)));

    on<InitialEvent>((event, emit) async {
      emit(state.copyWith(category: event.category));
    });
  }
}

import 'dart:convert';

import '../../../bean/categories/category_bean.dart';
import '../../../bean/search/search_bean.dart';
import '../bean_converter.dart';
import '../service/basic_service.dart';

class AppRepository {
  final BasicService _service = BasicService();

  Stream<List<CategoryBean>> getCategories() {
    return _service.categories().map(
          (response) => BeanConverter.convert<List<CategoryBean>>(
            utf8.decode(response.bodyBytes),
          ),
        );
  }

  Stream<List<SearchBean>> getSearch(String category) {
    return _service.search(category).map(
          (response) => BeanConverter.convert<List<SearchBean>>(
        utf8.decode(response.bodyBytes),
      ),
    );
  }
}

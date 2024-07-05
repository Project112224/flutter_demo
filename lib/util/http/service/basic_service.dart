import 'package:http/http.dart';

import '../api_config.dart';
import '../api_path.dart';
import '../../../models/get_it_model.dart';

class BasicService {
  Stream<Response> categories() =>
      getIt<ApiConfig>().http.get(ApiPath.categories.path()).asStream();

  Stream<Response> search(String category) => getIt<ApiConfig>()
      .http
      .get(ApiPath.search.path(params: {'s': category}))
      .asStream();
}

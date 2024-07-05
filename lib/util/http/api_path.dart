import '../../util/http/api_config.dart';
import '../../models/get_it_model.dart';

enum ApiPath {

  search('search'),
  categories('categories');

  const ApiPath(this.name);

  final String name;

  Uri path({Map<String, dynamic>? params}) {
    String parmString = '';
    if (params != null) {
      parmString = '?';
      for(final key in params.keys) {
        parmString += '$key=${params[key]}';
      }
    }
    final config = getIt<ApiConfig>();
    return Uri.parse('${config.path}$name.php$parmString');
  }
}
import 'package:json_annotation/json_annotation.dart';

part 'category_bean.g.dart';

@JsonSerializable()
class CategoryBean {
  @JsonKey(name: 'idCategory', defaultValue: '')
  String? idCategory;
  @JsonKey(name: 'strCategory', defaultValue: '')
  String? strCategory;
  @JsonKey(name: 'strCategoryThumb', defaultValue: '')
  String? strCategoryThumb;
  @JsonKey(name: 'strCategoryDescription', defaultValue: '')
  String? strCategoryDescription;

  CategoryBean({
    this.idCategory,
    this.strCategory,
    this.strCategoryDescription,
    this.strCategoryThumb,
  });

  factory CategoryBean.fromJson(Map<String, dynamic> json) =>
      _$CategoryBeanFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryBeanToJson(this);
}

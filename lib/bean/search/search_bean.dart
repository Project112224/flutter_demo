import 'package:json_annotation/json_annotation.dart';

part 'search_bean.g.dart';

@JsonSerializable()
class SearchBean {
  @JsonKey(name: 'idMeal', defaultValue: '')
  String? idMeal;
  @JsonKey(name: 'strMeal', defaultValue: '')
  String? strMeal;
  @JsonKey(name: 'strDrinkAlternate', defaultValue: '')
  String? strDrinkAlternate;
  @JsonKey(name: 'strCategory', defaultValue: '')
  String? strCategory;
  @JsonKey(name: 'strArea', defaultValue: '')
  String? strArea;
  @JsonKey(name: 'strInstructions', defaultValue: '')
  String? strInstructions;
  @JsonKey(name: 'strMealThumb', defaultValue: '')
  String? strMealThumb;
  @JsonKey(name: 'strTags', defaultValue: '')
  String? strTags;
  @JsonKey(name: 'strYoutube', defaultValue: '')
  String? strYoutube;
  @JsonKey(name: 'strIngredient1', defaultValue: '')
  String? strIngredient1;
  @JsonKey(name: 'strIngredient2', defaultValue: '')
  String? strIngredient2;
  @JsonKey(name: 'strIngredient3', defaultValue: '')
  String? strIngredient3;
  @JsonKey(name: 'strIngredient4', defaultValue: '')
  String? strIngredient4;
  @JsonKey(name: 'strIngredient5', defaultValue: '')
  String? strIngredient5;
  @JsonKey(name: 'strIngredient6', defaultValue: '')
  String? strIngredient6;
  @JsonKey(name: 'strIngredient7', defaultValue: '')
  String? strIngredient7;
  @JsonKey(name: 'strIngredient8', defaultValue: '')
  String? strIngredient8;
  @JsonKey(name: 'strIngredient9', defaultValue: '')
  String? strIngredient9;
  @JsonKey(name: 'strIngredient10', defaultValue: '')
  String? strIngredient10;
  @JsonKey(name: 'strIngredient11', defaultValue: '')
  String? strIngredient11;
  @JsonKey(name: 'strIngredient12', defaultValue: '')
  String? strIngredient12;
  @JsonKey(name: 'strIngredient13', defaultValue: '')
  String? strIngredient13;
  @JsonKey(name: 'strIngredient14', defaultValue: '')
  String? strIngredient14;
  @JsonKey(name: 'strIngredient15', defaultValue: '')
  String? strIngredient15;
  @JsonKey(name: 'strIngredient16', defaultValue: '')
  String? strIngredient16;
  @JsonKey(name: 'strIngredient17', defaultValue: '')
  String? strIngredient17;
  @JsonKey(name: 'strIngredient18', defaultValue: '')
  String? strIngredient18;
  @JsonKey(name: 'strIngredient19', defaultValue: '')
  String? strIngredient19;
  @JsonKey(name: 'strIngredient20', defaultValue: '')
  String? strIngredient20;
  @JsonKey(name: 'strMeasure1', defaultValue: '')
  String? strMeasure1;
  @JsonKey(name: 'strMeasure2', defaultValue: '')
  String? strMeasure2;
  @JsonKey(name: 'strMeasure3', defaultValue: '')
  String? strMeasure3;
  @JsonKey(name: 'strMeasure4', defaultValue: '')
  String? strMeasure4;
  @JsonKey(name: 'strMeasure5', defaultValue: '')
  String? strMeasure5;
  @JsonKey(name: 'strMeasure6', defaultValue: '')
  String? strMeasure6;
  @JsonKey(name: 'strMeasure7', defaultValue: '')
  String? strMeasure7;
  @JsonKey(name: 'strMeasure8', defaultValue: '')
  String? strMeasure8;
  @JsonKey(name: 'strMeasure9', defaultValue: '')
  String? strMeasure9;
  @JsonKey(name: 'strMeasure10', defaultValue: '')
  String? strMeasure10;
  @JsonKey(name: 'strMeasure11', defaultValue: '')
  String? strMeasure11;
  @JsonKey(name: 'strMeasure12', defaultValue: '')
  String? strMeasure12;
  @JsonKey(name: 'strMeasure13', defaultValue: '')
  String? strMeasure13;
  @JsonKey(name: 'strMeasure14', defaultValue: '')
  String? strMeasure14;
  @JsonKey(name: 'strMeasure15', defaultValue: '')
  String? strMeasure15;
  @JsonKey(name: 'strMeasure16', defaultValue: '')
  String? strMeasure16;
  @JsonKey(name: 'strMeasure17', defaultValue: '')
  String? strMeasure17;
  @JsonKey(name: 'strMeasure18', defaultValue: '')
  String? strMeasure18;
  @JsonKey(name: 'strMeasure19', defaultValue: '')
  String? strMeasure19;
  @JsonKey(name: 'strMeasure20', defaultValue: '')
  String? strMeasure20;
  @JsonKey(name: 'strSource', defaultValue: '')
  String? strSource;
  @JsonKey(name: 'strImageSource', defaultValue: '')
  String? strImageSource;
  @JsonKey(name: 'strCreativeCommonsConfirmed', defaultValue: '')
  String? strCreativeCommonsConfirmed;
  @JsonKey(name: 'dateModified', defaultValue: '')
  String? dateModified;

  SearchBean({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory SearchBean.fromJson(Map<String, dynamic> json) =>
      _$SearchBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBeanToJson(this);
}

part of 'models.dart';

class CategoryRecipe extends Equatable {
  final String category;
  final String keyCategory;

  CategoryRecipe({@required this.category, @required this.keyCategory});

  factory CategoryRecipe.fromJson(Map<String, dynamic> jsonObject) {
    return CategoryRecipe(
        category: jsonObject['category'], keyCategory: jsonObject['key']);
  }

  @override
  List<Object> get props => [
        category,
        keyCategory,
      ];
}

part of 'models.dart';

class CategoryRecipeDetail extends CategoryRecipe {
  final String title;
  final String thumbnail;
  final String key;
  final String times;
  final String portion;
  final String difficult;

  CategoryRecipeDetail(
      {this.title,
      this.thumbnail,
      this.key,
      this.times,
      this.portion,
      this.difficult});

  factory CategoryRecipeDetail.fromJson(Map<String, dynamic> jsonObject) {
    return CategoryRecipeDetail(
      title: jsonObject['title'],
      thumbnail: jsonObject['thumb'],
      key: jsonObject['key'],
      times: jsonObject['times'],
      portion: jsonObject['portion'],
      difficult: jsonObject['dificulty'],
    );
  }
}

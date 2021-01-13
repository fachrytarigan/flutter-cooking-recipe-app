part of 'services.dart';

class RecipeServices {
  static Future<List<CategoryRecipe>> getCategoryRecipes(
      {http.Client client}) async {
    String url =
        "https://masak-apa.tomorisakura.vercel.app/api/categorys/recipes/";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    var data = jsonDecode(response.body);
    List result = data['results'];

    return result.map((e) => CategoryRecipe.fromJson(e)).toList();
  }

  static Future<List<CategoryRecipeDetail>> getCategoryRecipesDetail(String key,
      {http.Client client}) async {
    String url =
        "https://masak-apa.tomorisakura.vercel.app/api/categorys/recipes/$key";

    client ??= http.Client();

    var response = await client.get(url);

    var data = jsonDecode(response.body);

    List result = data['results'];

    return result
        .map((e) => CategoryRecipeDetail.fromJson(e))
        .toList()
        .sublist(0, 7);
  }
}

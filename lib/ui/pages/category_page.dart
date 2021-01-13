part of 'pages.dart';

class CategoryPage extends StatelessWidget {
  final CategoryRecipe categoryRecipe;

  CategoryPage(this.categoryRecipe);
  @override
  Widget build(BuildContext context) {
    List<CategoryRecipeDetail> categoryRecipeDetails;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(categoryRecipe.category),
      ),
      body: Container(
        child: FutureBuilder(
          future: RecipeServices.getCategoryRecipesDetail(
              categoryRecipe.keyCategory),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              categoryRecipeDetails = snapshot.data;
              return ListView.builder(
                itemCount: categoryRecipeDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      right: 20,
                      bottom:
                          (index == categoryRecipeDetails.length - 1) ? 20 : 0,
                    ),
                    child: RecipeCard(categoryRecipeDetails[index]),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

part of 'pages.dart';

class CategoryPage extends StatefulWidget {
  final CategoryRecipe categoryRecipe;

  CategoryPage(this.categoryRecipe);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    List<CategoryRecipeDetail> categoryRecipeDetails;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFff5733),
        title: Text(
          widget.categoryRecipe.category,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: RecipeServices.getCategoryRecipesDetail(
              widget.categoryRecipe.keyCategory),
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
              return Center(
                  child: SpinKitRing(
                color: Colors.deepOrange,
                lineWidth: 5,
                duration: Duration(milliseconds: 700),
              ));
            }
          },
        ),
      ),
    );
  }
}

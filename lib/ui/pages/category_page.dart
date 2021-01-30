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
        color: Colors.grey[100],
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
                      top: 16,
                      left: 20,
                      right: 20,
                      bottom:
                          (index == categoryRecipeDetails.length - 1) ? 20 : 0,
                    ),
                    child: Column(
                      children: [
                        RecipeCard(categoryRecipeDetails[index]),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Divider(
                        //   color: Colors.grey[300],
                        //   thickness: 0.4,
                        //   height: 0,
                        //   indent: 20,
                        //   endIndent: 20,
                        // ),
                      ],
                    ),
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

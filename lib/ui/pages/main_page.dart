part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CategoryRecipe> categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cooking App",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder(
        future: RecipeServices.getCategoryRecipes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            categories = snapshot.data;
            return Container(
              color: Colors.white,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(
                        categories.length,
                        (index) => CategoryCard(
                          categories[index],
                          onTap: () {
                            Get.to(
                              CategoryPage(categories[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryRecipe> categories;
  List<CategoryRecipeDetail> categoriesDetail;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            color: Color(0xFF554AB2),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFA7854),
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, Fachry",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Mau coba resep apa hari ini?",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9B8FFF),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF4A3EAE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      fillColor: Color(0xFF4A3EAE),
                      hintText: "Cari resep kesukaan kamu",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9B8FFF).withOpacity(0.5),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 26,
                        color: Color(0xFF9B8FFF),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -30, 0),
            decoration: BoxDecoration(
              color: Color(0xFFF6F5FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Kategori",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color(0xFF0E0943),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: FutureBuilder(
                    future: RecipeServices.getCategoryRecipes(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        categories = snapshot.data;
                        return Wrap(
                          spacing: 28,
                          runSpacing: 16,
                          children: List.generate(
                            categories.take(8).length,
                            (index) => CategoryCard(
                              categories[index],
                              onTap: () {
                                Get.to(
                                  CategoryPage(categories[index]),
                                  transition: Transition.cupertinoDialog,
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: size.height * 0.5,
                          child: Center(
                              child: SpinKitRing(
                            color: Color(0xFF554AB2),
                            lineWidth: 5,
                            duration: Duration(milliseconds: 700),
                          )),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Resep Populer",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color(0xFF0E0943),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: FutureBuilder(
                    future: RecipeServices.getRecipes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        categoriesDetail = snapshot.data;
                        return Column(
                          children: List.generate(
                              categoriesDetail.take(5).length,
                              (index) => Padding(
                                    padding: EdgeInsets.only(
                                      top: index == 0 ? 0 : 16,
                                    ),
                                    child: RecipeCard(categoriesDetail[index]),
                                  )),
                        );
                      } else {
                        return Container(
                          height: size.height * 0.5,
                          child: Center(
                              child: SpinKitRing(
                            color: Color(0xFF554AB2),
                            lineWidth: 5,
                            duration: Duration(milliseconds: 700),
                          )),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

part of 'pages.dart';

class RecipeDetailPage extends StatelessWidget {
  final CategoryRecipeDetail categoryRecipeDetail;
  const RecipeDetailPage(this.categoryRecipeDetail, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipeDetail recipeDetail;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFff5733),
          ),
          SafeArea(
            child: Container(
              color: Colors.grey[50],
              child: FutureBuilder(
                future:
                    RecipeServices.getRecipeDetail(categoryRecipeDetail.key),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    recipeDetail = snapshot.data;
                    return ListView(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          recipeDetail.thumbnail ??
                                              categoryRecipeDetail.thumbnail),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.grey[50].withOpacity(1),
                                            Colors.grey[700].withOpacity(0.1),
                                          ],
                                          //tileMode: TileMode.clamp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 20,
                                  child: Icon(
                                    MdiIcons.arrowLeft,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            //note: TITLE
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  recipeDetail.title,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xFF333333),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.grey[300].withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: Offset(1, 2),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          recipeDetail.times,
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.grey[300].withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: Offset(1, 2),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.room_service_outlined,
                                          size: 18,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          recipeDetail.servings,
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.grey[300].withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: Offset(1, 2),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.local_dining_outlined,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          recipeDetail.difficult,
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),

                            //note: AUTHOR, DATE PUBLISHED
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${recipeDetail.author.user} - ',
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    recipeDetail.author.datePublished,
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),

                            //note: DESC
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "DESKRIPSI",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Color(0xFFff5722),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                recipeDetail.descInString,
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Color(0xFF444444),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),

                            //note: INGRIDIENTS
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "BAHAN-BAHAN",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Color(0xFFff5722),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: List.generate(
                                  recipeDetail.ingredient.length,
                                  (index) => IngridientCard(
                                      recipeDetail.ingredient[index]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "CARA MEMBUAT",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Color(0xFFff5722),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: List.generate(
                                  recipeDetail.step.length,
                                  (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recipeDetail.step[index],
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          color: Color(0xFF444444),
                                          height: 1.4,
                                        ),
                                      ),
                                      Divider(
                                        thickness: 0.3,
                                        color: Colors.grey,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  {
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
          ),
        ],
      ),
    );
  }
}

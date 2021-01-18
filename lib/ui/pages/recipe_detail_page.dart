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
            color: Colors.deepOrange,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
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
                                      height: 120,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.white.withOpacity(1),
                                            Colors.white.withOpacity(0),
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
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),

                            //note: TIMES, SERVINGS, DIFFICULT
                            // Divider(
                            //   color: Colors.grey,
                            //   thickness: 0.3,
                            //   height: 24,
                            //   indent: 80,
                            //   endIndent: 80,
                            // ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 16,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        recipeDetail.times,
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.room_service_outlined,
                                        size: 18,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        recipeDetail.servings,
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_dining_outlined,
                                        size: 16,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        recipeDetail.difficult,
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            // Divider(
                            //   color: Colors.grey,
                            //   thickness: 0.3,
                            //   height: 24,
                            //   indent: 80,
                            //   endIndent: 80,
                            // ),

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
                              height: 16,
                            ),

                            //note: DESC
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "DESKRIPSI",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                recipeDetail.desc.splitMapJoin(
                                  RegExp(r'[.|!|?]\s'),
                                  onMatch: (m) => m.group(0),
                                  onNonMatch: (n) => n.splitMapJoin(
                                      RegExp(r'[.|!|?]'),
                                      onMatch: (m) => '${m.group(0)}\n\n'),
                                ),

                                // recipeDetail.desc.replaceAllMapped(
                                //   RegExp(r'[.|!|?]\s'),
                                //   (match) => '${match[0]}\n\n',
                                // ),
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Color(0xFF2B2B28),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
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

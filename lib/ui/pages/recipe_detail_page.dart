part of 'pages.dart';

class RecipeDetailPage extends StatefulWidget {
  final CategoryRecipeDetail categoryRecipeDetail;
  const RecipeDetailPage(this.categoryRecipeDetail, {Key key})
      : super(key: key);

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  int pageController;

  @override
  void initState() {
    super.initState();
    pageController = 0;
  }

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
                future: RecipeServices.getRecipeDetail(
                    widget.categoryRecipeDetail.key),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    recipeDetail = snapshot.data;
                    return ListView(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Hero(
                                  tag: widget.categoryRecipeDetail.key,
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            recipeDetail.thumbnail ??
                                                widget.categoryRecipeDetail
                                                    .thumbnail),
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

                            //note: TITLE
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              color: Colors.grey[50],
                              child: Column(
                                children: [
                                  Container(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
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
                                  TimePortionDifficultWidget(
                                      recipeDetail: recipeDetail),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  //note: AUTHOR, DATE PUBLISHED
                                  //AuthorDate(recipeDetail: recipeDetail),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageController = 0;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Deskripsi",
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: pageController == 0
                                                ? Color(0xFF444444)
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          height: 3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          color: pageController == 0
                                              ? Color(0xFFff5722)
                                              : Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageController = 1;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Bahan-Bahan",
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: pageController == 1
                                                ? Color(0xFF444444)
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          height: 4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          color: pageController == 1
                                              ? Color(0xFFff5722)
                                              : Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pageController = 2;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Cara Membuat",
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: pageController == 2
                                                ? Color(0xFF444444)
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          height: 4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          color: pageController == 2
                                              ? Color(0xFFff5722)
                                              : Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: pageController == 0
                                  ? DescPage(recipeDetail: recipeDetail)
                                  : pageController == 1
                                      ? IngridientPage(
                                          recipeDetail: recipeDetail)
                                      : pageController == 2
                                          ? StepPage(recipeDetail: recipeDetail)
                                          : SizedBox(),
                            ),

                            //note: DESC

                            //note: INGRIDIENTS

                            //note: CARA MEMBUAT
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

class AuthorDate extends StatelessWidget {
  const AuthorDate({
    Key key,
    @required this.recipeDetail,
  }) : super(key: key);

  final RecipeDetail recipeDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ditulis oleh ${recipeDetail.author.user}',
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
          // Text(
          //   recipeDetail.author.datePublished,
          //   style: GoogleFonts.lato(
          //     fontSize: 12,
          //     color: Colors.grey[400],
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TimePortionDifficultWidget extends StatelessWidget {
  const TimePortionDifficultWidget({
    Key key,
    @required this.recipeDetail,
  }) : super(key: key);

  final RecipeDetail recipeDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300].withOpacity(0.4),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300].withOpacity(0.3),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300].withOpacity(0.4),
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
    );
  }
}

class StepPage extends StatelessWidget {
  const StepPage({
    Key key,
    @required this.recipeDetail,
  }) : super(key: key);

  final RecipeDetail recipeDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(30),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(1, -3),
          )
        ],
      ),
      child: Column(
        children: [
          Column(
            children: List.generate(
              recipeDetail.step.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    top: 20,
                    bottom: index == recipeDetail.step.length - 1 ? 20 : 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "STEP ${index + 1}",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Colors.deepOrange[300],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipeDetail.stepInString[index] ?? "",
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Color(0xFF444444),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.grey[400],
                            thickness: 0.3,
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IngridientPage extends StatelessWidget {
  const IngridientPage({
    Key key,
    @required this.recipeDetail,
  }) : super(key: key);

  final RecipeDetail recipeDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          //topLeft: Radius.circular(30),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(1, -3),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              recipeDetail.ingredient.length,
              (index) => IngridientCard(recipeDetail.ingredient[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class DescPage extends StatelessWidget {
  const DescPage({
    Key key,
    @required this.recipeDetail,
  }) : super(key: key);

  final RecipeDetail recipeDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(30),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(1, -3),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              recipeDetail.descInString,
              style: GoogleFonts.lato(
                fontSize: 15,
                color: Color(0xFF444444),
                height: 1.4,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

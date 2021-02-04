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
    Size size = MediaQuery.of(context).size;
    RecipeDetail recipeDetail;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF554AB2),
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
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
                                    height: 300,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            recipeDetail.thumbnail ??
                                                widget.categoryRecipeDetail
                                                    .thumbnail),
                                        fit: BoxFit.cover,
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              transform: Matrix4.translationValues(0, -25, 0),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(
                                children: [
                                  Container(
                                    child: SizedBox(
                                      width: size.width - 40 - 10,
                                      child: Text(
                                        recipeDetail.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Color(0xFF0E0943),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TimePortionDifficultWidget(
                                      recipeDetail: recipeDetail),

                                  //note: AUTHOR, DATE PUBLISHED
                                  //AuthorDate(recipeDetail: recipeDetail),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: pageController == 0
                                                ? Color(0xFF0E0943)
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
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
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: pageController == 1
                                                ? Color(0xFF0E0943)
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
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
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: pageController == 2
                                                ? Color(0xFF0E0943)
                                                : Colors.grey[400],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
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

                            //NOTE: DESC

                            //NOTE: INGRIDIENTS

                            //NOTE: CARA MEMBUAT
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
      decoration: BoxDecoration(
        color: Color(0xFFF6F5FF),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: Color(0xFF554AB2),
                ),
                SizedBox(width: 6),
                Text(
                  recipeDetail.times,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.room_service_outlined,
                  size: 16,
                  color: Color(0xFF554AB2),
                ),
                SizedBox(width: 6),
                Text(
                  recipeDetail.servings,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.local_dining_outlined,
                  size: 16,
                  color: Color(0xFF554AB2),
                ),
                SizedBox(width: 6),
                Text(
                  recipeDetail.difficult,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xFFFA7854),
                        fontWeight: FontWeight.w500,
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
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xFF666666),
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
      child: Column(
        children: [
          Container(
            child: Text(
              recipeDetail.descInString,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xFF555555),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

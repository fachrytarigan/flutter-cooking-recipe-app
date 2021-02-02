part of 'widgets.dart';

class RecipeCard extends StatelessWidget {
  final CategoryRecipeDetail categoryRecipeDetail;

  const RecipeCard(this.categoryRecipeDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          // borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey[300].withOpacity(0.6),
          //     blurRadius: 8,
          //     offset: Offset(1, 3),
          //   )
          // ],
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          //highlightColor: Colors.grey[200],
          splashColor: Colors.grey[50].withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Get.to(RecipeDetailPage(categoryRecipeDetail),
                transition: Transition.cupertinoDialog);
          },
          child: Row(
            children: [
              Container(
                width: 95,
                height: 95,
                child: Hero(
                  tag: categoryRecipeDetail.key,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: NetworkImage(categoryRecipeDetail.thumbnail),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categoryRecipeDetail.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0E0943),
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.access_time,
                                color: Color(0xFFFA7854),
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 2),
                            SizedBox(
                              child: Text(
                                categoryRecipeDetail.times,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF555555),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.room_service_outlined,
                                color: Color(0xFFFA7854),
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 2),
                            SizedBox(
                              child: Text(
                                categoryRecipeDetail.portion,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF555555),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.local_dining_outlined,
                                color: Color(0xFFFA7854),
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 2),
                            SizedBox(
                              child: Text(
                                categoryRecipeDetail.difficult,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Color(0xFF555555),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

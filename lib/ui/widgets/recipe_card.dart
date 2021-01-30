part of 'widgets.dart';

class RecipeCard extends StatelessWidget {
  final CategoryRecipeDetail categoryRecipeDetail;

  const RecipeCard(this.categoryRecipeDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.6),
            blurRadius: 8,
            offset: Offset(1, 3),
          )
        ],
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
                padding: EdgeInsets.all(8),
                width: 100,
                height: 100,
                child: Hero(
                  tag: categoryRecipeDetail.key,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(categoryRecipeDetail.thumbnail),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categoryRecipeDetail.title,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.access_time,
                                color: Colors.orange,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: 2),
                            SizedBox(
                              child: Text(
                                categoryRecipeDetail.times,
                                style: GoogleFonts.lato(
                                  fontSize: 11,
                                  color: Color(0xFF444444),
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
                                color: Colors.orange,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: 2),
                            SizedBox(
                              child: Text(
                                categoryRecipeDetail.portion,
                                style: GoogleFonts.lato(
                                  fontSize: 11,
                                  color: Color(0xFF444444),
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
                                color: Colors.orange,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: 2),
                            SizedBox(
                              child: Text(
                                categoryRecipeDetail.difficult,
                                style: GoogleFonts.lato(
                                  fontSize: 11,
                                  color: Color(0xFF444444),
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

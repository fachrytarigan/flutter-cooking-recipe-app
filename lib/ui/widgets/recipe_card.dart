part of 'widgets.dart';

class RecipeCard extends StatelessWidget {
  final CategoryRecipeDetail categoryRecipeDetail;

  const RecipeCard(this.categoryRecipeDetail);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.grey,
        onTap: () {
          Get.to(RecipeDetailPage(categoryRecipeDetail));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(1, 2),
              )
            ],
          ),
          height: 105,
          child: Row(
            children: [
              Container(
                width: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(categoryRecipeDetail.thumbnail),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryRecipeDetail.title,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                          fontSize: 15,
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
                                    fontSize: 10,
                                    color: Color(0xFF444444),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 8),
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
                                    fontSize: 10,
                                    color: Color(0xFF444444),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 8),
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
                                    fontSize: 10,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

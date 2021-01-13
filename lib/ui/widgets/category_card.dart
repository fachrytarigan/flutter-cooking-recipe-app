part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryRecipe category;
  final Function onTap;

  CategoryCard(this.category, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: (MediaQuery.of(context).size.width - 2 * 16 - 16) / 2,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Colors.orange,
              Colors.orange[700],
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400].withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.category,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

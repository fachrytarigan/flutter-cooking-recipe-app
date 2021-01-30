part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryRecipe category;
  final Function onTap;

  CategoryCard(this.category, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 2 * 16 - 16) / 2,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
            color: Colors.grey[300].withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          //highlightColor: Colors.grey[200],
          splashColor: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                category.category,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryRecipe category;
  final Function onTap;

  CategoryCard(this.category, {this.onTap});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: (size.width - 2 * 16 - 3 * 28) / 4,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  if (onTap != null) {
                    onTap();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Image.asset(
                    category.category.contains("Masakan Hari Raya")
                        ? "assets/lantern.png"
                        : category.category.contains("Tradisional")
                            ? "assets/traditional-medicine.png"
                            : category.category.contains("Menu Makan Malam")
                                ? "assets/restaurant.png"
                                : category.category.contains("Menu Makan Siang")
                                    ? "assets/fried-rice.png"
                                    : category.category.contains("Resep Ayam")
                                        ? "assets/chicken-leg.png"
                                        : category.category
                                                .contains("Resep Daging")
                                            ? "assets/meat.png"
                                            : category.category
                                                    .contains("Resep Sayuran")
                                                ? "assets/vegetable.png"
                                                : category.category.contains(
                                                        "Resep Seafood")
                                                    ? "assets/seafood (1).png"
                                                    : "assets/pie (1) 1.png",
                    color: Color(0xFF554AB2),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            width: (size.width - 2 * 16 - 3 * 28) / 4,
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap();
                }
              },
              child: Text(
                category.categoryInString,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0E0943),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

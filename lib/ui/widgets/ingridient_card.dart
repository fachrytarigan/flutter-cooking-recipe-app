part of 'widgets.dart';

class IngridientCard extends StatelessWidget {
  final String ingridient;

  const IngridientCard(this.ingridient, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 2 * 20 - 16) / 2,
      padding: EdgeInsets.all(12),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFF6F6F6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ingridient,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

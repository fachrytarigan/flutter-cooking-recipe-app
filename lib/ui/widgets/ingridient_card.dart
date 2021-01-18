part of 'widgets.dart';

class IngridientCard extends StatelessWidget {
  final String ingridient;

  const IngridientCard(this.ingridient, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 2 * 20 - 12) / 2,
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(1, 2),
          )
        ],
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ingridient,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: Color(0xFF444444),
              fontWeight: FontWeight.w600,
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

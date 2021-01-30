part of 'widgets.dart';

class IngridientCard extends StatelessWidget {
  final String ingridient;

  const IngridientCard(this.ingridient, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 2 * 20 - 16) / 2,
      padding: EdgeInsets.all(8),
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey[300], width: 0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300].withOpacity(0.4),
            blurRadius: 4,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ingridient,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Color(0xFF444444),
              //fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

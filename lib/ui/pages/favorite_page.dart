part of 'pages.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Color(0xFF554AB2),
        ),
        SafeArea(
          child: Container(
            color: Color(0xFFF6F5FF),
            child: Center(
              child: Text("Favorite"),
            ),
          ),
        ),
      ],
    ));
  }
}

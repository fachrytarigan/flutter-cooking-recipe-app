part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF554AB2),
          ),
          SafeArea(
            child: pageOptions.elementAt(_selectedIndex),
          ),
          customNavigationBar(),
        ],
      ),
    );
  }

  List<Widget> pageOptions = [
    HomePage(),
    FavoritePage(),
    Text("Profile"),
  ];

  Widget customNavigationBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(0.4),
                blurRadius: 10,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedLabelStyle:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
            selectedItemColor: Color(0xFFFA7854),
            unselectedItemColor: Color(0xFFAFAFAF),
            selectedFontSize: 13,
            unselectedFontSize: 13,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: "Favorit",
                icon: Icon(Icons.favorite_outline),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.account_circle_outlined),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      );
}

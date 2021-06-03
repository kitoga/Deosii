import 'package:doefii/screens/cards.dart';
import 'package:doefii/screens/dashboard.dart';
import 'package:doefii/screens/profile.dart';
import 'package:doefii/screens/stats.dart';
import 'package:doefii/screens/transfer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  List<Widget> _pages = [
    Dashboard(),
    Transfer(),
    Cards(),
    Stats(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.swap_vert,
          Icons.credit_card,
          Icons.bar_chart,
          Icons.person_outline,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
      body: Container(
        child: _pages[_selectedItem],
      )
    );
  }
}

// starting the customNavbar here//  

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width/5,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          widget.onChange(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7, vertical: 12),
          height: 80,
          width: MediaQuery.of(context).size.width / _iconList.length,
          decoration: BoxDecoration(
                  // border: Border(
                  //   bottom: BorderSide(width: 4, color: Colors.orange),
                  // ),
                  borderRadius: BorderRadius.circular(20),
                  color: index == _selectedIndex ? Color(0xffDFCAC8): Colors.transparent,
                  ),
      
          child: Icon(
            icon,size: 30,
            color: index == _selectedIndex ? Color(0xffbf372a) : Colors.black87,
          ),
        ),
      ),
    );
  }
}


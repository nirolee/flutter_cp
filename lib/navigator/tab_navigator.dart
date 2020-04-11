import 'package:chucp/pages/home_page.dart';
import 'package:chucp/pages/login.dart';
import 'package:chucp/pages/my_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue; 
  int _currentInedx = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          Login(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentInedx,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentInedx = index;
          });
        },
        items:
      [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _defaultColor,),
          activeIcon: Icon(Icons.home, color: _activeColor,),
          title: Text('首页', style: TextStyle(
              color: _currentInedx!=0?_defaultColor:_activeColor,
            )),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: _defaultColor,),
          activeIcon: Icon(Icons.account_circle, color: _activeColor,),
          title: Text('我的', style: TextStyle(
              color: _currentInedx!=1?_defaultColor:_activeColor,
            )),
        ),
      ]
      ),
    );
  }
  
}
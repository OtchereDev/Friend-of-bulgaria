import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Provider/Profile/profile_provider.dart';
import 'package:hackaton/View/Home/home_page.dart';
import 'package:hackaton/View/Home/my_events.dart';
import 'package:provider/provider.dart';

class BaseHomePage extends StatefulWidget {
  const BaseHomePage({super.key});

  @override
  State<BaseHomePage> createState() => _BaseHomePageState();
}

class _BaseHomePageState extends State<BaseHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileProvider>().loadCurrentProfile(context);
    });
    super.initState();

  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MyEventsPage()

    // ProfileNew()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 10,
        selectedFontSize: 10,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            activeIcon: SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/ticket_home.svg",
                color: AppColors.PRIMARYCOLOR,
              ),
            ),
            icon: SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/ticket.svg",
                color: AppColors.ASHDEEP,
              ),
            ),
            label: ('My Tickets'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.PRIMARYCOLOR,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

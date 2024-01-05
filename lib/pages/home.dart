import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/screens/chat_page.dart';
import 'package:flutter_application_1/pages/screens/learn.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_application_1/pages/screens/home_page.dart';
import 'package:flutter_application_1/pages/screens/account.dart';
import 'package:flutter_application_1/pages/screens/detect.dart';
import 'package:flutter_application_1/pages/screens/manage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/pages/auth_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static Route<void> route({bool isRegistering = false}) {
    return MaterialPageRoute(
      builder: (context) => const Home(),
    );
  }
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final _controller = PersistentTabController(initialIndex: 0);


  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _buildScreens() {
        return [
          const HomePage(),
          const ManagePage(),
          DetectPage(),
          const ChatPage(),
          const LearnPage(), 
          const AccountPage()
        ];
    }
    // ignore: no_leading_underscores_for_local_identifiers
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.home),
                title: ("Home"),
                activeColorPrimary: const Color.fromRGBO(64, 212, 0, 1),
                inactiveColorPrimary: const Color.fromARGB(255, 123, 123, 123),
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.grid_view),
                title: ("Manage"),
                activeColorPrimary: const Color.fromRGBO(64, 212, 0, 1),
                inactiveColorPrimary: const Color.fromARGB(255, 123, 123, 123),
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.search),
                title: ("Detect"),
                activeColorPrimary: const Color.fromRGBO(64, 212, 0, 1),
                inactiveColorPrimary: const Color.fromARGB(255, 123, 123, 123),
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.chat_bubble),
                title: ("Conseiller"),
                activeColorPrimary: const Color.fromRGBO(64, 212, 0, 1),
                inactiveColorPrimary: const Color.fromARGB(255, 123, 123, 123),
            ),
            PersistentBottomNavBarItem(
                  icon: const Icon(Icons.book_online),
                  title: ("Apprendre"),
                  activeColorPrimary: const Color.fromRGBO(64, 212, 0, 1),
                  inactiveColorPrimary: const Color.fromARGB(255, 123, 123, 123),
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.account_circle_outlined),
                title: ("Compte"),
                activeColorPrimary: const Color.fromRGBO(64, 212, 0, 1),
                inactiveColorPrimary: const Color.fromARGB(255, 123, 123, 123),
            ),
        ];
    }
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: const Color.fromARGB(255, 246, 246, 246), // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
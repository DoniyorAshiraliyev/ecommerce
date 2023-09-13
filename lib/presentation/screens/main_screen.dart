import 'package:ecommerce/core/service_locator.dart';
import 'package:ecommerce/presentation/screens/basket_screen.dart';
import 'package:ecommerce/presentation/screens/favourites_screen.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_bloc/home_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _currentTap = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7dff7),
      appBar: AppBar(
        title: Text("E-commerce App"),
        centerTitle: true,
        elevation: 1,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          BlocProvider(
            create: (context) => locator<HomeBloc>()..add(HomeGetAllProduct()),
            child: HomeScreen(),
          ),
          FavouritesScreen(),
          BasketScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTap = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentTap = index;
            _pageController!.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          });
        },
        currentIndex: _currentTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart_fill,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.shopping_cart,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

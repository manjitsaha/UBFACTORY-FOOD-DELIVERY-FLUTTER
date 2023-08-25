import 'package:flutter/material.dart';
import 'package:newfigma/cart/cart.dart';
import 'package:newfigma/explore/explore.dart';
import 'package:newfigma/favourite/favourite.dart';
import 'package:newfigma/profile/profile.dart';

import '../core/constant/color.dart';
import 'home.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:  [
                  HomeScreen(),
                  Explore(),
                  Cart(),
                  Favourite(),
                  Profile()
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: TabBar(unselectedLabelColor: Colors.black,
            labelColor: ColorConstant.backgound,
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home_outlined),child: Text('Home',style: TextStyle(fontSize: 10),),),
              Tab(icon: Icon(Icons.search_outlined),child: Text('Explore',style: TextStyle(fontSize: 10))),
              Tab(icon: Icon(Icons.shopping_cart_outlined),child: Text('Cart',style: TextStyle(fontSize: 10))),
              Tab(icon: Icon(Icons.favorite_outline),child: Text('Favourite',style: TextStyle(fontSize: 10))),
              Tab(icon: Icon(Icons.perm_identity),child: Text('Account',style: TextStyle(fontSize: 10))),
            ],
            labelStyle: const TextStyle(fontSize: 12),
            labelPadding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          ),
        ),
      ),
    );
  }
}

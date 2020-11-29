import 'package:flutter/material.dart';
import '../widgets/following_user.dart';
import '../widgets/post_carousel.dart';
import '../data/data.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'FRENZY',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              letterSpacing: 10.0,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          unselectedLabelStyle: TextStyle(
            fontSize: 20.0,
          ),
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
          tabs: [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUser(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Post',
            posts: posts,
          ),
        ],
      ),
    );
  }
}

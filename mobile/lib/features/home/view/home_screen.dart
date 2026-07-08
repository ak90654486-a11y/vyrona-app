import 'package:flutter/material.dart';

import '../widgets/feed_card.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/stories_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [

            HomeHeader(),

            SizedBox(height: 24),

            SearchBarWidget(),

            SizedBox(height: 30),

            Text(
              "Stories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(height: 16),

            StoriesSection(),

            SizedBox(height: 30),

            Text(
              "Latest Feed",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(height: 18),

            FeedCard(),

            FeedCard(),

            FeedCard(),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

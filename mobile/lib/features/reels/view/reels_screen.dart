import 'package:flutter/material.dart';

import '../data/reel_data.dart';
import '../widgets/reel_card.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: PageView.builder(
        scrollDirection: Axis.vertical,

        itemCount: ReelData.reels.length,

        itemBuilder: (context, index) {

          final reel = ReelData.reels[index];

          return ReelCard(
            reel: reel,
          );

        },
      ),
    );
  }
}

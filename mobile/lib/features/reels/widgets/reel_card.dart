import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/reel_model.dart';

class ReelCard extends StatefulWidget {
  final ReelModel reel;

  const ReelCard({
    super.key,
    required this.reel,
  });

  @override
  State<ReelCard> createState() => _ReelCardState();
}

class _ReelCardState extends State<ReelCard> {

  VideoPlayerController? controller;


  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(
      widget.reel.videoUrl,
    )
      ..initialize().then((_) {

        if (mounted) {

          setState(() {});

          controller!
            ..setLooping(true)
            ..play();

        }

      });

  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      child: Stack(

        fit: StackFit.expand,

        children: [

          if (controller != null &&
              controller!.value.isInitialized)

            FittedBox(

              fit: BoxFit.cover,

              child: SizedBox(

                width: controller!.value.size.width,

                height: controller!.value.size.height,

                child: VideoPlayer(controller!),

              ),

            )


          else

            const Center(

              child: CircularProgressIndicator(
                color: Colors.white,
              ),

            ),



          Container(

            decoration: const BoxDecoration(

              gradient: LinearGradient(

                colors: [

                  Colors.transparent,

                  Colors.black87,

                ],

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,

              ),

            ),

          ),



          Positioned(

            left:20,

            bottom:40,

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  "@${widget.reel.username}",

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize:18,

                    fontWeight: FontWeight.bold,

                  ),

                ),


                const SizedBox(height:10),


                Text(

                  widget.reel.caption,

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize:16,

                  ),

                ),


                const SizedBox(height:8),


                Text(

                  "🎵 ${widget.reel.music}",

                  style: const TextStyle(

                    color: Colors.white70,

                  ),

                ),

              ],

            ),

          ),


        ],

      ),

    );

  }



  @override
  void dispose() {

    controller?.dispose();

    super.dispose();

  }

}

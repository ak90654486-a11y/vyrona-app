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

class _ReelCardState extends State<ReelCard>
    with SingleTickerProviderStateMixin {

  VideoPlayerController? videoController;

  bool liked = false;
  bool showHeart = false;

  late AnimationController heartController;
  late Animation<double> heartScale;


  @override
  void initState() {
    super.initState();

    heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    heartScale = CurvedAnimation(
      parent: heartController,
      curve: Curves.easeOut,
    );


    if (widget.reel.videoUrl.isNotEmpty) {

      videoController =
          VideoPlayerController.networkUrl(
            Uri.parse(widget.reel.videoUrl),
          );

      videoController!.initialize().then((_) {

        if (mounted) {

          setState(() {});

          videoController!
            ..setLooping(true)
            ..play();

        }

      });
    }
  }


  void doubleLike() {

    setState(() {
      liked = true;
      showHeart = true;
    });

    heartController.forward(from: 0);


    Future.delayed(
      const Duration(milliseconds: 900),
      () {

        if (mounted) {

          setState(() {
            showHeart = false;
          });

        }

      },
    );

  }



  void openShare() {

    showModalBottomSheet(
      context: context,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),

      builder: (_) {

        return SizedBox(
          height: 260,

          child: Column(
            children: [

              const SizedBox(height:20),

              const Text(
                "Share Reel",
                style: TextStyle(
                  fontSize:22,
                  fontWeight:FontWeight.bold,
                ),
              ),

              const ListTile(
                leading: Icon(Icons.person),
                title: Text("Send to friend"),
              ),

              const ListTile(
                leading: Icon(Icons.link),
                title: Text("Copy link"),
              ),

            ],
          ),
        );

      },
    );

  }



  Widget actionButton(
    IconData icon,
    String title,
    VoidCallback tap,
  ) {

    return GestureDetector(

      onTap: tap,

      child: Column(
        children: [

          Container(

            height:52,
            width:52,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: Colors.white,
              size:28,
            ),

          ),

          const SizedBox(height:6),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize:12,
            ),
          ),

        ],
      ),
    );

  }



  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onDoubleTap: doubleLike,

      child: Stack(

        fit: StackFit.expand,

        children: [

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Color(0xff4F46E5),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),



          if (showHeart)

            Center(

              child: ScaleTransition(

                scale: heartScale,

                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size:130,
                ),

              ),

            ),



          Positioned(

            right:18,
            bottom:120,

            child: Column(

              children:[

                actionButton(
                  liked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  "Like",
                  () {

                    setState(() {
                      liked = !liked;
                    });

                  },
                ),


                const SizedBox(height:20),


                actionButton(
                  Icons.chat_bubble_outline,
                  "Comment",
                  () {},
                ),


                const SizedBox(height:20),


                actionButton(
                  Icons.repeat,
                  "Repost",
                  () {},
                ),


                const SizedBox(height:20),


                actionButton(
                  Icons.send,
                  "Share",
                  openShare,
                ),


                const SizedBox(height:20),


                actionButton(
                  Icons.bookmark_outline,
                  "Save",
                  () {},
                ),

              ],

            ),

          ),



          Positioned(

            left:20,
            bottom:40,

            child:Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children:[

                Text(
                  "@${widget.reel.username}",
                  style:const TextStyle(
                    color:Colors.white,
                    fontSize:18,
                    fontWeight:FontWeight.bold,
                  ),
                ),


                const SizedBox(height:10),


                Text(
                  widget.reel.caption,
                  style:const TextStyle(
                    color:Colors.white,
                    fontSize:16,
                  ),
                ),


                const SizedBox(height:8),


                Text(
                  "🎵 ${widget.reel.music}",
                  style:const TextStyle(
                    color:Colors.white70,
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
  void dispose(){

    videoController?.dispose();
    heartController.dispose();

    super.dispose();

  }

}

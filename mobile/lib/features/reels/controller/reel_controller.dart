import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelController {

  VideoPlayerController? controller;


  Future<void> initialize(String videoUrl) async {

    controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    );

    await controller!.initialize();

    controller!.setLooping(true);

    controller!.play();
  }


  void pause() {
    controller?.pause();
  }


  void play() {
    controller?.play();
  }


  void dispose() {
    controller?.dispose();
  }

}

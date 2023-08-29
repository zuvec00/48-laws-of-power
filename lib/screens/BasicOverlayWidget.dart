import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  final controller;
  BasicOverlayWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      buildPlay(),
      buildIndicator(),
      
    ]);
  }

  Widget buildIndicator() => VideoProgressIndicator(controller,
      allowScrubbing: true,
      padding: EdgeInsets.all(8),
      colors: VideoProgressColors(
        playedColor: Colors.grey.shade300,
        backgroundColor: Colors.brown.shade500,
      ));

  Widget buildPlay() {
    return controller.value.isPlaying
        ? Container()
        : Container(
            alignment: Alignment.center,
            color: Colors.black26,
            child: Icon(Icons.play_arrow_rounded,
                size: 70, color: Colors.grey[200]));
  }
}

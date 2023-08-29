import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laws_of_power/screens/BasicOverlayWidget.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:video_player/video_player.dart';

class Law1 extends StatefulWidget {
  VoidCallback taskCompletedHandler;
  String lawsAssets;
  String lawsSummary;
  Law1(
      {required this.lawsAssets,
      required this.lawsSummary,
      required this.taskCompletedHandler});

  @override
  State<Law1> createState() => _Law1State();
}

class _Law1State extends State<Law1> with SingleTickerProviderStateMixin {
  late final asset = widget.lawsAssets;
  late final lawsSum = widget.lawsSummary;
  late VideoPlayerController _controller;
  late AnimationController _animationContorller;

  @override
  void initState() {
    super.initState();
    _animationContorller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  bool added = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(161, 136, 127, 1),
        body: PageView(
            controller: PageController(),
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                _controller.pause();
              });
            },
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: _controller != null && _controller.value.isInitialized
                    ? buildVideo()
                    : Center(
                        child:
                            CircularProgressIndicator(color: Colors.grey[200]),
                      ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('N e v e r  O u t s h i n e  T h e  M a s t e r',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        Divider(
                          thickness: 1,
                          indent: 12,
                          endIndent: 12,
                          color: Colors.brown[100],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            lawsSum,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: Color.fromRGBO(141, 110, 99, 1)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (added == false) {
                                _animationContorller.forward();
                                added = true;
                              } else {
                                _animationContorller.reverse();
                                added = false;
                              }
                            });
                          },
                          child: Lottie.asset(
                            'assets/bookmark4.json',
                            controller: _animationContorller,
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SlideAction(
                    text: 'Slide to mark done',
                    textStyle: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                    elevation: 0,
                    height: 50,
                    sliderButtonIconSize: 16,
                    sliderButtonIconPadding: 14,
                    borderRadius: 15,
                    outerColor: Colors.brown[400],
                    innerColor: Colors.grey[200],
                    submittedIcon:
                        Icon(Icons.check_rounded, color: Colors.grey[200]),
                    onSubmit: widget.taskCompletedHandler,
                  ),
                ))
              ])
            ]));
  }

  Widget buildVideo() {
    return GestureDetector(
      onTap: () {
        _controller.value.isPlaying ? _controller.pause() : _controller.play();
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned.fill(child: buildVideoPlayer()),
          Positioned.fill(child: BasicOverlayWidget(controller: _controller)),
          SafeArea(
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: Navigator.of(context).pop,
                color: Colors.grey[200],
                iconSize: 30),
          ),
        ],
      ),
    );
  }

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

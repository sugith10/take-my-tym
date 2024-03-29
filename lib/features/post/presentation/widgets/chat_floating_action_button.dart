import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class ChatFloatingActionButton extends StatefulWidget {
  final VoidCallback callBack;

  const ChatFloatingActionButton({
    required this.callBack,
    super.key,
  });

  @override
  State<ChatFloatingActionButton> createState() =>
      _ChatFloatingActionButtonState();
}

class _ChatFloatingActionButtonState extends State<ChatFloatingActionButton>
    with SingleTickerProviderStateMixin {
  final MyAppDarkColor _appDarkColor = MyAppDarkColor();
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 20,
        ));

    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.centerLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.topRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomLeft, end: Alignment.centerLeft),
        weight: 1,
      ),
    ]).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.centerRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween:
            Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
            begin: Alignment.topRight, end: Alignment.centerRight),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _appDarkColor;
    _controller.dispose();
    _topAlignmentAnimation;
    _bottomAlignmentAnimation;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _appDarkColor.gradientPrimary,
                    _appDarkColor.gradientSecondary,
                  ],
                  begin: _topAlignmentAnimation.value,
                  end: _bottomAlignmentAnimation.value,
                ),
                borderRadius: BorderRadius.circular(
                  MyAppRadius.borderRound,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _appDarkColor.boxShadow,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1.5),
                  ),
                ]),
            child: FloatingActionButton.extended(
              onPressed: () {
                widget.callBack();
              },
              label: Row(
                children: [
                  const CircleProfilePicWidget(
                    height: 30,
                    width: 30,
                    image: MyAppImages.testProfile,
                  ),
                  SizedBox(width: 10.w),
                  const Text("Chat"),
                ],
              ),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                MyAppRadius.borderRound,
              )),
            ),
          );
        });
  }
}

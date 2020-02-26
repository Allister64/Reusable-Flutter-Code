import 'package:flutter/material.dart';

class ReverseScaleAnimation extends StatefulWidget {
  final Widget child;

  ReverseScaleAnimation({Key key, this.child}) : super(key: key);

  @override
  _ReverseScaleAnimationState createState() => _ReverseScaleAnimationState();
}

class _ReverseScaleAnimationState extends State<ReverseScaleAnimation> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
      lowerBound: .0,
      upperBound: .03,
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Transform.scale(
            scale: _scale,
            child: Container(child: widget.child)
        )
    );
  }


  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }
}
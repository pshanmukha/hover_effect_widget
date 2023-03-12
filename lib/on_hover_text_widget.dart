import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverText extends StatefulWidget {
  const OnHoverText({Key? key, required this.hoveredTransform, required this.builder}) : super(key: key);

  final Matrix4 hoveredTransform;
  final Widget Function(bool isHovered) builder;

  @override
  _OnHoverTextState createState() => _OnHoverTextState();
}

class _OnHoverTextState extends State<OnHoverText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    //Matrix4.identity() --> No change
    //Matrix4.identity()..scale(1.1) --> transform 110%
    //Matrix4.identity()..translate(0,0,0) -->translate x,y,z coordinates in pixels(z will not work)
    //Matrix4.identity()..translate(0,0,0)..scale(1.1) --> even we chain both
    final hoveredTransform = widget.hoveredTransform;
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: const Duration(milliseconds: 200),
        transform: transform, //to scale widget up or down
        child: widget.builder(isHovered),),
    );
  }

  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
}

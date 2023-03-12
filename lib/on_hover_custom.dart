import 'package:flutter/material.dart';

class OnHoverCustom extends StatefulWidget {
  const OnHoverCustom({Key? key, required this.child, required this.hoveredTransform}) : super(key: key);

  final Widget child;
  final Matrix4 hoveredTransform;

  @override
  _OnHoverCustomState createState() => _OnHoverCustomState();
}

class _OnHoverCustomState extends State<OnHoverCustom> {
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
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform, //to scale widget up or down
          child: widget.child,),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}

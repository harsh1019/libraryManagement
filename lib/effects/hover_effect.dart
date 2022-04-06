import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final Widget child;
  final Color color;
  const HoverEffect({Key? key, required this.child,required this.color}) : super(key: key);

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isHovered ? widget.color : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: widget.child,
        duration: const Duration(milliseconds: 200),
        transform: transform,
      ),
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
    );
  }

  onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}

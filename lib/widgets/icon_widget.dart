import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final double radius;
  final double size;
  final double padding;
  final VoidCallback function;

  const IconWidget(
      {Key? key,
      required this.icon,
      required this.color,
      this.radius = 8,
      this.size = 24,
      this.padding = 8,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: IconButton(
        onPressed: function,
        icon: SvgPicture.asset(icon, color: Colors.white, fit: BoxFit.scaleDown),
        constraints: const BoxConstraints(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants.dart';
import './icon_widget.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? function;
  const AppBarWidget({Key? key, required this.title, required this.icon, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        IconWidget(icon: icon, color: secondaryDark, function: function ?? (){},),
      ],
    );
  }
}

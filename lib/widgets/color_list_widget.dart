import 'package:flutter/material.dart';

class ColorListWidget extends StatefulWidget {
  bool onEditingMode;
  final int? color;
  final Function(int? color)? pickedColor;
  ColorListWidget({Key? key, this.onEditingMode = false, this.color, this.pickedColor}) : super(key: key);

  @override
  State<ColorListWidget> createState() => _ColorListWidgetState();
}

class _ColorListWidgetState extends State<ColorListWidget> {
  var _currentSelectedIndex = 0;

  final List<Color> _colors = const [
    Color(0xffa29cf4),
    Color(0xfff4717f),
    Color(0xffafe4ee),
    Color(0xff9de47c),
    Color(0xffdc9cfd),
    Color(0xfffceecb),
    Color(0xfff3954f),
    Color(0xff21c392),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: List.generate(8, (index) {
        return InkWell(
          onTap: () {
            if(widget.pickedColor != null) {
              widget.pickedColor!(_colors[index].value);
            }
            setState(() {
              widget.onEditingMode = false;
              _currentSelectedIndex = index;
            });
          },
          child: ColorWidget(color: _colors[index], isSelected: widget.onEditingMode ? _colors[index].value == widget.color : _currentSelectedIndex == index),
        );
      }),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorWidget({Key? key, required this.color, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 9, bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
      width: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: isSelected ? Border.all(color: Colors.white, width: 1.5) : null,
        color: color,
      ),
    );
  }
}

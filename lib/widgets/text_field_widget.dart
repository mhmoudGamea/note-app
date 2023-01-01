import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final int maxLines;
  final String? suffixIcon;
  final Function(String? value)? onSaved;
  final Function(String value)? onChange;
  final Function(String? value)? datePicker;


  TextFieldWidget({Key? key, required this.hint, this.maxLines = 1, this.suffixIcon, this.onSaved, this.onChange, this.datePicker}) : super(key: key);

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      cursorColor: Colors.grey.shade600,
      style: Theme.of(context).textTheme.subtitle2,
      maxLines: maxLines,
      readOnly: suffixIcon != null ? true : false,
      validator: (value) {
        if(value!.isEmpty){
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChange,
      onSaved: onSaved,
      onTap: suffixIcon == null ? null : () {
        showDate(context);
      },
      decoration: buildInputDecoration(),
    );
  }
  void showDate(BuildContext context) async{
      DateTime? value = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime.now());
      _controller.text = DateFormat.yMMMd().format(value ?? DateTime.now());
      datePicker!(_controller.text);
    }
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: buildOutlineInputBorder(color: Colors.grey),
      focusedBorder: buildOutlineInputBorder(color: Colors.green),
      enabledBorder: buildOutlineInputBorder(color: Colors.grey),
      errorBorder: buildOutlineInputBorder(color: Colors.red),
      errorStyle: const TextStyle(fontSize: 12, color: Colors.red, letterSpacing: 1.1, fontFamily: 'Nunito'),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade600),
      suffixIcon: suffixIcon != null ? SvgPicture.asset(suffixIcon!, color: Colors.grey, fit: BoxFit.scaleDown) : null,
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: color, width: 1.5));
  }
}

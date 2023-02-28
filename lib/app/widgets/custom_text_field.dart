import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gluon/app/constan/string_constan/string_constant.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final Function? onChanged;
  final FocusNode focusNode;
  final TextEditingController inputController;

  CustomTextField({
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.focusNode,
    required this.inputController,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showTooltip = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.inputController,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            hintText: widget.hint,
            errorStyle: TextStyle(height: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _showTooltip ? Colors.red : Colors.blue,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            suffixIcon: widget.inputController.text.isEmpty ? Tooltip(
              message: '${widget.label} ${StringConstant.cantBeEmpty}',
              preferBelow: false,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.info_outline,
                color: Colors.red,
              ),
            ) : Icon(
              Icons.check,
              color: Colors.green,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: _showTooltip ? Colors.red : Colors.blue,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onChanged: (value) {
            widget.onChanged!(value);
            setState(() {
              if (value.isNotEmpty) {
                _showTooltip = false;
              } else {
                _showTooltip = true;
              }
            });
          },
        ),
      ],
    );
  }
}

// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruvick_power/utils/constants/style.dart';

class CustomEditText extends StatelessWidget {
  final TextEditingController controller;
  final String textHint, editTitle;
  final TextInputType keyboardType;
  final ValueChanged<String> onTextChanged;
  final FormFieldValidator<String> validator;
  final bool isTextObscured;
  final List<TextInputFormatter> inputFormatters;

  const CustomEditText(
      {Key key,
      this.controller,
      this.textHint,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.editTitle,
      this.onTextChanged,
      this.isTextObscured = false,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        width: size.width,
        height: 75,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 3, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  editTitle,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.8)),
                ),
              ),
              Expanded(
                child: TextFormField(
                  // onSaved: (value) => amountString = value,
                  validator: validator,

                  keyboardType: keyboardType,
                  obscureText: isTextObscured,
                  inputFormatters: inputFormatters,

                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: Style.textFieldBorderStyle,
                    hintText: textHint,
                  ),
                  onChanged: onTextChanged,
                  style: const TextStyle(fontSize: 16.0),
                  controller: controller,
                ),
              ),
            ],
          ),
        ));
  }
}

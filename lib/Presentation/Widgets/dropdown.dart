// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final onChanged;
  AppDropdownInput({
    Key? key,
    required this.hintText,
    required this.options,
    required this.value,
    required this.getLabel,
    required this.onChanged,
  }) : super(key: key);

  // const AppDropdownInput({
  //   Key? key,
  //   this.hintText = 'Please select an Option',
  //   this.options = const [],
  //   required this.getLabel,
  //   required this.value,
  //   required this.onChanged,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              // isDense: true,
              isExpanded: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

// AppDropdownInput(
//                     hintText: "Gender",
//                     options: const ["Male", "Female", "Others"],
//                     value: gender,
//                     onChanged: (String value) {
//                       setState(() {
//                         gender = value;

//                         // state.didChange(newValue);
//                       });
//                     },
//                     getLabel: (String value) {
//                       return value;
//                     },
//                   ),
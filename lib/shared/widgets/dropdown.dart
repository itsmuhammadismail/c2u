import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final List<String> items;
  final String? selected;
  final onChange;

  const MyDropdown({
    super.key,
    required this.items,
    required this.selected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );

    return SizedBox(
      width: size.width * 0.8,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: kTextFieldColor,
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                  )),
            )
            .toList(),
        value: selected,
        onChanged: onChange,
        style: TextStyle(
          color: const Color(0xFF111113).withOpacity(0.6),
          fontSize: 16,
        ),
      ),
    );
  }
}

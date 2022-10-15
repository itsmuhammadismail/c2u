import 'package:c2u/resources/colors.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  final String name;
  final onChange;

  const DateSelector({
    super.key,
    required this.name,
    required this.onChange,
  });

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name),
        const SizedBox(height: 5),
        InkWell(
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              if (newDate == null) return;
              setState(() => selectedDate = newDate);
              widget.onChange(newDate);
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kTextFieldColor,
                borderRadius: BorderRadius.circular(6),
                // border: Border.all(width: 0.5),
              ),
              child: Row(
                children: [
                  Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                    style:
                        const TextStyle(color: Color(0xFF828282), fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(Icons.calendar_month),
                ],
              ),
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}

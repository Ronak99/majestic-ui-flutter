import 'package:flutter/material.dart';
import 'models/choice_item.dart';

class MultiChoicePicker extends StatefulWidget {
  final List<ChoiceItem> choices;
  final List<String> selectedValues;
  final ValueChanged<List<String>> onSelectionChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle textStyle;
  final Duration animationDuration;

  const MultiChoicePicker({
    super.key,
    required this.choices,
    required this.selectedValues,
    required this.onSelectionChanged,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.textStyle = const TextStyle(fontSize: 16),
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  MultiChoicePickerState createState() => MultiChoicePickerState();
}

class MultiChoicePickerState extends State<MultiChoicePicker>
    with SingleTickerProviderStateMixin {
  late List<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues);
  }

  void _toggleSelection(String value) {
    setState(() {
      if (_selectedValues.contains(value)) {
        _selectedValues.remove(value);
      } else {
        _selectedValues.add(value);
      }
      widget.onSelectionChanged(_selectedValues);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.choices.map((choice) {
        final isSelected = _selectedValues.contains(choice.value);
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => _toggleSelection(choice.value),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedContainer(
              duration: widget.animationDuration,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? widget.selectedColor.withValues(alpha: 0.2)
                    : widget.unselectedColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? widget.selectedColor
                      : widget.unselectedColor,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected)
                    Icon(
                      Icons.check,
                      color: Colors.blue,
                      size: 16,
                    ),
                  if (isSelected)
                    SizedBox(width: 4), // Spacing between icon and text
                  Text(
                    choice.label,
                    style: widget.textStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

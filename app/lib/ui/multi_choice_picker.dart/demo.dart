import 'package:flutter/material.dart';
import 'package:multi_choice_picker/multi_choice_picker.dart';
import 'package:multi_choice_picker/models/choice_item.dart';

class MultiChoicePickerExample extends StatefulWidget {
  const MultiChoicePickerExample({super.key});

  @override
  MultiChoicePickerExampleState createState() =>
      MultiChoicePickerExampleState();
}

class MultiChoicePickerExampleState extends State<MultiChoicePickerExample> {
  final List<ChoiceItem> _choices = [
    ChoiceItem(label: 'Reading', value: 'reading'),
    ChoiceItem(label: 'Cooking', value: 'cooking'),
    ChoiceItem(label: 'Gardening', value: 'gardening'),
    ChoiceItem(label: 'Painting', value: 'painting'),
    ChoiceItem(label: 'Knitting', value: 'knitting'),
    ChoiceItem(label: 'Photography', value: 'photography'),
    ChoiceItem(label: 'Cycling', value: 'cycling'),
    ChoiceItem(label: 'Hiking', value: 'hiking'),
    ChoiceItem(label: 'Dancing', value: 'dancing'),
    ChoiceItem(label: 'Writing', value: 'writing'),
    ChoiceItem(label: 'Fishing', value: 'fishing'),
    ChoiceItem(label: 'Yoga', value: 'yoga'),
    ChoiceItem(label: 'Baking', value: 'baking'),
    ChoiceItem(label: 'Woodworking', value: 'woodworking'),
    ChoiceItem(label: 'Scrapbooking', value: 'scrapbooking'),
    ChoiceItem(label: 'Birdwatching', value: 'birdwatching'),
    ChoiceItem(label: 'Pottery', value: 'pottery'),
    ChoiceItem(label: 'Chess', value: 'chess'),
    ChoiceItem(label: 'Calligraphy', value: 'calligraphy'),
    ChoiceItem(label: 'Jogging', value: 'jogging'),
  ];

  List<String> _selectedChoices = [];

  void _onSelectionChanged(List<String> selectedValues) {
    setState(() {
      _selectedChoices = selectedValues;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multi Choice Picker Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select hobbies:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            MultiChoicePicker(
              choices: _choices,
              selectedValues: _selectedChoices,
              onSelectionChanged: _onSelectionChanged,
            ),
            const SizedBox(height: 20),
            Text("Selected: ${_selectedChoices.join(", ")}"),
          ],
        ),
      ),
    );
  }
}

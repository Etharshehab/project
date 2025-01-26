import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final TextEditingController genderController;

  const GenderSelection({
    super.key,
    required this.genderController,
  });

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;
  List<String> genderList = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: border(color: Colors.teal, radius: 30),
            enabledBorder: border(color: Colors.black, radius: 50),
            focusedBorder: border(color: Colors.grey, radius: 10)),
        value: selectedGender,
        hint: const Text('Select Gender'),
        isExpanded: true,
        items: genderList.map((String gender) {
          return DropdownMenuItem(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue;

            widget.genderController.text = newValue ?? '';
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select gender';
          }
          return null;
        },
      ),
    );
  }
}

InputBorder border({required Color color, required double radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color),
  );
}

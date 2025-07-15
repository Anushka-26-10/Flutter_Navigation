import 'package:flutter/material.dart';
enum Gender { male, female }
class InputWidgetsExample extends StatefulWidget {
  const InputWidgetsExample({super.key});

  @override
  State<InputWidgetsExample> createState() => _InputWidgetsExampleState();
}

class _InputWidgetsExampleState extends State<InputWidgetsExample> {
  final nameController=TextEditingController();
  bool checked=false;
  Gender gender=Gender.male;
  final countries=[
    'Australia',
    'India',
    'Canada',
    'Denmark',
    'England',
    'France',
    'Germany',
  ];
  String? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Widgets'),backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController ,
              decoration: InputDecoration(label: Text('Enter your name:')),
            ),
            ElevatedButton(onPressed: () {
              print(nameController.text);
            },
                child: Text('OK')),
            Row(
              children: [
            Checkbox(
                value:checked,
                onChanged: (value)
            {setState(() {
              checked = value!;
            });
              
            },
            ),
                Text('Flutter')
      ]
            ),
            Row(
              children: [
                Radio<Gender>(
                  value:Gender.male,
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender=value!;
                    });
                  },
                ),
                Text('Male'),
                Radio<Gender>(
                  value:Gender.female,
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender=value!;
                    });
                  },
                ),
                Text('Female')
              ],
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select your conutry'),
              value: country,
              items:countries.map((e) => DropdownMenuItem<String>(
              value: e,
                child: Text(e))).toList(),
              onChanged:(value){
                setState(() {
                  country=value;
                }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

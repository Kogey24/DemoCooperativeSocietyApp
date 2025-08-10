import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return GFIconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF000080)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              type: GFButtonType.transparent,
            );
          },
        ),
        searchBar: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF000080),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Update name',
                hintText: 'Update your name here',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              //controller: _nameController,
            ),
          ),
          GFButton(
            type: GFButtonType.solid,
            shape: GFButtonShape.pills,
            color: const Color(0xFF000080),
            onPressed: () {
              // ref
              //     .read(UserProvider.notifier)
              //     .updateName(_nameController.text);
            },
            child: const Text("Update", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

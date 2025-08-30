import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
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
        backgroundColor: Colors.white,
        title: Text(
          "Savings",
          style: TextStyle(
            color: Color(0xFF000080),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF000080), Color(0xFF87CEEB)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GFCard(
              color: Colors.transparent,
              boxFit: BoxFit.cover,
              title: GFListTile(
                title: Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              content: Text(
                "KSH. 10,000",
                style: TextStyle(color: Color(0xFFE0FFFF)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

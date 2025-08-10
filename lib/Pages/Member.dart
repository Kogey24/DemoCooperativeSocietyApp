import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  // Dummy data for the table
  final List<DataRow> rows = [
    DataRow(
      cells: [
        const DataCell(Text("John Baraka")),
        const DataCell(Text("johnbaraka@gmail.com")),
        const DataCell(Text("+254 700 123 456")),
      ],
    ),
    DataRow(
      cells: [
        const DataCell(Text("Jane Ng'endo")),
        const DataCell(Text("janeN@gmail.com")),
        const DataCell(Text("+254 701 987 654")),
      ],
    ),
    DataRow(
      cells: [
        const DataCell(Text("Michael Nyaega")),
        const DataCell(Text("michaelnyaega@gmail.com")),
        const DataCell(Text("+254 702 555 888")),
      ],
    ),
    DataRow(
      cells: [
        const DataCell(Text("Alice ruto")),
        const DataCell(Text("aliceruto@gmail.com")),
        const DataCell(Text("+254 703 333 777")),
      ],
    ),
  ];

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
          "Members",
          style: TextStyle(
            color: Color(0xFF000080),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFF000080),
              ),
              border: TableBorder.all(
                color: Color(0xFF000080),
                style: BorderStyle.solid,
                width: 1,
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Phone",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                ),
              ],
              rows: rows,
            ),
          ),
        ),
      ),
    );
  }
}

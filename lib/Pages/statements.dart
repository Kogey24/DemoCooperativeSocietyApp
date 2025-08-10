import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Statements extends StatefulWidget {
  Statements({super.key});

  final List<Map<String, dynamic>> statements = [
    {
      "date": "2025-08-01",
      "description": "Monthly Contribution",
      "type": "Credit",
      "amount": 5000.00,
      "balance": 15000.00,
    },
    {
      "date": "2025-08-05",
      "description": "Loan Repayment",
      "type": "Debit",
      "amount": 2000.00,
      "balance": 13000.00,
    },
    {
      "date": "2025-08-08",
      "description": "Dividend Payment",
      "type": "Credit",
      "amount": 1200.00,
      "balance": 14200.00,
    },
  ];

  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
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
          "Statements",
          style: TextStyle(
            color: Color(0xFF000080),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color(0xFF000080),
            ),
            columns: const [
              DataColumn(
                label: Text(
                  "Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Type",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Balance",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
              ),
            ],
            rows: widget.statements.map((tx) {
              return DataRow(
                cells: [
                  DataCell(Text(tx["date"])),
                  DataCell(Text(tx["description"])),
                  DataCell(
                    Text(
                      tx["type"],
                      style: TextStyle(
                        color: tx["type"] == "Credit"
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      tx["amount"].toStringAsFixed(2),
                      style: TextStyle(
                        color: tx["type"] == "Credit"
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                  DataCell(Text(tx["balance"].toStringAsFixed(2))),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

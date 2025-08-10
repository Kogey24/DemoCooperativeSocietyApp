import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class QuickActions extends StatefulWidget {
  const QuickActions({super.key});

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
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
          "Quick Actions",
          style: TextStyle(
            color: Color(0xFF000080),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildActionCard(
              context,
              title: "Make Contribution",
              icon: Icons.account_balance_wallet,
              color: Colors.green,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Navigate to Contribution")),
                );
              },
            ),
            _buildActionCard(
              context,
              title: "Apply for Loan",
              icon: Icons.request_page,
              color: Colors.blue,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Navigate to Loan Application")),
                );
              },
            ),
            _buildActionCard(
              context,
              title: "View Statements",
              icon: Icons.receipt_long,
              color: Colors.orange,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Navigate to Statements")),
                );
              },
            ),
            _buildActionCard(
              context,
              title: "Transfer Funds",
              icon: Icons.send,
              color: Colors.purple,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Navigate to Transfer Funds")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build GFCard styled action buttons
  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GFCard(
      color: Colors.white,
      elevation: 4,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GFAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, size: 36, color: color),
            size: GFSize.LARGE,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          GFButton(
            onPressed: onTap,
            text: "Open",
            shape: GFButtonShape.pills,
            color: color,
            fullWidthButton: true,
          ),
        ],
      ),
    );
  }
}

import 'package:demo_cooperative_society/Pages/Member.dart';
import 'package:demo_cooperative_society/Pages/quick_actions.dart';
import 'package:demo_cooperative_society/Pages/savings.dart';
import 'package:demo_cooperative_society/Pages/settings.dart';
import 'package:demo_cooperative_society/Pages/sign_up.dart';
import 'package:demo_cooperative_society/Pages/statements.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return GFIconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF000080)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              type: GFButtonType.transparent,
            );
          },
        ),
        searchBar: true,
        title: Text(
          "DashBoard",
          style: TextStyle(
            color: Color(0xFF000080),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          GFIconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF000080)),
            onPressed: () {
              // Handle notifications action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications clicked')),
              );
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Member Statistics Section
            const Text(
              'Member Statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Members()),
                );
              },
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
                  padding: const EdgeInsets.all(10),
                  boxFit: BoxFit.cover,
                  image: Image.asset(''),
                  title: GFListTile(
                    avatar: GFAvatar(
                      backgroundImage: AssetImage(
                        'assets/close-top-view-diverse-businesspeople-260nw-1667439709.webp',
                      ),
                    ),
                    title: Text(
                      'Total Members',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    subTitle: Text(
                      'Active members',
                      style: TextStyle(color: Color(0xFFB0C4DE)),
                    ),
                  ),
                  content: Text(
                    "This are the total and active members of the society.",
                    style: TextStyle(color: Color(0xFFE0FFFF)),
                  ),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      GFButton(
                        onPressed: () {},
                        text: 'Details',
                        color: Colors.blue,
                        shape: GFButtonShape.pills,
                        borderShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Edit',
                        color: Colors.blue,
                        shape: GFButtonShape.pills,
                        borderShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF000080), Color(0xFF87CEEB)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SavingsPage()),
                ),
                child: GFCard(
                  color: Colors.transparent,
                  boxFit: BoxFit.cover,
                  image: Image.asset('your asset image'),
                  title: GFListTile(
                    avatar: GFAvatar(
                      backgroundImage: AssetImage('assets/saving.jpg '),
                    ),
                    title: Text(
                      'Total savings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    subTitle: Text(
                      'Saving Balance',
                      style: TextStyle(color: Color(0xFFB0C4DE)),
                    ),
                  ),
                  content: Text(
                    "This are the total and saved balance of the society.",
                    style: TextStyle(color: Color(0xFFE0FFFF)),
                  ),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      GFButton(
                        onPressed: () {},
                        text: 'Details',
                        color: Colors.blue,
                        shape: GFButtonShape.pills,
                        borderShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      GFButton(
                        onPressed: () {},
                        text: 'Edit',
                        color: Colors.blue,
                        shape: GFButtonShape.pills,
                        borderShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
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
                image: Image.asset('assets/loans.jpg'),
                title: GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: const AssetImage('assets/loans.jpg'),
                  ),
                  title: Text(
                    'Active Loans',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                  subTitle: Text(
                    'Currently disbursed',
                    style: TextStyle(color: Color(0xFFB0C4DE)),
                  ),
                ),
                content: Text(
                  "This are the current loans of the society.",
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                buttonBar: GFButtonBar(
                  children: <Widget>[
                    GFButton(
                      onPressed: () {},
                      text: 'Details',
                      color: Colors.blue,
                      shape: GFButtonShape.pills,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    GFButton(
                      onPressed: () {},
                      text: 'Edit',
                      color: Colors.blue,
                      shape: GFButtonShape.pills,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                image: Image.asset('your asset image'),
                title: GFListTile(
                  avatar: GFAvatar(backgroundImage: AssetImage('')),
                  title: Text(
                    'Loan Amount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                  subTitle: Text(
                    'Total disbursed',
                    style: TextStyle(color: Color(0xFFB0C4DE)),
                  ),
                ),
                content: Text(
                  "This is the total amount of loan disbursed.",
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                buttonBar: GFButtonBar(
                  children: <Widget>[
                    GFButton(
                      onPressed: () {},
                      text: 'Details',
                      color: Colors.blue,
                      shape: GFButtonShape.pills,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    GFButton(
                      onPressed: () {},
                      text: 'Edit',
                      color: Colors.blue,
                      shape: GFButtonShape.pills,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Recent Transactions Section
            const SizedBox(height: 20),
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF000080), Color(0xFF87CEEB)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),

              child: Column(
                children: [
                  GFListTile(
                    title: Text(
                      'Deposit',
                      style: TextStyle(color: Colors.green),
                    ),
                    subTitle: Text(
                      'Click to view deposit details',
                      style: TextStyle(color: Color(0xFFE0FFFF)),
                    ),
                    icon: Icon(Icons.arrow_downward, color: Colors.green),
                  ),
                  const Divider(color: Colors.white30),
                  GFListTile(
                    title: Text(
                      'Loan Payment',
                      style: TextStyle(color: Colors.orange),
                    ),
                    subTitle: Text(
                      'Click to view loan details',
                      style: TextStyle(color: Color(0xFFE0FFFF)),
                    ),
                    icon: Icon(Icons.payment, color: Colors.orange),
                  ),
                  const Divider(color: Colors.white30),
                  GFListTile(
                    title: Text(
                      'Withdrawal',
                      style: TextStyle(color: Colors.red),
                    ),
                    subTitle: Text(
                      'Click to view withdrawal details',
                      style: TextStyle(color: Color(0xFFE0FFFF)),
                    ),
                    icon: Icon(Icons.arrow_upward, color: Colors.red),
                  ),
                  const Divider(color: Colors.white30),
                  GFListTile(
                    title: Text(
                      'Interest Earned',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subTitle: Text(
                      'Click to view interest details',
                      style: TextStyle(color: Color(0xFFE0FFFF)),
                    ),
                    icon: Icon(Icons.trending_up, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF000080), Color(0xFF87CEEB)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              GFListTile(
                margin: const EdgeInsets.fromLTRB(20, 40, 20, 80),
                avatar: GFAvatar(
                  backgroundImage: const AssetImage('assets/user_avatar.png'),
                  shape: GFAvatarShape.circle,
                ),
                title: Text(
                  'Johnson Bakari',
                  style: TextStyle(color: Color(0xFFFFD700)),
                ),
                subTitle: Text(
                  'Personal Investment Account',
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
              ),
              const Divider(),
              GFListTile(
                title: Text(
                  'Dashboard',
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                icon: Icon(Icons.dashboard, color: Color(0xFFFFD700)),
                onTap: () {
                  // Navigate to Dashboard
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              GFListTile(
                title: Text(
                  'Quick Actions',
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                icon: Icon(Icons.history, color: Color(0xFFFFD700)),
                onTap: () {
                  // Navigate to Transactions
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QuickActions(),
                    ),
                  );
                },
              ),

              GFListTile(
                title: Text(
                  'Statements',
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                icon: Icon(Icons.history, color: Color(0xFFFFD700)),
                onTap: () {
                  // Navigate to Transactions
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Statements()));
                },
              ),
              const Divider(),
              GFListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                icon: Icon(Icons.settings, color: Color(0xFFFFD700)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),
              GFListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Color(0xFFE0FFFF)),
                ),
                icon: Icon(Icons.logout, color: Colors.red),
                onTap: () {
                  // Handle logout action
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Logged out')));
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

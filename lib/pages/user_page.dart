import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:accounting/pages/dashboard.dart';
import 'package:accounting/pages/customers.dart';
import 'package:accounting/pages/user_content3.dart';
import 'package:accounting/pages/user_content4.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}


class _UserPageState extends State<UserPage> {
  List<Widget> views =  [
    Center(
      child: DashBoard(),
    ),
    Center(
      child: User_Content3(),
    ),
    Center(
      child: Customers(),
    ),
    Center(
      child: User_Content4(),
    ),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SideNavigationBar(
              header: const SideNavigationBarHeader(
                image: CircleAvatar(
                  child: Icon(Icons.account_balance),
                ),
                title: Text('welcome'),
                subtitle: Text('Mohammad'),
              ),
              selectedIndex: selectedIndex,
              footer: SideNavigationBarFooter(
                  label: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacementNamed(context,'/');
                        });
                      },
                      icon: Icon(Icons.logout),
                      label: Text('LogOut'))),
              items: const [
                SideNavigationBarItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                ),
                SideNavigationBarItem(
                  icon: Icons.local_grocery_store_sharp,
                  label: 'Orders',
                ),
                SideNavigationBarItem(
                  icon: Icons.person_outline,
                  label: 'Customers',
                ),
                SideNavigationBarItem(
                  icon: Icons.sell,
                  label: 'Items',
                ),
              ],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              theme: SideNavigationBarTheme(
                  itemTheme: SideNavigationBarItemTheme(
                    unselectedItemColor: Colors.black54,
                    selectedItemColor: Colors.cyan,
                  ),
                  togglerTheme: SideNavigationBarTogglerTheme.standard(),
                  dividerTheme: SideNavigationBarDividerTheme.standard()
              ),
      
              toggler: SideBarToggler(
                  expandIcon: Icons.keyboard_arrow_left,
                  shrinkIcon: Icons.keyboard_arrow_right,
                  onToggle: () {
                    print('Toggle');
                  }),
            ),
            Expanded(
              child: views.elementAt(selectedIndex),
            )
          ],
        ),
      ),
    );
  }
}

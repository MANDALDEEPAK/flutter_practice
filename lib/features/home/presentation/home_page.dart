import 'package:expense_tracker/features/authentication/data/auth_respository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense_Tracker'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
                child: Text('Drawer Header'),
            ),
            ListTile(
              onTap: (){
                AuthRepository.userSignOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}

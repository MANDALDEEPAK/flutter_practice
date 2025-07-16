import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/authentication/data/auth_respository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'add_expense_screen.dart';
import '../models/expense_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  double totalExpense = 0;
  double monthlyBudget = 1000; // Default monthly budget

  Stream<List<Expense>> getExpenses() {
    final userId = _auth.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Expense.fromDoc(doc)).toList());
  }

  void logout() async {
    await _auth.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Expenses"),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.logout),
        //     onPressed: logout,
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Admin'),
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
      body: StreamBuilder<List<Expense>>(
        stream: getExpenses(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final expenses = snapshot.data!;

          // ✅ FIX: Delay setState to avoid calling during build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final newTotal = expenses.fold(0.0, (sum, e) => sum + e.amount);
            if (totalExpense != newTotal) {
              setState(() {
                totalExpense = newTotal;
              });
            }
          });

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Monthly Budget: \$${monthlyBudget.toStringAsFixed(2)}"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: totalExpense / monthlyBudget > 1
                          ? 1
                          : totalExpense / monthlyBudget,
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                    const SizedBox(height: 8),
                    Text("Spent: \$${totalExpense.toStringAsFixed(2)}"),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final e = expenses[index];
                    return ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.category),
                      trailing: Text("\$${e.amount.toStringAsFixed(2)}"),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
        ),
      ),
    );
  }
}

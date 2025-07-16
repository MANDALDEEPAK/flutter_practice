import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List<Expense> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  void _loadExpenses() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .get();

    setState(() {
      expenses = snapshot.docs.map((doc) => Expense.fromDoc(doc)).toList();
    });
  }

  Map<String, double> getCategoryTotals() {
    final Map<String, double> data = {};
    for (var e in expenses) {
      data[e.category] = (data[e.category] ?? 0) + e.amount;
    }
    return data;
  }

  List<FlSpot> getTimeSeries() {
    final sorted = [...expenses]..sort((a, b) => a.date.compareTo(b.date));
    List<FlSpot> spots = [];
    for (int i = 0; i < sorted.length; i++) {
      spots.add(FlSpot(i.toDouble(), sorted[i].amount));
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final totals = getCategoryTotals();

    return Scaffold(
      appBar: AppBar(title: const Text("Expense Report")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Category Breakdown", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 200, child: PieChartWidget()),
            const SizedBox(height: 20),
            const Text("Spending Over Time", style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 200,
              child: LineChart(LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: getTimeSeries(),
                    isCurved: true,
                    // colors: [Colors.teal],
                    barWidth: 3,
                    belowBarData: BarAreaData(show: true, ),
                  ),
                ],
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_ReportScreenState>()!;
    final data = state.getCategoryTotals();
    final total = data.values.fold(0.0, (a, b) => a + b);

    return PieChart(
      PieChartData(
        sections: data.entries
            .map((entry) => PieChartSectionData(
          title: "${entry.key}\n${(entry.value / total * 100).toStringAsFixed(1)}%",
          value: entry.value,
          color: Colors.primaries[data.keys.toList().indexOf(entry.key) % Colors.primaries.length],
          radius: 80,
          titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
        ))
            .toList(),
        centerSpaceRadius: 40,
      ),
    );
  }
}

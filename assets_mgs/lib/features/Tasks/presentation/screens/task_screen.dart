import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final List<Map<String, dynamic>> tasks = [
    {
      "id": 1,
      "risk_id": "RISK-001",
      "assigned_to": "John Doe",
      "deadline": "2026-05-20",
      "status": "Pending",
    },
    {
      "id": 2,
      "risk_id": "RISK-002",
      "assigned_to": "Sarah Smith",
      "deadline": "2026-05-15",
      "status": "Completed",
    },
    {
      "id": 3,
      "risk_id": "RISK-003",
      "assigned_to": "Michael",
      "deadline": "2026-05-12",
      "status": "Overdue",
    },
  ];

  Color getTaskColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Overdue":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData getTaskIcon(String status) {
    switch (status) {
      case "Completed":
        return Icons.check_circle;
      case "Pending":
        return Icons.pending;
      case "Overdue":
        return Icons.warning;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0000BA),
        foregroundColor: Colors.white,
        title: const Text("Tasks"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),

            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: getTaskColor(
                    task["status"],
                  ).withOpacity(0.1),
                  child: Icon(
                    getTaskIcon(task["status"]),
                    color: getTaskColor(task["status"]),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Task #${task["id"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text("Risk ID: ${task["risk_id"]}"),

                      Text("Assigned To: ${task["assigned_to"]}"),

                      Text("Deadline: ${task["deadline"]}"),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: getTaskColor(
                      task["status"],
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    task["status"],
                    style: TextStyle(
                      color: getTaskColor(task["status"]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000BA),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
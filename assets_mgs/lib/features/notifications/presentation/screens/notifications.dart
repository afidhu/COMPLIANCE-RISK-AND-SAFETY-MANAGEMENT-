import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final List<Map<String, dynamic>> notifications = [

    {
      "notify_id": 1,
      "sender": "System",
      "receiver": "Inspector",
      "content": "Fire extinguisher certificate will expire in 3 days.",
      "notify_type": "Compliance",
      "is_read": false,
      "createdAt": "2026-05-25 09:30 AM",
    },

    {
      "notify_id": 2,
      "sender": "Inspector",
      "receiver": "Technician",
      "content": "CAPA task assigned for Lift A malfunction repair.",
      "notify_type": "Task",
      "is_read": false,
      "createdAt": "2026-05-25 10:10 AM",
    },
  ];

  Color getColor(String type) {
    switch (type) {
      case "Compliance":
        return const Color(0xFFE53935);
      case "Task":
        return const Color(0xFFFF9800);
      case "Inspection":
        return const Color(0xFF1E66FF);
      case "Mitigation":
        return const Color(0xFF43A047);
      default:
        return Colors.grey;
    }
  }

  IconData getIcon(String type) {
    switch (type) {
      case "Compliance":
        return Icons.verified_user_rounded;
      case "Task":
        return Icons.task_alt_rounded;
      case "Inspection":
        return Icons.fact_check_rounded;
      case "Mitigation":
        return Icons.shield_rounded;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final n = notifications[index];
          final color = getColor(n["notify_type"]);

          return GestureDetector(
            onTap: () {
              // READY FOR NAVIGATION (CAPA / COMPLIANCE / HAZARD)
              // use n["notify_id"] or referenceId here
            },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(bottom: 14),

              decoration: BoxDecoration(
                color: n["is_read"]
                    ? Colors.white
                    : const Color(0xFFEAF2FF),

                borderRadius: BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Row(
                children: [

                  /// LEFT COLOR BAR (VERY MODERN LOOK)
                  Container(
                    width: 6,
                    height: 110,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// ICON
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      getIcon(n["notify_type"]),
                      color: color,
                      size: 26,
                    ),
                  ),

                  const SizedBox(width: 14),

                  /// CONTENT
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// TYPE + UNREAD DOT
                          Row(
                            children: [

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  n["notify_type"],
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              if (!n["is_read"])
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          /// MESSAGE
                          Text(
                            n["content"],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                          ),

                          const SizedBox(height: 10),

                          /// FOOTER
                          Row(
                            children: [

                              const Icon(
                                Icons.person,
                                size: 14,
                                color: Colors.grey,
                              ),

                              const SizedBox(width: 4),

                              Expanded(
                                child: Text(
                                  "${n["sender"]} → ${n["receiver"]}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),

                              const Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey,
                              ),

                              const SizedBox(width: 4),

                              Text(
                                n["createdAt"],
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
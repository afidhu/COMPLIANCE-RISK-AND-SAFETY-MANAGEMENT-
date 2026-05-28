import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  /// SAMPLE NOTIFICATIONS
  final List<Map<String, dynamic>> notifications = [

    {
      "notify_id": 1,
      "sender": "System",
      "receiver": "Inspector",
      "content":
      "Fire extinguisher certificate will expire in 3 days.",
      "notify_type": "Compliance",
      "is_read": false,
      "createdAt": "2026-05-25 09:30 AM",
    },

    {
      "notify_id": 2,
      "sender": "Inspector",
      "receiver": "Technician",
      "content":
      "CAPA task assigned for Lift A malfunction repair.",
      "notify_type": "Task",
      "is_read": false,
      "createdAt": "2026-05-25 10:10 AM",
    },

    {
      "notify_id": 3,
      "sender": "System",
      "receiver": "Inspector",
      "content":
      "Electrical inspection schedule is overdue.",
      "notify_type": "Inspection",
      "is_read": true,
      "createdAt": "2026-05-24 02:45 PM",
    },

    {
      "notify_id": 4,
      "sender": "Estate manager",
      "receiver": "Technician(A)",
      "content":
      "Boiler leakage mitigation action approved.",
      "notify_type": "Mitigation",
      "is_read": true,
      "createdAt": "2026-05-23 08:20 AM",
    },
  ];

  Color getNotificationColor(String type) {

    switch (type) {

      case "Compliance":
        return Colors.red;

      case "Task":
        return Colors.orange;

      case "Inspection":
        return Colors.blue;

      case "Mitigation":
        return Colors.green;

      default:
        return Colors.grey;
    }
  }

  IconData getNotificationIcon(String type) {

    switch (type) {

      case "Compliance":
        return Icons.verified_user;

      case "Task":
        return Icons.task_alt;

      case "Inspection":
        return Icons.fact_check;

      case "Mitigation":
        return Icons.security;

      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: const Color(0xFF0000BA),

        foregroundColor: Colors.white,

        centerTitle: true,

        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: notifications.length,

        itemBuilder: (context, index) {

          final notify = notifications[index];

          return Container(

            margin: const EdgeInsets.only(bottom: 14),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color: notify["is_read"]
                  ? Colors.white
                  : const Color(0xFFEAF0FF),

              borderRadius: BorderRadius.circular(18),

              boxShadow: [

                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Row(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                /// ICON
                Container(

                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(

                    color: getNotificationColor(
                      notify["notify_type"],
                    ).withOpacity(0.1),

                    shape: BoxShape.circle,
                  ),

                  child: Icon(

                    getNotificationIcon(
                      notify["notify_type"],
                    ),

                    color: getNotificationColor(
                      notify["notify_type"],
                    ),

                    size: 28,
                  ),
                ),

                const SizedBox(width: 14),

                /// CONTENT
                Expanded(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      /// TYPE + STATUS
                      Row(

                        children: [

                          Container(

                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),

                            decoration: BoxDecoration(

                              color: getNotificationColor(
                                notify["notify_type"],
                              ).withOpacity(0.1),

                              borderRadius:
                              BorderRadius.circular(20),
                            ),

                            child: Text(

                              notify["notify_type"],

                              style: TextStyle(
                                color: getNotificationColor(
                                  notify["notify_type"],
                                ),

                                fontWeight:
                                FontWeight.bold,

                                fontSize: 12,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          if (!notify["is_read"])

                            Container(

                              width: 10,
                              height: 10,

                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      /// MESSAGE
                      Text(

                        notify["content"],

                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// SENDER -> RECEIVER
                      Row(

                        children: [

                          const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.grey,
                          ),

                          const SizedBox(width: 4),

                          Expanded(

                            child: Text(
                              "${notify["sender"]} → ${notify["receiver"]}",

                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      /// TIME
                      Row(

                        children: [

                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey,
                          ),

                          const SizedBox(width: 4),

                          Text(

                            notify["createdAt"],

                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
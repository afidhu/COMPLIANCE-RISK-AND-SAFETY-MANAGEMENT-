import 'package:assets_mgs/core/utils/date_formater/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notification_bloc.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  // final List<Map<String, dynamic>> notifications = [
  //
  //   {
  //     "notify_id": 1,
  //     "sender": "System",
  //     "receiver": "Inspector",
  //     "content": "Fire extinguisher certificate will expire in 3 days.",
  //     "notify_type": "Compliance",
  //     "is_read": false,
  //     "createdAt": "2026-05-25 09:30 AM",
  //   },
  //
  //   {
  //     "notify_id": 2,
  //     "sender": "Inspector",
  //     "receiver": "Technician",
  //     "content": "CAPA task assigned for Lift A malfunction repair.",
  //     "notify_type": "Task",
  //     "is_read": false,
  //     "createdAt": "2026-05-25 10:10 AM",
  //   },
  // ];

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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NotificationBloc>().add(GetNotificationByUserEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0000BA),
        foregroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {

          if(state is  NotificationLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is NotificationError){
            return Center(child: Text(state.message.toString()),);
          }
          else if (state is NotificationLoaded){
           if(state.notification.isNotEmpty){
             return ListView.builder(
               padding: const EdgeInsets.all(16),
               itemCount: state.notification.length,
               itemBuilder: (context, index) {
                 final n = state.notification[index];
                 final color = getColor(n.notifyType.toString());

                 return GestureDetector(
                   onTap: () {},
                   child: AnimatedContainer(
                     duration: const Duration(milliseconds: 300),
                     curve: Curves.easeOutCubic,
                     margin: const EdgeInsets.only(bottom: 18),
                     padding: const EdgeInsets.all(18),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(28),

                       border: Border.all(
                         color: n.isRead ==true
                             ? Colors.grey.shade200
                             : color.withOpacity(.25),
                         width: 1.2,
                       ),

                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(.04),
                           blurRadius: 25,
                           spreadRadius: 2,
                           offset: const Offset(0, 10),
                         ),
                         BoxShadow(
                           color: color.withOpacity(.05),
                           blurRadius: 30,
                           offset: const Offset(0, 12),
                         ),
                       ],
                     ),

                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                         /// TOP SECTION
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                             /// ICON
                             Container(
                               height: 64,
                               width: 64,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),

                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end: Alignment.bottomRight,
                                   colors: [
                                     color.withOpacity(.18),
                                     color.withOpacity(.08),
                                   ],
                                 ),

                                 border: Border.all(
                                   color: color.withOpacity(.15),
                                 ),

                                 boxShadow: [
                                   BoxShadow(
                                     color: color.withOpacity(.15),
                                     blurRadius: 18,
                                     offset: const Offset(0, 6),
                                   )
                                 ],
                               ),
                               child: Icon(
                                 getIcon(n.notifyType.toString()),
                                 color: Color(0xFF0D47A1),
                                 size: 30,
                               ),
                             ),

                             const SizedBox(width: 14),

                             Expanded(
                               child: Column(
                                 crossAxisAlignment:
                                 CrossAxisAlignment.start,
                                 children: [

                                   Row(
                                     children: [

                                       Container(
                                         padding:
                                         const EdgeInsets.symmetric(
                                           horizontal: 12,
                                           vertical: 6,
                                         ),
                                         decoration: BoxDecoration(
                                           color:
                                           color.withOpacity(.08),
                                           borderRadius:
                                           BorderRadius.circular(
                                               100),
                                         ),
                                         child: Text(
                                           n.notifyType
                                               .toString()
                                               .toUpperCase(),
                                           style: TextStyle(
                                             color: color,
                                             fontWeight:
                                             FontWeight.w800,
                                             fontSize: 10,
                                             letterSpacing: 1,
                                           ),
                                         ),
                                       ),

                                       const Spacer(),

                                       if (n.isRead ==false)
                                         Container(
                                           padding:
                                           const EdgeInsets.symmetric(
                                             horizontal: 10,
                                             vertical: 5,
                                           ),
                                           decoration:
                                           BoxDecoration(
                                             color: Colors.red
                                                 .withOpacity(.08),
                                             borderRadius:
                                             BorderRadius
                                                 .circular(50),
                                           ),
                                           child: Row(
                                             mainAxisSize:
                                             MainAxisSize.min,
                                             children: [

                                               Container(
                                                 width: 8,
                                                 height: 8,
                                                 decoration:
                                                 const BoxDecoration(
                                                   color: Colors.red,
                                                   shape:
                                                   BoxShape.circle,
                                                 ),
                                               ),

                                               const SizedBox(
                                                   width: 6),

                                               const Text(
                                                 "NEW",
                                                 style: TextStyle(
                                                   color: Colors.red,
                                                   fontSize: 10,
                                                   fontWeight:
                                                   FontWeight
                                                       .bold,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                     ],
                                   ),

                                   const SizedBox(height: 10),

                                   Text(
                                     n.content.toString(),
                                     maxLines: 3,
                                     overflow:
                                     TextOverflow.ellipsis,
                                     style: const TextStyle(
                                       fontSize: 15.5,
                                       fontWeight:
                                       FontWeight.w700,
                                       height: 1.5,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),

                         const SizedBox(height: 18),

                         /// DIVIDER
                         Container(
                           height: 1,
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                               colors: [
                                 Colors.transparent,
                                 Colors.grey.shade300,
                                 Colors.transparent,
                               ],
                             ),
                           ),
                         ),

                         const SizedBox(height: 14),

                         /// FOOTER
                         Row(
                           children: [

                             Container(
                               padding:
                               const EdgeInsets.all(8),
                               decoration: BoxDecoration(
                                 color: Colors.grey.shade100,
                                 shape: BoxShape.circle,
                               ),
                               child: Icon(
                                 Icons.person_outline,
                                 size: 16,
                                 color: const Color(0xFF0D47A1),
                               ),
                             ),

                             const SizedBox(width: 8),

                             Expanded(
                               child: Column(
                                 crossAxisAlignment:
                                 CrossAxisAlignment.start,
                                 children: [

                                   Text(
                                     n.sender?.fullName!.toLowerCase() ??
                                         "",
                                     maxLines: 1,
                                     overflow:
                                     TextOverflow.ellipsis,
                                     style: const TextStyle(
                                       fontSize: 13,
                                       fontWeight:
                                       FontWeight.w700,
                                     ),
                                   ),

                                   const SizedBox(height: 2),

                                   Text(
                                     "From: ${n.sender?.role ?? ''}",
                                     style: TextStyle(
                                       color:
                                       Colors.grey.shade600,
                                       fontSize: 11,
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                             Column(
                               crossAxisAlignment:
                               CrossAxisAlignment.end,
                               children: [

                                 Row(
                                   mainAxisSize:
                                   MainAxisSize.min,
                                   children: [

                                     Icon(
                                       Icons.access_time,
                                       size: 14,
                                       color:
                                       Colors.grey.shade500,
                                     ),

                                     const SizedBox(width: 4),

                                     Text(
                                       dateFormater(
                                         n.createdAt.toString(),
                                       ),
                                       style: TextStyle(
                                         color: Colors
                                             .grey.shade600,
                                         fontSize: 11,
                                         fontWeight:
                                         FontWeight.w500,
                                       ),
                                     ),
                                   ],
                                 ),

                                 const SizedBox(height: 8),

                                 Container(
                                   height: 34,
                                   width: 34,
                                   decoration: BoxDecoration(
                                     color:
                                     color.withOpacity(.08),
                                     shape: BoxShape.circle,
                                   ),
                                   child: Icon(
                                     Icons.arrow_forward,
                                     color: Color(0xFF0D47A1),
                                     size: 18,
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 );
               },
             );
           }
           return Center(child: Text('NO notification available'),);
          }
          return Center(child: Text('No notification'),);
        },
      ),
    );
  }
}
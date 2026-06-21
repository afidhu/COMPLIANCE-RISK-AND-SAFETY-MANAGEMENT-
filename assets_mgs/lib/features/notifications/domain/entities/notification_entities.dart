import 'package:equatable/equatable.dart';

class NotificationEntities extends Equatable {
  final String? notifyId;
  final String? senderId;
  final String? receiverId;
  final String? title;
  final String? content;
  final String? notifyType;
  final String? referenceId;
  final bool? isRead;
  final String? createdAt;

  const NotificationEntities({
    required this.notifyId,
    required this.senderId,
    required this.receiverId,
    required this.title,
    required this.content,
    required this.notifyType,
    required this.referenceId,
    required this.isRead,
    required this.createdAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    notifyId,
    senderId,
    receiverId,
    title,
    content,
    notifyType,
    referenceId,
    isRead,
    createdAt,
  ];
}

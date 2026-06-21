import '../../domain/entities/notification_entities.dart';

/// notify_id : "6f9ed4e2-ce52-4f81-9c32-8528bd3d3842"
/// sender_id : "cmqgzcizv0000mfe2d9l0bvbv"
/// receiver_id : "cmqmdvbeb0006xme2d741kzwq"
/// title : "Task assigned"
/// content : "replace that asset"
/// notify_type : "CAPA"
/// reference_id : "cmqmt920x0000d4e2feyzhzt9"
/// is_read : false
/// createdAt : "2026-06-20T20:28:58.623Z"

class NotificationModel extends NotificationEntities {
  const NotificationModel({
    super.notifyId,
    super.senderId,
    super.receiverId,
    super.title,
    super.content,
    super.notifyType,
    super.referenceId,
    super.isRead,
    super.createdAt,});

  factory NotificationModel.fromJson(dynamic json) {
    return NotificationModel(
      notifyId: json['notify_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      title: json['title'],
      content: json['content'],
      notifyType: json['notify_type'],
      referenceId: json['reference_id'],
      isRead: json['is_read'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notify_id': notifyId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'title': title,
      'content': content,
      'notify_type': notifyType,
      'reference_id': referenceId,
      'is_read': isRead,
      'createdAt': createdAt,
    };
  }


  factory NotificationModel.fromEntity(NotificationEntities notify) {
    return NotificationModel(
      notifyId: notify.notifyId,
      senderId: notify.senderId,
      receiverId: notify.receiverId,
      title: notify.title,
      content: notify.content,
      notifyType: notify.notifyType,
      referenceId: notify.referenceId,
      isRead: notify.isRead,
      createdAt: notify.createdAt,
    );
  }
}
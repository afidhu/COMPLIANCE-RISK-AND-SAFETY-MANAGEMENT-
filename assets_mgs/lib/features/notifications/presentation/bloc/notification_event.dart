part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

class GetNotificationByUserEvent  extends NotificationEvent{
  // final String userId;

  // GetNotificationByUserEvent(this.userId);
}

class UpdateNotificationByUserEvent  extends NotificationEvent{
  final String notId;

  UpdateNotificationByUserEvent(this.notId);
}
part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationEntities> notification;

  NotificationLoaded(this.notification);
}
class NotificationError extends NotificationState {
  final String message;
  NotificationError(this.message);

}
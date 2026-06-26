
import '../entities/notification_entities.dart';

abstract class NotificationRepo {

  Future<List<NotificationEntities>> getUserNotification(String userId);
  Future<bool> updateUserNotification(String notId);
}
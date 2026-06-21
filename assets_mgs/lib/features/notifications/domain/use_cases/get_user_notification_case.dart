

import '../entities/notification_entities.dart';
import '../repository/notification_repo.dart';

class GetUserNotificationCase {

  final NotificationRepo _notificationRepo;

  GetUserNotificationCase(this._notificationRepo);

  Future<List<NotificationEntities>> call(String userId){
    return _notificationRepo.getUserNotification(userId);
  }

}
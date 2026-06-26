


import '../entities/notification_entities.dart';
import '../repository/notification_repo.dart';


class UpdateNotificationAsReadCase {

  final NotificationRepo _notificationRepo;

  UpdateNotificationAsReadCase(this._notificationRepo);

  Future<bool> call(String notId){
    return _notificationRepo.updateUserNotification(notId);
  }

}


import 'package:assets_mgs/features/notifications/domain/entities/notification_entities.dart';

import '../../domain/repository/notification_repo.dart';
import '../data_sources/notification_remote_data.dart';
import '../models/notification_model.dart';

class NotificationRepoImpl implements NotificationRepo{

  final NotificationRemoteData _notificationRemoteData;

  NotificationRepoImpl(this._notificationRemoteData);

  @override
  Future<List<NotificationEntities>> getUserNotification(String userId) async{
    // TODO: implement getUserNotification
    try{
      final response = await _notificationRemoteData.getNotify(userId);
      if(response.statusCode == 200 || response.statusCode ==201){
        List<dynamic> notifyJson = response.data;
        // print('ComplianceModel ${response.data}');
        return notifyJson.map((e)=>NotificationModel.fromJson(e)).toList();
      }
      throw Exception('error to get notifyJson');
    } catch(e){
      print('error at : $e');
      throw Exception(' error $e');
    }
  }
}
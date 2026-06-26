import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/notification_entities.dart';
import '../../domain/use_cases/get_user_notification_case.dart';
import '../../domain/use_cases/update_notification_as_read_case.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetUserNotificationCase _getUserNotificationCase;
  final UpdateNotificationAsReadCase _updateNotificationAsReadCase;
  NotificationBloc(this._getUserNotificationCase,this._updateNotificationAsReadCase) : super(NotificationInitial()) {
    on<GetNotificationByUserEvent>(_getNotificationByUser) ;
    on<UpdateNotificationByUserEvent>(_updateNotificationByUser) ;
  }

  FutureOr<void> _getNotificationByUser(GetNotificationByUserEvent event, Emitter<NotificationState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(NotificationLoading());
    try{
      final technicianId = prefs.getString('userId');
      print('technicianId:$technicianId');
      final notification = await _getUserNotificationCase.call(technicianId.toString());
      emit(NotificationLoaded(notification));
      print('notifies_notifies: $notification');
    } catch(e){
      print('error in get notifies: $e');
      emit(NotificationError('Fail to load notification'));
    }
  }


  FutureOr<void> _updateNotificationByUser(UpdateNotificationByUserEvent event, Emitter<NotificationState> emit) async{
      try{
        bool isRead = await _updateNotificationAsReadCase.call(event.notId.toString().trim());
        print('booooooooool: $isRead');
      } catch(e){
        print('error in get notifies: $e');
        emit(NotificationError('Fail to load notification'));
      }

  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_user_notification_case.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetUserNotificationCase _getUserNotificationCase;
  NotificationBloc(this._getUserNotificationCase) : super(NotificationInitial()) {
    on<GetNotificationByUserEvent>(_getNotificationByUser) ;
  }

  FutureOr<void> _getNotificationByUser(GetNotificationByUserEvent event, Emitter<NotificationState> emit) async {
    try{
      final notifies = await _getUserNotificationCase.call('userId');
    } catch(e){}
  }
}

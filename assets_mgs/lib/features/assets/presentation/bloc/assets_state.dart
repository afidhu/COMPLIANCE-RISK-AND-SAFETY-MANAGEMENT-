part of 'assets_bloc.dart';

@immutable
sealed class AssetsState {}

 class AssetsInitial extends AssetsState {}
 class AssetsLoading extends AssetsState {}
 class AssetsMessage extends AssetsState {
  final String infoMessage;

  AssetsMessage( this.infoMessage);
 }
 class AssetsLoaded extends AssetsState {
  final List< AssetsEntity> assets;

  AssetsLoaded( this.assets);
 }

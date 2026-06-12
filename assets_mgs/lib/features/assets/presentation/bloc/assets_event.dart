part of 'assets_bloc.dart';

@immutable
sealed class AssetsEvent {}

class GetAssetEvent extends AssetsEvent{}

class AddAssetEvent extends AssetsEvent{
  final AssetsEntity assetsEntity;

  AddAssetEvent({required this.assetsEntity});
}
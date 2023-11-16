part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
class Empty extends AppState {}
class GetDataLoadingState extends AppState {}

class GetDataSuccessState extends AppState {}

class GetDataErrorState extends AppState {
  final String error;

  GetDataErrorState({
    required this.error,
  });
}
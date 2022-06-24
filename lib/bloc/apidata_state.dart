part of 'apidata_bloc.dart';

abstract class ApiDataState {}

class ApiDataInitial extends ApiDataState {}

class ApiDataLoaded extends ApiDataState {
  List<User> data;

  ApiDataLoaded({required this.data});
}

class ApiDataL extends ApiDataState {
  int lenght;
  List<User> data;

  ApiDataL({required this.lenght, required this.data});
}

class ApiDataError extends ApiDataState {
  String data;

  ApiDataError({required this.data});
}

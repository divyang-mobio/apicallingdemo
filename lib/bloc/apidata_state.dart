part of 'apidata_bloc.dart';

abstract class ApidataState {}

class ApidataInitial extends ApidataState {}

class ApidataLoaded extends ApidataState {
  List<User> data;

  ApidataLoaded({required this.data});
}

class ApidataError extends ApidataState {}

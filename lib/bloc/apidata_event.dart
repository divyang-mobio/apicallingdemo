part of 'apidata_bloc.dart';

abstract class ApiDataEvent {}

class AllData extends ApiDataEvent{}

class SomeData extends ApiDataEvent{
  int lenght;

  SomeData({required this.lenght});
}
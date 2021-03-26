part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataSuccess extends DataState {
  final Data data;

  DataSuccess({@required this.data});
  @override
  List<Object> get props => [data];
}

class DataFailure extends DataState {
  final String error;

  DataFailure({@required this.error});
}

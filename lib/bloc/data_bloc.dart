import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_task/models/data.dart';
import 'package:test_task/repositories/data_repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({@required this.dataRepository}) : super(DataInitial());
  final DataRepository dataRepository;

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is FetchData) yield* _mapFetchDataToState();
  }

  Stream<DataState> _mapFetchDataToState() async* {
    final currentState = state;
    try {
      if (currentState is DataInitial) {
        final data = await dataRepository.fetchData();
        yield DataSuccess(data: data);
      }

      if (currentState is DataSuccess) {
        final data = await dataRepository.fetchData();
        yield DataSuccess(data: data);
      }
    } catch (e) {
      yield DataFailure(error: e.toString());
    }
  }
}

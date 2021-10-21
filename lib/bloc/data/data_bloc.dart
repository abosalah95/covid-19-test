import 'dart:async';
import 'package:covid_track_task/model/dataModel.dart';
import 'package:covid_track_task/resources/custom_exception.dart';
import 'package:covid_track_task/resources/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'data_event.dart';
part 'date_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial());

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    try{
    if (event is GetData) {
      yield Initial();
      var data = await Repository.instance.getDate();
      print(data);
      DataModel model = DataModel.fromJson(data);
      yield GetDataStateSuccess(model);
    }
  } on MyException catch (e) {
  yield DataStateFailure(errorCode: e.error, message: e.message);
  } catch (e) {
  yield DataStateFailure(errorCode: 333, message: e.toString());
  }}
}

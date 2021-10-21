part of 'data_bloc.dart';


abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => null;
}
class Initial extends DataState {}

class DataStateFailure extends DataState {
  final int errorCode;
  final String message;

  DataStateFailure({this.errorCode, this.message});

  @override
  List<Object> get props => null;

}

class GetDataStateSuccess extends DataState {
  DataModel model;
  GetDataStateSuccess(this.model);
  @override
  List<Object> get props => [model];
}

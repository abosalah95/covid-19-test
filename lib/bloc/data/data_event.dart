part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class GetData extends DataEvent {
  const GetData();
  @override
  List<Object> get props => [];

}

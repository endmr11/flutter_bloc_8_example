part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends HomeEvent {}

class IncrementEvent extends HomeEvent {
  final int number;

  const IncrementEvent(this.number);
  @override
  List<Object> get props => [number];
}

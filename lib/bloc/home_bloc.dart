import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<StartEvent>(_onStart);
    on<IncrementEvent>(_onIncrement);
  }
  void _onStart(StartEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
  }

  Future<void> _onIncrement(IncrementEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadedState(sayi: event.number));
  }
}

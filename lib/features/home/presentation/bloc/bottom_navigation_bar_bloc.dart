import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, int> {

  BottomNavigationBarBloc() : super(0) {
    on<TabChangeEvent>((event, emit) => emit(event.newIndex));
  }
}

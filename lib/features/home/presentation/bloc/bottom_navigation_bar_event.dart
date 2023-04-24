part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends BottomNavigationBarEvent{
  final int newIndex;
  const TabChangeEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

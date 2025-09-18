part of 'tab_bar_cubit.dart';

class TabBarState extends Equatable {
  final int index;

  const TabBarState({required this.index});

  @override
  List<Object?> get props => [index];
}

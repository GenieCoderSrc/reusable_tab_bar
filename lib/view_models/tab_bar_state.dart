part of 'tab_bar_cubit.dart';

class TabBarState extends Equatable {
  final int activeTabIndex;

  const TabBarState({required this.activeTabIndex});

  @override
  List<Object?> get props => [activeTabIndex];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState(activeTabIndex: 0));

  void setActiveTabIndex(int index) {
    debugPrint('TabBarCubit | Current Index: $index');
    emit(TabBarState(activeTabIndex: index));
  }
}

// Future<void>.delayed(const Duration(milliseconds: 500), () {
//         debugPrint('TabBarCubit | Current Index: $index');
//         emit(index);
//       });

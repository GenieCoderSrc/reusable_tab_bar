import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(const TabBarState(index: 0));

  void selectTab(int index) {
    debugPrint('TabBarCubit | Current Index: $index');
    emit(TabBarState(index: index));
  }
}

// Future<void>.delayed(const Duration(milliseconds: 500), () {
//         debugPrint('TabBarCubit | Current Index: $index');
//         emit(index);
//       });

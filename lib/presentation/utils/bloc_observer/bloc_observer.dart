// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CustomBlocObserver extends BlocObserver {
  List<BlocBase> openedBlocs = [];

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    openedBlocs.add(bloc);
    debugPrint(
        "\x1B[94mСоздан\x1B[0m BLoC \x1B[32m${bloc.runtimeType}\x1B[0m, открыто: ${openedBlocs.length}");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    openedBlocs.remove(openedBlocs.firstWhere((element) => element == bloc));
    debugPrint(
        "\x1B[91mЗакрыт\x1B[0m BLoC \x1B[32m${bloc.runtimeType}\x1B[0m, открыто: ${openedBlocs.length}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger().e("Ошибка BLoC \x1B[32m${bloc.runtimeType}\x1B[0m: $error",
        stackTrace: stackTrace, error: error);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
        "Изменён BLoC \x1B[32m${bloc.runtimeType}\x1B[0m: \x1B[37m${change.currentState.runtimeType}\x1B[0m => \x1B[95m${change.nextState.runtimeType}\x1B[0m");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(
        "\x1B[96mВызвано событие\x1B[0m BLoC \x1B[32m${bloc.runtimeType}\x1B[0m: \x1B[36m${event.runtimeType}\x1B[0m");
  }
}

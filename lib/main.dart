import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/utils/bloc_observer/bloc_observer.dart';
import 'package:news_app/services/di/di.dart';

import 'app.dart';

void main() {
  configureDependencies();
  Bloc.observer = CustomBlocObserver();
  runApp(App());
}

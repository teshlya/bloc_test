import 'package:bloc/bloc.dart';
import 'package:bloc_test/app.dart';
import 'package:bloc_test/simple_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

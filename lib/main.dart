import 'dart:io';
import 'package:budgetin/app.dart';
import 'package:flutter/material.dart';
import 'package:budgetin/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:budgetin/auth/auth.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final authRepository = AuthRepository();

  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowMinSize(const Size(450, 800));
      setWindowMaxSize(const Size(450, 800));
      // setWindowMaxSize(Size.infinite);
    }
  }

  runApp(
    BlocProvider<AuthBloc>(
      create: (context) {
        return AuthBloc(
          authRepository: authRepository,
        )..add(
            AppStarted(),
          );
      },
      child: const App(),
    ),
  );
}

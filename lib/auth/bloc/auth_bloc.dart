import 'package:bloc/bloc.dart';
import 'package:budgetin/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthUninitialized()) {
    on<AppStarted>(
      (event, emit) async {
        final bool hasToken = await authRepository.hasToken();
        if (hasToken) {
          emit(AuthAuthenticated());
        } else {
          print('AuthUnauthenticated');
          emit(AuthUnauthenticated());
          await Future<void>.delayed(const Duration(seconds: 3));
          emit(AuthAuthenticated());
          print('AuthAuthenticated');
        }
      },
    );
  }
}

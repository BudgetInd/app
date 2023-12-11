import 'package:budgetin/auth/auth.dart';
// import 'package:budgetin/dashboard/dashboard.dart';
// import 'package:budgetin/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              // if (state is AuthAuthenticated) {
              //   return const DashboardPage();
              // }
              // if (state is AuthUnauthenticated) {
              //   return const LoginPage();
              // }
              if (true) {
                return Scaffold(
                  body: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
                            strokeWidth: 4.0,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      // case '/home':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<NavBarBloc>.value(
      //       value: NavBarBloc(),
      //       child: const MainPage(),
      //     ),
      //   );
      // case '/sub':
      //   return MaterialPageRoute(
      //     builder: (_) => const SubPage(),
      //   );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('ERROR'),
            ),
          );
        });
    }
  }
}

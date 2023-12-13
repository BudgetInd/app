import 'package:budgetin/app/services/di.dart';
import 'package:flutter/material.dart';
import 'package:budgetin/auth/auth.dart';
// import 'package:budgetin/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budgetin/app/config/config.dart';
// import 'package:budgetin/dashboard/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      // navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator().generateRoute,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state) {
            case AuthAuthenticated _:
              // return const DashboardPage();
              return const MyApp();
            case AuthUnauthenticated _:
              //   return BlocProvider<LoginBloc>(
              //     create: (context) => LoginBloc(APILogin()),
              //     child: const LoginPage(),
              //   );
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
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth: 4.0,
                        ),
                      )
                    ],
                  ),
                ),
              );
            default:
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
  }
}

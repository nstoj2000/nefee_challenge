import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nefee_dev_challenge/core/routes/named_routes.dart';
import 'package:nefee_dev_challenge/core/routes/routes.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            decorationColor: Colors.white,
          ),
          useMaterial3: false,
        ),
        routes: routes,
        initialRoute: NamedRoutes.profile,
      ),
    );
  }
}

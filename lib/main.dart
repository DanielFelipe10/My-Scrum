import 'package:flutter/material.dart';
import 'package:my_scrum/app/providers/app_provider.dart';
import 'package:my_scrum/app/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: MainApp(), providers: AppProviders.providers);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.principalRoute,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:my_scrum/meta/views/auth/login_view.dart';
import 'package:my_scrum/meta/views/auth/principal.dart';
import 'package:my_scrum/meta/views/auth/register_view.dart';

class AppRoutes {
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String principalRoute = '/principal';

  static final routes = {
    loginRoute: (context) => LoginView(),
    registerRoute: (context) => RegisterView(),
    principalRoute: (context) => PrincipalView()
  };
}

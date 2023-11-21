import 'package:my_scrum/core/notifier/auth_notifier.dart';
import 'package:my_scrum/core/notifier/crud_notifier.dart';
import 'package:my_scrum/core/notifier/task_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => CrudNotifier()),
    ChangeNotifierProvider(create: (_) => TaskNotifier())
  ];
}

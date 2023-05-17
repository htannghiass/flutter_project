import 'package:fashion/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRoutes.navigator,
      initialRoute: loginPath,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: themeData,
    );
  }
}

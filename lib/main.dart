import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview110/utils/routes/routes.dart';
import 'package:interview110/utils/routes/routes_name.dart';
import 'package:interview110/view_model/auth_view_model.dart';
import 'package:interview110/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}


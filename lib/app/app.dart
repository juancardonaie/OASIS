import 'package:flutter/material.dart';
import 'config//router/app_router.dart';
import 'features/products/createProducts/services/notification_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final notificationService = NotificationService();

  @override
  void initState() {
    super.initState();

    notificationService.startConnection().then((_) {
      notificationService.listenNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

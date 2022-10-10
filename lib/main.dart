import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task/core/helpers/notification_service.dart';
import 'package:task/features/CurrentComic/presentation/manager/current_comic_cubit/current_comic_cubit.dart';
import 'package:task/features/NextComic/presentation/manager/next_comic_cubit/next_comic_cubit.dart';
import 'package:task/features/PreviousComic/presentation/manager/previous_comic_cubit/previous_comic_cubit.dart';

import 'core/config/routes.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const Task());
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
    Noti.showBigTextNotification(
        title: "Hello Dears",
        body: "Welcome, This task by Karim Mohamed",
        fln: flutterLocalNotificationsPlugin);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CurrentComicCubit()),
        BlocProvider(create: (context) => NextComicCubit()),
        BlocProvider(create: (context) => PreviousComicCubit()),
      ],
      child: MaterialApp(
        title: 'Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: splashScreen,
        onGenerateRoute: AppRoutes.generatedRoutes,
      ),
    );
  }
}

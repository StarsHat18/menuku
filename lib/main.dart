import 'package:flutter/material.dart';
import 'package:menuku/views/home/home_viewm.dart';
import 'package:menuku/views/report/report_viewm.dart';
import 'package:menuku/views/search/search_viewm.dart';
import 'package:menuku/views/spalsh_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider<ReportViewModel>(
          create: (_) => ReportViewModel(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (_) => SearchViewModel(),
        ),

      ],
      child: MaterialApp(
        title: 'Ukunem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurpleAccent,
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: RecepiSplashScreen(),
      ),
    );
  }
}

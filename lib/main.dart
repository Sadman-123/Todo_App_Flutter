import 'package:flutter/material.dart';
import 'package:myboss3/screens/task.dart';
void main()
{
  runApp(Main());
}
class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber,
          elevation: 4,
          centerTitle: true,
          shadowColor:Colors.black,
          titleTextStyle: TextStyle(color:Colors.black,fontSize: 27,fontWeight: FontWeight.bold),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:MaterialStateProperty.all(Colors.amber) ,
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            foregroundColor: MaterialStateProperty.all(Colors.black)
          )
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.amber,
          contentTextStyle: TextStyle(color: Colors.black)
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        listTileTheme: ListTileThemeData(
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 4,
          centerTitle: true,
          shadowColor:Colors.grey,
          titleTextStyle: TextStyle(color:Colors.black,fontSize: 27,fontWeight: FontWeight.bold),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor:MaterialStateProperty.all(Colors.blue) ,
            )
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.black)
              )
          ),
          snackBarTheme: SnackBarThemeData(
              backgroundColor: Colors.blue,
              contentTextStyle: TextStyle(color: Colors.white)
          )
      ),
      themeMode: ThemeMode.dark,
      home: Task(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/feature/home/view/movie_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            toolbarHeight: 150.0,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle:
                GoogleFonts.roboto(color: Colors.black, fontSize: 36)),
      ),
      home: const MovieView(),
    );
  }
}


/*


        elevation: 0,
        title: const Text(
          "Movies",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      );

 */

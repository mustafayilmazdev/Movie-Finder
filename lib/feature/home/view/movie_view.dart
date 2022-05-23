import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class MovieView extends StatefulWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    final String moviesText = "Movies";
    int _index = 0;
    int gecerli = 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: customAppBar(context, moviesText),
        body: Center(
          child: SizedBox(
            height: 200, // card height
            child: PageView.builder(
              itemCount: 10,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() {
                _index = index;
                gecerli = index;
                print("$_index  xxxx $index");
              }),
              itemBuilder: (_, i) {
                print(i);
                return Transform.scale(
                  scale: gecerli == _index ? 1 : 0.9,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Card ${i + 1}",
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  AppBar customAppBar(BuildContext context, String moviesText) {
    return AppBar(
      title: Padding(
        padding: context.verticalPaddingHigh,
        child: Text(moviesText),
      ),
    );
  }
}

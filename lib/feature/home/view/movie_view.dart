import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kartal/kartal.dart';
import 'package:movie_finder/core/network/network_service.dart';
import 'package:movie_finder/feature/home/service/movie_service.dart';
import 'package:movie_finder/feature/home/view_model/movie_viewmodel.dart';

class MovieView extends StatefulWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  State<MovieView> createState() => _MovieViewState();
}

List<String?> imgList = [];

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    final String moviesText = "Movies";
    int _index = 0;
    int gecerli = 0;
    return SafeArea(
      child: Scaffold(
        //appBar: customAppBar(context, moviesText),
        body: BlocProvider(
          create: ((context) => MovieCubit(
                MovieService(NetworkService.instance.networkManager),
              )),
          child:
              BlocConsumer<MovieCubit, MovieState>(listener: ((context, state) {
            if (state is Error) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Text("Error Page");
                  });
            }
          }), builder: (context, state) {
            return Column(
              children: [
                Expanded(child: buildBody(context, state)),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, MovieState state) {
    if (state is IsLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is Completed) {
      print("xxxxxxx ${state.movieModel?.results?.length}");
      imgList.add(
          "https://image.tmdb.org/t/p/w500/${state.movieModel?.results?.length}");
      return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            final List<Widget> imageSliders = imgList
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(item ?? "",
                                    fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      'No. ${imgList.indexOf(item)} image',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList();
            return Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            ));
          });
    }
    return Text("hata");
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

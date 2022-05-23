import 'package:bloc/bloc.dart';
import 'package:movie_finder/feature/home/model/movie_model.dart';
import 'package:movie_finder/feature/home/service/movie_service.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.service) : super(MovieInitial()) {
    fetchData();
  }

  IMovieService service;
  MovieModel? movieModel;
  bool isLoading = false;

  Future<void> fetchData() async {
    emit(IsLoading());
    movieModel = await service.getAllData();
    emit(Completed(movieModel: movieModel));
  }
}

class MovieInitial extends MovieState {}

abstract class MovieState {}

class Completed extends MovieState {
  MovieModel? movieModel;
  Completed({this.movieModel});
}

class IsLoading extends MovieState {}

class Error extends MovieState {}

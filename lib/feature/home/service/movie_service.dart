import 'package:vexana/vexana.dart';

import '../model/movie_model.dart';

abstract class IMovieService {
  final INetworkManager networkManager;
  IMovieService(this.networkManager);

  Future<MovieModel?> getAllData();
}

class MovieService extends IMovieService {
  MovieService(super.networkManager);
  final String baseUrl = "";

  @override
  Future<MovieModel?> getAllData() async {
    final response = await networkManager.send<MovieModel, MovieModel>(baseUrl,
        parseModel: MovieModel(), method: RequestType.GET);
    return response.data;
  }
}

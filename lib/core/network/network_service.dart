import 'package:vexana/vexana.dart';

class NetworkService {
  static NetworkService? _instance;
  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  late final INetworkManager networkManager;
  final String _baseUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=4d39795f983b17d04599ca28c076e2e4";

  NetworkService._init() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: _baseUrl));
  }
}

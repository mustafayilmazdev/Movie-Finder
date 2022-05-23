import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? networkManager;
  setUp(() {
    const String baseUrl =
        "https://api.themoviedb.org/3/movie/popular?api_key=4d39795f983b17d04599ca28c076e2e4&language=en-US&page=1";
    networkManager = NetworkManager(options: BaseOptions(baseUrl: baseUrl));
  });
}

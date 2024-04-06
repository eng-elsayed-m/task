part of '../data.dart';

abstract class MoviesRemoteSrc {
  Future<NowPlayingModel> fetchMovies(MovieParam page);
  Future<MovieDetailsModel> fetchMovieDatils(int id);
}

class MoviesRemoteSrcImpl implements MoviesRemoteSrc {
  final Dio _dio;

  MoviesRemoteSrcImpl({Dio? dio}) : _dio = dio ?? Dio();
  @override
  Future<NowPlayingModel> fetchMovies(MovieParam param) async {
    final url = param.search ? AppUrls.search : (AppUrls.movie + param.pageKey);
    try {
      final response = await _dio.get(url,
          queryParameters: {
            'page': param.page,
            'language': 'en-US',
            'query': param.search ? param.pageKey : null
          },
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NTNmNjYyM2EzY2I3Y2U0YzJlNDdlMDYyMjZhNDM2MCIsInN1YiI6IjY2MGYxZWJiZGE5ZWYyMDE3ZDU5OWUzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.si7KYCi3oOqFAiqaDGCa3uds_3LXOyvBvZl1Bza8g9Y',
            'Accept': 'application/json'
          }));
      debugPrint(response.statusMessage);
      debugPrint(response.requestOptions.path);

      if (response.statusCode! < 400) {
        debugPrint(response.data.toString());
        final decodedResponse = response.data;
        return NowPlayingModel.fromMap(decodedResponse);
      } else {
        throw ServerException('Error ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Error ${e.toString()}');
    }
  }

  @override
  Future<MovieDetailsModel> fetchMovieDatils(int id) async {
    try {
      final response = await _dio.get(AppUrls.movie + id.toString(),
          queryParameters: {},
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NTNmNjYyM2EzY2I3Y2U0YzJlNDdlMDYyMjZhNDM2MCIsInN1YiI6IjY2MGYxZWJiZGE5ZWYyMDE3ZDU5OWUzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.si7KYCi3oOqFAiqaDGCa3uds_3LXOyvBvZl1Bza8g9Y',
            'Accept': 'application/json'
          }));
      debugPrint(response.statusMessage);

      if (response.statusCode! < 400) {
        debugPrint(response.data.toString());
        final decodedResponse = response.data;
        return MovieDetailsModel.fromMap(decodedResponse);
      } else {
        throw ServerException('Error ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Error ${e.toString()}');
    }
  }
}

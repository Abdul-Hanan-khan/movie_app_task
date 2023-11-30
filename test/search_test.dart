import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_task/src/core/api_service.dart';
import 'package:movie_app_task/src/model/movie_details_model.dart';
import 'package:movie_app_task/src/model/upcoming_movies.dart';

void main() {
  late UpComingMovie mockUpComingMovie;

  setUpAll(() {
    mockUpComingMovie = UpComingMovie();
  });

  test("Search Movies Test", () async {
    mockUpComingMovie = await ApiService.searchMovie(query: "action");
    expect(mockUpComingMovie.results, isNotNull);
  });

  tearDownAll(() {
    mockUpComingMovie = UpComingMovie();
  });
}

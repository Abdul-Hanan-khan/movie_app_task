import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_task/src/core/api_service.dart';
import 'package:movie_app_task/src/model/movie_details_model.dart';
import 'package:movie_app_task/src/model/upcoming_movies.dart';

void main() {
  late UpComingMovie mockUpComingMovie;
  late SingleMovieDetails mockMovieDetails;

  setUpAll(() {
    mockUpComingMovie = UpComingMovie();
    mockMovieDetails = SingleMovieDetails();
  });

  test("Upcoming Movies Test", () async {
    mockUpComingMovie = await ApiService.upcomingMovies();
    expect(mockUpComingMovie.results, isNotNull);
  });

  test("Movie Details Test", () async {
    mockMovieDetails =
        await ApiService.getSingleMovieDetails(movieId: mockMovieDetails.id);
    expect(mockUpComingMovie.results![0].id, isNotNull);
  });

  test("Movie Trailer Test", () async {
     String mockTrailerId= await ApiService.getMovieTrailer(movieId: mockMovieDetails.id);
    expect(mockTrailerId, isEmpty);
  });

  tearDownAll(() {
    mockUpComingMovie = UpComingMovie();
    mockMovieDetails = SingleMovieDetails();
  });
}

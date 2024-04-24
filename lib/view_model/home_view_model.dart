

import 'package:flutter/cupertino.dart';

import '../data/response/status.dart';

import '../respository/home_repository.dart';


class HomeViewViewModel extends ChangeNotifier {
  final HomeRepository _repository = HomeRepository();
  MoviesListStatus moviesList = MoviesListStatus.loading();

  void fetchMoviesListApi() async {
    try {
      moviesList = MoviesListStatus.loading();
      notifyListeners();

      final response = await _repository.fetchMoviesList();
      moviesList = MoviesListStatus.completed(response);

      notifyListeners();
    } catch (error) {
      moviesList = MoviesListStatus.error(error.toString());
      notifyListeners();
    }
  }
}
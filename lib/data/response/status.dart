import '../../model/movies_model.dart';

class MoviesListStatus {
  final Status status;
  final MovieListModel? data;
  final String? message;

  MoviesListStatus({required this.status, this.data, this.message});

  factory MoviesListStatus.loading() => MoviesListStatus(status: Status.LOADING);
  factory MoviesListStatus.completed(MovieListModel data) =>
      MoviesListStatus(status: Status.COMPLETED, data: data);
  factory MoviesListStatus.error(String message) =>
      MoviesListStatus(status: Status.ERROR, message: message);
}

enum Status { LOADING, COMPLETED, ERROR }
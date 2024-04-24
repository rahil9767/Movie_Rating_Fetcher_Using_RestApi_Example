
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../model/movies_model.dart';
import '../res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesBaseUrl);
      return MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
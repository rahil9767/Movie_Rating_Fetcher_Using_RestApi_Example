import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/response/status.dart';
import '../model/movie_Item_model.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/home_view_model.dart';
import '../view_model/user_view_model.dart';
import 'movie_Deatil_View.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  Future<MovieDetailModel> fetchMovieDetail(String imdbID) async {
    final response = await http.get(Uri.parse('https://www.omdbapi.com/?apikey=39a36280&i=$imdbID'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return MovieDetailModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch movie details');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(child: Text('Logout')),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString(), style: TextStyle(color: Colors.indigo)));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data?.search?.length ?? 0,
                  itemBuilder: (context, index) {
                    var searchList = value.moviesList.data?.search;
                    if (searchList != null && index < searchList.length) {
                      var searchItem = searchList[index];
                      return Card(
                        color: Colors.grey,
                        elevation: 4,
                        child: GestureDetector(
                          onTap: () async {
                            if (searchItem.imdbID != null) {
                              try {
                                MovieDetailModel movieDetail = await fetchMovieDetail(searchItem.imdbID!);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailScreen(movie: movieDetail),
                                  ),
                                );
                              } catch (e) {
                                print('Error fetching movie details: $e');
                              }
                            }
                          },
                          child: ListTile(
                            leading: Image.network(
                              searchItem.poster?.toString() ?? '',
                              errorBuilder: (context, error, stack) {
                                return Icon(Icons.error, color: Colors.red);
                              },
                              height: 70,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              searchItem.title?.toString() ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            subtitle: Text(
                              searchItem.year?.toString() ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  searchItem.year ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}

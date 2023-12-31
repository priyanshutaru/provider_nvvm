

import 'package:flutter/cupertino.dart';
import 'package:provider_nvvm/data/response/api_response.dart';
import 'package:provider_nvvm/model/movies_model.dart';
import 'package:provider_nvvm/respository/home_repository.dart';
// import 'package:mvvm/data/response/api_response.dart';
// import 'package:mvvm/model/movies_model.dart';
// import 'package:mvvm/respository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {

  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response ;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi ()async{

    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value){

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.error(error.toString()));

    });
  }


}
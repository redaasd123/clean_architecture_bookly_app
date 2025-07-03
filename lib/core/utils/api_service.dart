import 'package:dio/dio.dart';

class ApiService{
  //https://www.googleapis.com/books/v1/volumes?q=programming
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  Dio dio;
  ApiService(this.dio);
  Future<Map<String,dynamic>> get({required String endPoint}) async {
     var response  = await dio.get('$_baseUrl$endPoint');
     return response.data;
  }

}


import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioError dioError){

    switch(dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'connection Timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'request To ApiServer was cansel');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'connection Timeout with ApiServer');
      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'try again');
      default:return ServerFailure(errMessage: 'opps there was an error try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode,dynamic response){
    if(statusCode==400||statusCode==401||statusCode==403){
      return ServerFailure(errMessage: response['error']['message']);
    }else if(statusCode ==404){
      return ServerFailure(errMessage: 'your request not found , please try later');
    }else if(statusCode==500){
      return ServerFailure(errMessage: 'Internal server error , try later');
    }else{
      return ServerFailure(errMessage: 'opps there was an error try again');
    }
  }

}

// ignore_for_file: unused_element

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/error/exceptions.dart';
import '../domainLayer/models/myModel.dart';

class Repository {
  Future<Either<String, MyModel>> getData() async {
    return _basicErrorHandling<MyModel>(
      onSuccess: () async {
        var url = "https://dev.minaini.com:2053/r/appointments";
        var headers = {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAwMjI4ODk0LCJpYXQiOjE3MDAxNDI0OTQsImp0aSI6ImM0MDg1OWExNmIyMzQ1YTU4ZjU1YjhhMWJiNTgzYzVhIiwidXNlcl9pZCI6Mn0.g6t14KMMDP0CcGlYOyq0xEL6TOIlm-rDtSaT5Ns4AQ0'
        };
        var res = await http.get(Uri.parse(url), headers: headers);
        var resbody;
        resbody = json.decode(res.body);

        return MyModel.fromJson(resbody);
      },
      onServerError: (exception) async {
        debugPrint('********** onServerError **********');
        debugPrint(exception.message);
        debugPrint(exception.code.toString());
        return exception.message;
      },
    );
  }
}

extension on Repository {
  Future<Either<String, T>> _basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(ServerException exception)? onServerError,
    Future<String> Function(CacheException exception)? onCacheError,
    Future<String> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on ServerException catch (e, s) {
      // recordError(e, s);
      debugPrint(s.toString());
      if (onServerError != null) {
        final f = await onServerError(e);
        return Left(f);
      }
      return const Left('Server Error');
    } on CacheException catch (e, s) {
      debugPrint(e.toString());
      if (onCacheError != null) {
        final f = await onCacheError(e);
        return Left(f);
      }
      return const Left('Cache Error');
    } catch (e, s) {
      // recordError(e, s);
      debugPrint(s.toString());
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f);
      }
      return Left(e.toString());
    }
  }
}

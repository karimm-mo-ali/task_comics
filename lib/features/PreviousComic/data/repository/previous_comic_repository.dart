import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/config/env.dart';
import '../../../../core/constants/end_points.dart';
import 'package:http/http.dart' as http;
import '../models/previous_comic_model.dart';

class PreviousComicRepoImpl {
  Future<PreviousComicModel?> getPreviousComic(int num) async {
    try {
      var response = await http
          .get(Uri.parse("${kAppConfig['test_api']}/$num/${EndPoints.comic}"));
      if (response.statusCode == 200) {
        final data = PreviousComicModel.fromJson(jsonDecode(response.body));
        return data;
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print('Timeout Error: $e');
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('Socket Error: $e');
      }
    } on Error catch (e) {
      if (kDebugMode) {
        print('General Error: $e');
      }
    }
  }
}

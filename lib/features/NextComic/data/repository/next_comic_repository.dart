import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/features/CurrentComic/data/models/current_comic_model.dart';
import '../../../../core/config/env.dart';
import '../../../../core/constants/end_points.dart';
import 'package:http/http.dart' as http;

import '../models/next_comic_model.dart';

class NextComicRepoImpl {
  Future<NextComicModel?> getNextComic(int num) async {
    try {
      var response = await http.get(
        Uri.parse("${kAppConfig['test_api']}/$num/${EndPoints.comic}"),
      );
      if (response.statusCode == 200) {
        final data = NextComicModel.fromJson(jsonDecode(response.body));
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

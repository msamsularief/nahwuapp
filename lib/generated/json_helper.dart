import 'dart:convert';

import 'package:flutter/services.dart';

class JsonHelper {
  static Future<Map<String, dynamic>> readJsonFromAssets(
    String assetsPath,
  ) async {
    return rootBundle.loadString(assetsPath).then(
          (jsonStr) => json.decoder.convert(jsonStr),
        );
  }
}

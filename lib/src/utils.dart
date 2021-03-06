import 'dart:developer';

import 'package:flutter/foundation.dart' show kIsWeb;

void printDebugLog(String tag, String msg) {
  if (kIsWeb) {
    print('$tag: $msg');
  } else {
    log(msg, name: tag);
  }
}

String getFullURL(final String url, final Map<String, String>? params) {
  var fullURL = url;

  if (params != null && params.isNotEmpty) {
    fullURL += '?';
    params.forEach((key, value) {
      if (fullURL[fullURL.length - 1] != '?') {
        fullURL += '&';
      }
      fullURL += key + '=' + value;
    });
  }

  return fullURL;
}

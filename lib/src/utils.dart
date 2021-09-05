import 'dart:developer';

void printDebugLog(String tag, String msg) {
  log('$tag : $msg');
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

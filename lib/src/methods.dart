import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:http/http.dart' as http;

import 'attachment_file.dart';
import 'consts.dart';
import 'enums.dart';
import 'response.dart';
import 'utils.dart';

class REST {
  Future<Response> get({
    final Function(Response)? onResponse,
    final VoidCallback? onTimeout,
    final VoidCallback? onNoInternet,
    required final String tag,
    required final String url,
    final Map<String, String> headers = defaultJsonHeaders,
    final Map<String, String>? params,
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) async {
    final fullUrl = getFullURL(url, params);
    http.Response response = http.Response('', 444);

    try {
      response = await http.get(Uri.parse(fullUrl), headers: headers).timeout(
        timeoutDuration,
        onTimeout: () {
          printDebugLog(
            tag,
            '\nRequest URL: $fullUrl'
            '\nRequest Method: GET'
            '\nRequest Headers: $headers'
            '\nRequest Timeout: $timeoutDuration',
          );
          if (onTimeout != null) onTimeout();
          return response;
        },
      ).then((http.Response response) {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: GET'
          '\nRequest Headers: $headers'
          '\nResponse Code: ${response.statusCode}'
          '\nResponse Body: ${response.body}',
        );

        return response;
      });

      if (response.statusCode == 444) {
        return Response(
          status: ResponseStatus.timeout,
        );
      } else {
        if (onResponse != null) {
          onResponse(Response(
            status: ResponseStatus.ok,
            response: response,
          ));
        }
        return Response(
          status: ResponseStatus.ok,
          response: response,
        );
      }
    } on SocketException catch (_) {
      if (onNoInternet != null) onNoInternet();
      return Response(status: ResponseStatus.connectionError);
    } catch (_) {
      return Response(status: ResponseStatus.unknownException);
    }
  }

  Future<Response> post({
    final Function(Response)? onResponse,
    final VoidCallback? onTimeout,
    final VoidCallback? onNoInternet,
    required final String tag,
    required final String url,
    final Map<String, String> headers = defaultJsonHeaders,
    final Map<String, String>? params,
    final dynamic body,
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) async {
    final fullUrl = getFullURL(url, params);
    http.Response response = http.Response('', 444);

    try {
      response = await http
          .post(Uri.parse(fullUrl), headers: headers, body: body)
          .timeout(
        timeoutDuration,
        onTimeout: () {
          printDebugLog(
            tag,
            '\nRequest URL: $fullUrl'
            '\nRequest Method: POST'
            '\nRequest Headers: $headers'
            '\nRequest Body: $body'
            '\nRequest Timeout: $timeoutDuration',
          );

          if (onTimeout != null) onTimeout();

          return response;
        },
      ).then((http.Response response) {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: POST'
          '\nRequest Headers: $headers'
          '\nRequest Body: $body'
          '\nResponse Code: ${response.statusCode}'
          '\nResponse Body: ${response.body}',
        );

        return response;
      });

      if (response.statusCode == 444) {
        return Response(
          status: ResponseStatus.timeout,
        );
      } else {
        if (onResponse != null) {
          onResponse(Response(
            status: ResponseStatus.ok,
            response: response,
          ));
        }
        return Response(
          status: ResponseStatus.ok,
          response: response,
        );
      }
    } on SocketException catch (_) {
      if (onNoInternet != null) onNoInternet();
      return Response(status: ResponseStatus.connectionError);
    } catch (_) {
      return Response(status: ResponseStatus.unknownException);
    }
  }

  Future<Response> put({
    final Function(Response)? onResponse,
    final VoidCallback? onTimeout,
    final VoidCallback? onNoInternet,
    required final String tag,
    required final String url,
    final Map<String, String> headers = defaultJsonHeaders,
    final dynamic body,
    final Map<String, String>? params,
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) async {
    final fullUrl = getFullURL(url, params);
    http.Response response = http.Response('', 444);

    try {
      response = await http
          .put(Uri.parse(fullUrl), headers: headers, body: body)
          .timeout(
        timeoutDuration,
        onTimeout: () {
          printDebugLog(
            tag,
            '\nRequest URL: $fullUrl'
            '\nRequest Method: PUT'
            '\nRequest Headers: $headers'
            '\nRequest Body: $body'
            '\nRequest Timeout: $timeoutDuration',
          );

          if (onTimeout != null) onTimeout();

          return response;
        },
      ).then((http.Response response) {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: PUT'
          '\nRequest Headers: $headers'
          '\nRequest Body: $body'
          '\nResponse Code: ${response.statusCode}'
          '\nResponse Body: ${response.body}',
        );

        return response;
      });
      if (response.statusCode == 444) {
        return Response(
          status: ResponseStatus.timeout,
        );
      } else {
        if (onResponse != null) {
          onResponse(Response(
            status: ResponseStatus.ok,
            response: response,
          ));
        }
        return Response(
          status: ResponseStatus.ok,
          response: response,
        );
      }
    } on SocketException catch (_) {
      if (onNoInternet != null) onNoInternet();
      return Response(status: ResponseStatus.connectionError);
    } catch (_) {
      return Response(status: ResponseStatus.unknownException);
    }
  }

  Future<Response> patch({
    final Function(Response)? onResponse,
    final VoidCallback? onTimeout,
    final VoidCallback? onNoInternet,
    required final String tag,
    required final String url,
    final Map<String, String> headers = defaultJsonHeaders,
    final dynamic body,
    final Map<String, String>? params,
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) async {
    final fullUrl = getFullURL(url, params);
    http.Response response = http.Response('', 444);

    try {
      response = await http
          .patch(Uri.parse(fullUrl), headers: headers, body: body)
          .timeout(
        timeoutDuration,
        onTimeout: () {
          printDebugLog(
            tag,
            '\nRequest URL: $fullUrl'
            '\nRequest Method: PATCH'
            '\nRequest Headers: $headers'
            '\nRequest Body: $body'
            '\nRequest Timeout: $timeoutDuration',
          );

          if (onTimeout != null) onTimeout();
          return response;
        },
      ).then((http.Response response) {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: PATCH'
          '\nRequest Headers: $headers'
          '\nRequest Body: $body'
          '\nResponse Code: ${response.statusCode}'
          '\nResponse Body: ${response.body}',
        );

        return response;
      });
      if (response.statusCode == 444) {
        return Response(
          status: ResponseStatus.timeout,
        );
      } else {
        if (onResponse != null) {
          onResponse(Response(
            status: ResponseStatus.ok,
            response: response,
          ));
        }
        return Response(
          status: ResponseStatus.ok,
          response: response,
        );
      }
    } on SocketException catch (_) {
      if (onNoInternet != null) onNoInternet();
      return Response(status: ResponseStatus.connectionError);
    } catch (_) {
      return Response(status: ResponseStatus.unknownException);
    }
  }

  Future<Response> delete({
    final Function(Response)? onResponse,
    final VoidCallback? onTimeout,
    final VoidCallback? onNoInternet,
    required final String tag,
    required final String url,
    final Map<String, String> headers = defaultJsonHeaders,
    final dynamic body,
    final Map<String, String>? params,
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) async {
    final fullUrl = getFullURL(url, params);
    http.Response response = http.Response('', 444);

    try {
      response = await http
          .delete(
        Uri.parse(fullUrl),
        headers: headers,
      )
          .timeout(timeoutDuration, onTimeout: () {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: DELETE'
          '\nRequest Headers: $headers'
          '\nRequest Body: $body'
          '\nRequest Timeout: $timeoutDuration',
        );

        if (onTimeout != null) onTimeout();

        return response;
      }).then((http.Response response) {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: DELETE'
          '\nRequest Headers: $headers'
          '\nRequest Body: $body'
          '\nResponse Code: ${response.statusCode}'
          '\nResponse Body: ${response.body}',
        );

        return response;
      });
      if (response.statusCode == 444) {
        return Response(
          status: ResponseStatus.timeout,
        );
      } else {
        if (onResponse != null) {
          onResponse(Response(
            status: ResponseStatus.ok,
            response: response,
          ));
        }
        return Response(
          status: ResponseStatus.ok,
          response: response,
        );
      }
    } on SocketException catch (_) {
      if (onNoInternet != null) onNoInternet();
      return Response(status: ResponseStatus.connectionError);
    } catch (_) {
      return Response(status: ResponseStatus.unknownException);
    }
  }

  Future<StreamedResponse> restWithFile({
    final Function(StreamedResponse)? onResponse,
    final VoidCallback? onTimeout,
    final VoidCallback? onNoInternet,
    required final String tag,
    required final HttpMethod apiMethod,
    required final String url,
    final Map<String, String> headers = defaultJsonHeaders,
    final Map<String, dynamic>? body,
    final Map<String, String>? params,
    required final String apiKeyForFiles,
    required final List<AttachmentFile> files,
    final Duration timeoutDuration = defaultTimeoutDuration,
  }) async {
    final fullUrl = getFullURL(url, params);
    http.StreamedResponse response = http.StreamedResponse(Stream.empty(), 444);

    var request = http.MultipartRequest(
      apiMethod.toString().split('.').last.toUpperCase(),
      Uri.parse(fullUrl),
    );
    request.headers.addAll(headers);
    if (body != null && body.isNotEmpty) {
      body.forEach((key, value) {
        request.fields[key] = value;
      });
    }

    if (files.isNotEmpty) {
      for (var file in files) {
        request.files.add(http.MultipartFile.fromBytes(
          apiKeyForFiles,
          file.data,
          filename: file.fileNameWithExtension,
        ));
      }
    }

    try {
      response = await request.send().timeout(
        timeoutDuration,
        onTimeout: () {
          printDebugLog(
            tag,
            '\nRequest URL: $fullUrl'
            '\nRequest Method: ${apiMethod.toString().split('.').last.toUpperCase()}'
            '\nRequest Headers: $headers'
            '\nRequest Key: $apiKeyForFiles'
            '\nRequest Body: $body'
            '\nRequest Timeout: $timeoutDuration',
          );

          if (onTimeout != null) onTimeout();

          return response;
        },
      ).then((http.StreamedResponse response) {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: ${apiMethod.toString().split('.').last.toUpperCase()}'
          '\nRequest Headers: $headers'
          '\nRequest Key: $apiKeyForFiles'
          '\nRequest Body: $body'
          '\nResponse Code: ${response.statusCode}'
          '\nResponse Body: ${response.stream}',
        );

        return response;
      });

      if (response.statusCode == 444) {
        return StreamedResponse(
          status: ResponseStatus.timeout,
        );
      } else {
        if (onResponse != null) {
          onResponse(StreamedResponse(
            status: ResponseStatus.ok,
            response: response,
          ));
        }
        return StreamedResponse(
          status: ResponseStatus.ok,
          response: response,
        );
      }
    } on SocketException catch (_) {
      if (onNoInternet != null) onNoInternet();
      return StreamedResponse(status: ResponseStatus.connectionError);
    } catch (_) {
      return StreamedResponse(status: ResponseStatus.unknownException);
    }
  }
}

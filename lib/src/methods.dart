import 'dart:async';
import 'dart:html';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'consts.dart';
import 'enums.dart';
import 'response.dart';
import 'utils.dart';

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
  var fullUrl = getFullURL(url, params);

  try {
    final response =
        await http.get(Uri.parse(fullUrl), headers: headers).timeout(
      timeoutDuration,
      onTimeout: () {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: ${HttpMethod.GET}'
          '\nRequest Headers: ${headers.toString()}'
          '\nRequest Params: ${params!.toString()}'
          '\nRequest Timeout: $timeoutDuration',
        );

        onTimeout!();

        return Future.value(null);
      },
    ).then((http.Response response) {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: ${HttpMethod.GET}'
        '\nRequest Headers: ${headers.toString()}'
        '\nRequest Params: ${params!.toString()}'
        '\nResponse Code: ${response.statusCode}'
        '\nResponse Body: ${response.body}',
      );

      onResponse!(Response(
        status: ResponseStatus.ok,
        response: response,
      ));

      return response;
    });

    return Response(
      status: ResponseStatus.ok,
      response: response,
    );
  } on TimeoutException catch (_) {
    return Response(status: ResponseStatus.timeout);
  } on SocketException catch (_) {
    onNoInternet!();
    return Response(status: ResponseStatus.connectionError);
  }
}

Future<Response> post({
  final Function(Response)? onResponse,
  final VoidCallback? onTimeout,
  final VoidCallback? onConnectionError,
  required final String tag,
  required final String url,
  final Map<String, String> headers = defaultJsonHeaders,
  final Map<String, String>? params,
  final dynamic body,
  final Duration timeoutDuration = defaultTimeoutDuration,
}) async {
  var fullUrl = getFullURL(url, params);

  try {
    final response = await http
        .post(Uri.parse(fullUrl), headers: headers, body: body)
        .timeout(
      timeoutDuration,
      onTimeout: () {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: ${HttpMethod.POST}'
          '\nRequest Headers: ${headers.toString()}'
          '\nRequest Body: ${body!}'
          '\nRequest Params: ${params!}'
          '\nRequest Timeout: $timeoutDuration',
        );
        onTimeout!();
        return Future.value(null);
      },
    ).then((http.Response response) {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: ${HttpMethod.POST}'
        '\nRequest Headers: ${headers.toString()}'
        '\nRequest Body: ${body!}'
        '\nRequest Params: ${params!}'
        '\nResponse Code: ${response.statusCode}'
        '\nResponse Body: ${response.body}',
      );

      onResponse!(Response(
        status: ResponseStatus.ok,
        response: response,
      ));

      return response;
    });

    return Response(
      status: ResponseStatus.ok,
      response: response,
    );
  } on TimeoutException catch (_) {
    return Response(status: ResponseStatus.timeout);
  } on SocketException catch (_) {
    onConnectionError!();
    return Response(status: ResponseStatus.connectionError);
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
  var fullUrl = getFullURL(url, params);
  try {
    final response = await http
        .put(Uri.parse(fullUrl), headers: headers, body: body)
        .timeout(
      timeoutDuration,
      onTimeout: () {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: ${HttpMethod.PUT}'
          '\nRequest Headers: ${headers.toString()}'
          '\nRequest Body: ${body!}'
          '\nRequest Timeout: $timeoutDuration',
        );

        onTimeout!();

        return Future.value(null);
      },
    ).then((http.Response response) {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: ${HttpMethod.PUT}'
        '\nRequest Headers: ${headers.toString()}'
        '\nRequest Body: ${body!}'
        '\nResponse Code: ${response.statusCode}'
        '\nResponse Body: ${response.body}',
      );

      onResponse!(Response(
        status: ResponseStatus.ok,
        response: response,
      ));

      return response;
    });

    return Response(
      status: ResponseStatus.ok,
      response: response,
    );
  } on TimeoutException catch (_) {
    return Response(status: ResponseStatus.timeout);
  } on SocketException catch (_) {
    onNoInternet!();
    return Response(status: ResponseStatus.connectionError);
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
  var fullUrl = getFullURL(url, params);

  try {
    final response = await http
        .patch(Uri.parse(fullUrl), headers: headers, body: body)
        .timeout(
      timeoutDuration,
      onTimeout: () {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: ${HttpMethod.PATCH}'
          '\nRequest Headers: ${headers.toString()}'
          '\nRequest Body: ${body!}'
          '\nRequest Timeout: $timeoutDuration',
        );

        onTimeout!();

        return Future.value(null);
      },
    ).then((http.Response response) {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: ${HttpMethod.PATCH}'
        '\nRequest Headers: ${headers.toString()}'
        '\nRequest Body: ${body!}'
        '\nResponse Code: ${response.statusCode}'
        '\nResponse Body: ${response.body}',
      );

      onResponse!(Response(
        status: ResponseStatus.ok,
        response: response,
      ));

      return response;
    });

    return Response(
      status: ResponseStatus.ok,
      response: response,
    );
  } on TimeoutException catch (_) {
    return Response(status: ResponseStatus.timeout);
  } on SocketException catch (_) {
    onNoInternet!();
    return Response(status: ResponseStatus.connectionError);
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
  var fullUrl = getFullURL(url, params);

  try {
    final response = await http
        .delete(
      Uri.parse(fullUrl),
      headers: headers,
    )
        .timeout(timeoutDuration, onTimeout: () {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: ${HttpMethod.DELETE}'
        '\nRequest Headers: ${headers.toString()}'
        '\nRequest Body: $body}'
        '\nRequest Timeout: $timeoutDuration',
      );

      onTimeout!();

      return Future.value(null);
    }).then((http.Response response) {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: ${HttpMethod.DELETE}'
        '\nRequest Headers: ${headers.toString()}'
        '\nRequest Body: $body'
        '\nResponse Code: ${response.statusCode}'
        '\nResponse Body: ${response.body}',
      );

      onResponse!(Response(
        status: ResponseStatus.ok,
        response: response,
      ));

      return response;
    });

    return Response(
      status: ResponseStatus.ok,
      response: response,
    );
  } on TimeoutException catch (_) {
    return Response(status: ResponseStatus.timeout);
  } on SocketException catch (_) {
    onNoInternet!();
    return Response(status: ResponseStatus.connectionError);
  }
}

Future<StreamedResponse> apiCallWithFile({
  final Function(StreamedResponse)? onResponse,
  final VoidCallback? onTimeout,
  final VoidCallback? onNoInternet,
  required final String tag,
  required final HttpMethod apiMethod,
  required final String url,
  final Map<String, String> headers = defaultJsonHeaders,
  final Map<String, String>? body,
  final Map<String, String>? params,
  required final String apiKeyForFiles,
  required final List<String> filePaths,
  final Duration timeoutDuration = defaultTimeoutDuration,
}) async {
  var fullUrl = getFullURL(url, params);
  var request;
  switch (apiMethod) {
    case HttpMethod.POST:
      {
        request = http.MultipartRequest(
          'POST',
          Uri.parse(fullUrl),
        );
      }
      break;
    case HttpMethod.PUT:
      {
        request = http.MultipartRequest(
          'PUT',
          Uri.parse(fullUrl),
        );
      }
      break;
    case HttpMethod.PATCH:
      {
        request = http.MultipartRequest(
          'PATCH',
          Uri.parse(fullUrl),
        );
      }
      break;
    default:
      {
        request = http.MultipartRequest(
          'POST',
          Uri.parse(fullUrl),
        );
      }
  }

  request.headers.addAll(headers);
  if (body != null && body.isNotEmpty) {
    body.forEach((key, value) {
      request.fields[key] = value;
    });
  }

  if (filePaths.isNotEmpty) {
    for (var path in filePaths) {
      if (path.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
          apiKeyForFiles,
          path,
          filename: path.split('/').last,

          /// important : can alternate by own model  type
          /// instead of MediatType??
          contentType: MediaType('application', 'x-tar'),
        ));
      }
    }
  }

  try {
    final response = await request.send().timeout(
      timeoutDuration,
      onTimeout: () {
        printDebugLog(
          tag,
          '\nRequest URL: $fullUrl'
          '\nRequest Method: $apiMethod'
          '\nRequest Headers: $headers'
          '\nRequest Key: $apiKeyForFiles'
          '\nRequest Files: ${filePaths.toString()}'
          '\nRequest Body: ${body!.toString()}'
          '\nRequest Timeout: $timeoutDuration',
        );

        onTimeout!();

        return Future.value(null);
      },
    ).then((http.StreamedResponse response) {
      printDebugLog(
        tag,
        '\nRequest URL: $fullUrl'
        '\nRequest Method: $apiMethod'
        '\nRequest Headers: $headers'
        '\nRequest Key: $apiKeyForFiles'
        '\nRequest Files: ${filePaths.toString()}'
        '\nRequest Body: ${body!.toString()}'
        '\nResponse Code: ${response.statusCode}'
        '\nResponse Body: ${response.toString()}',
      );

      onResponse!(StreamedResponse(
        status: ResponseStatus.ok,
        response: response,
      ));

      return response;
    });

    return StreamedResponse(
      status: ResponseStatus.ok,
      response: response,
    );
  } on TimeoutException catch (_) {
    return StreamedResponse(status: ResponseStatus.timeout);
  } on SocketException catch (_) {
    onNoInternet!();
    return StreamedResponse(status: ResponseStatus.connectionError);
  }
}

import 'package:http/http.dart' as http;

enum ResponseStatus {
  ok,
  timeout,
  connectionError,
}

class Response {
  ResponseStatus status;
  http.Response? response;

  Response({required this.status, this.response});
}

class StreamedResponse {
  ResponseStatus status;
  http.StreamedResponse? response;

  StreamedResponse({required this.status, this.response});
}

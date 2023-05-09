class ApiRequest {
  final Uri url;
  final dynamic? body;
  final Map<String, String>? headers;

  ApiRequest(this.url, {this.body, this.headers = const {}});
}

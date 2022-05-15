class Encoder {
  String? encodeQueryParameters(Map<String, String> queryParams) {
    return queryParams.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join("&");
  }
}

class ApiConstants {
  static const baseUrl = 'api.themoviedb.org';
  static const popularApi = '/3/movie/popular';
  static const String apiKey = 'e1a9ca5336dcf41d2b143ca659935a3c';
  static const String authorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWE5Y2E1MzM2ZGNmNDFkMmIxNDNjYTY1OTkzNWEzYyIsInN1YiI6IjY1NDdjMjIzOWNjNjdiMDEzYTMxYjJhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vttIdTx7XmmC13Y_hwQ932HsowprU5HeF9EFH5jtEmk';
  static const Map<String, String> headers = {
    'Authorization': 'Bearer $authorizationToken',
    'accept': 'application/json',
  };
}

class ApiConstants {
  static const baseUrl = 'api.themoviedb.org';
  static const popularApi = '/3/movie/popular';
  static const newRealesesApi = '/3/movie/upcoming';
  static const recommendedApi = '/3/discover/movie';
  static const searchApi = '/3/search/movie';
  static const browseGenreApi = '/3/genre/movie/list';
  static const moviesByGenreApi = '/3/discover/movie';

  static const detailsApi = '/3/movie/';
  static const similarApi = '/3/movie/';
  static const String apiKey = 'e1a9ca5336dcf41d2b143ca659935a3c';

  static const String movieDetailsAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWE5Y2E1MzM2ZGNmNDFkMmIxNDNjYTY1OTkzNWEzYyIsInN1YiI6IjY1NDdjMjIzOWNjNjdiMDEzYTMxYjJhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vttIdTx7XmmC13Y_hwQ932HsowprU5HeF9EFH5jtEmk';
  static const String searchAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzM0YTJmOGIxMWEwZWJkM2E1M2RkZGI4ZjVlYjViZSIsInN1YiI6IjY1NGE5YTlhNmJlYWVhMDBhYzIyMzA5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.W6oJXDZx_OnYxqgk_G7Jtbl2wJUF2qi7E8W7GbPS7-s';
  static const String popularAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWE5Y2E1MzM2ZGNmNDFkMmIxNDNjYTY1OTkzNWEzYyIsInN1YiI6IjY1NDdjMjIzOWNjNjdiMDEzYTMxYjJhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vttIdTx7XmmC13Y_hwQ932HsowprU5HeF9EFH5jtEmk';
  static const String newRealesesAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWE5Y2E1MzM2ZGNmNDFkMmIxNDNjYTY1OTkzNWEzYyIsInN1YiI6IjY1NDdjMjIzOWNjNjdiMDEzYTMxYjJhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vttIdTx7XmmC13Y_hwQ932HsowprU5HeF9EFH5jtEmk';
  static const String recommendedAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWE5Y2E1MzM2ZGNmNDFkMmIxNDNjYTY1OTkzNWEzYyIsInN1YiI6IjY1NDdjMjIzOWNjNjdiMDEzYTMxYjJhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vttIdTx7XmmC13Y_hwQ932HsowprU5HeF9EFH5jtEmk';
  static const String browseGenreAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzM0YTJmOGIxMWEwZWJkM2E1M2RkZGI4ZjVlYjViZSI'
      'sInN1YiI6IjY1NGE5YTlhNmJlYWVhMDBhYzIyMzA5ZCIsInNjb3B'
      'lcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.W6oJXDZx_OnYxqgk_G7Jtbl2wJUF2qi7E8W7GbPS7-s';
  static const String moviesByGenreAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1M2I0NGYzNGZmNGYwZDA1ZmQyN2Y0Y2E2MWNhZjExMyIsInN1YiI6IjY1NDg3NjAwZDhjYzRhMDEwMDViOGY2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9_TxJDeYyA09gQKGEVq_Xp-Qf6elh85LYVk3O-r2UBw';

  static const String similarAuthorizationToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWE5Y2E1MzM2ZGNmNDFkMmIxNDNjYTY1OTkzNWEzYyIsInN1YiI6IjY1NDdjMjIzOWNjNjdiMDEzYTMxYjJhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vttIdTx7XmmC13Y_hwQ932HsowprU5HeF9EFH5jtEmk';
  static const Map<String, String> similarHeaders = {
    'Authorization': 'Bearer $similarAuthorizationToken',
    'accept': 'application/json',
  };

  static const Map<String, String> popularHeaders = {
    'Authorization': 'Bearer $popularAuthorizationToken',
    'accept': 'application/json',
  };
  static const Map<String, String> detailsHeaders = {
    'Authorization': 'Bearer $movieDetailsAuthorizationToken',
    'accept': 'application/json'
  };

  static const Map<String, String> newRealsesHeaders = {
    'Authorization': 'Bearer $newRealesesAuthorizationToken',
    'accept': 'application/json'
  };
  static const Map<String, String> recommendedHeaders = {
    'Authorization': 'Bearer $recommendedAuthorizationToken',
    'accept': 'application/json'
  };
  static const Map<String, String> searchHeaders = {
    'Authorization': 'Bearer $searchAuthorizationToken',
    'accept': 'application/json'
  };
  static const Map<String, String> browseGenreHeaders = {
    'Authorization': 'Bearer $browseGenreAuthorizationToken',
    'accept': 'application/json'
  };
  static const Map<String, String> moviesByGenreHeaders = {
    'Authorization': 'Bearer $moviesByGenreAuthorizationToken',
    'accept': 'application/json'
  };
}

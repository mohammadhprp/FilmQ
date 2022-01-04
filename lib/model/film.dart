class Film {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  Film({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Film.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String,dynamic>)).toList();
    totalPages = json['total_pages'] as int?;
    totalResults = json['total_results'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['page'] = page;
    json['results'] = results?.map((e) => e.toJson()).toList();
    json['total_pages'] = totalPages;
    json['total_results'] = totalResults;
    return json;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? voteCount;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  int? id;
  bool? video;
  double? voteAverage;
  String? title;
  String? overview;
  String? releaseDate;
  double? popularity;
  String? mediaType;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.overview,
    this.releaseDate,
    this.popularity,
    this.mediaType,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    genreIds = (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList();
    voteCount = json['vote_count'] as int?;
    originalLanguage = json['original_language'] as String?;
    originalTitle = json['original_title'] as String?;
    posterPath = json['poster_path'] as String?;
    id = json['id'] as int?;
    video = json['video'] as bool?;
    voteAverage = json['vote_average'] as double?;
    title = json['title'] as String?;
    overview = json['overview'] as String?;
    releaseDate = json['release_date'] as String?;
    popularity = json['popularity'] as double?;
    mediaType = json['media_type'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['genre_ids'] = genreIds;
    json['vote_count'] = voteCount;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['poster_path'] = posterPath;
    json['id'] = id;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['title'] = title;
    json['overview'] = overview;
    json['release_date'] = releaseDate;
    json['popularity'] = popularity;
    json['media_type'] = mediaType;
    return json;
  }
}
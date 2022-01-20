class Search {
  final int? page;
  final List<Results>? results;
  final int? totalPages;
  final int? totalResults;

  Search({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Search.fromJson(Map<String, dynamic> json)
      : page = json['page'] as int?,
        results = (json['results'] as List?)
            ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPages = json['total_pages'] as int?,
        totalResults = json['total_results'] as int?;

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults
      };
}

class Results {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? mediaType;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? firstAirDate;
  final String? title;
  final String? name;
  final bool? video;
  final int? voteCount;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.firstAirDate,
    this.title,
    this.name,
    this.video,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] as bool?,
        backdropPath = json['backdrop_path'] as String?,
        genreIds =
            (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList(),
        id = json['id'] as int?,
        mediaType = json['media_type'] as String?,
        originalLanguage = json['original_language'] as String?,
        originalTitle = json['original_title'] as String?,
        overview = json['overview'] as String?,
        posterPath = json['poster_path'] as String?,
        releaseDate = json['release_date'] as String?,
        firstAirDate = json['first_air_date'] as String?,
        title = json['title'] as String?,
        name = json['name'] as String?,
        video = json['video'] as bool?,
        voteCount = json['vote_count'] as int?;

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'media_type': mediaType,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'first_air_date': firstAirDate,
        'title': title,
        'name': name,
        'video': video,
        'vote_count': voteCount
      };
}

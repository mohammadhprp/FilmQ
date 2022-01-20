class Popular {
  final int? page;
  final List<Results>? results;
  final int? totalPages;
  final int? totalResults;

  Popular({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Popular.fromJson(Map<String, dynamic> json)
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
  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final int? id;
  final String? name;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;

  final String? posterPath;

  final int? voteCount;

  Results({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'] as String?,
        firstAirDate = json['first_air_date'] as String?,
        genreIds =
            (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList(),
        id = json['id'] as int?,
        name = json['name'] as String?,
        originCountry = (json['origin_country'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        originalLanguage = json['original_language'] as String?,
        originalName = json['original_name'] as String?,
        overview = json['overview'] as String?,
        posterPath = json['poster_path'] as String?,
        voteCount = json['vote_count'] as int?;

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'first_air_date': firstAirDate,
        'genre_ids': genreIds,
        'id': id,
        'name': name,
        'origin_country': originCountry,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'poster_path': posterPath,
        'vote_count': voteCount
      };
}

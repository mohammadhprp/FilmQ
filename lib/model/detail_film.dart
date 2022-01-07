class DetailFilm {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  DetailFilm({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  DetailFilm.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] as bool?,
        backdropPath = json['backdrop_path'] as String?,
        belongsToCollection = (json['belongs_to_collection'] as Map<String,dynamic>?) != null ? BelongsToCollection.fromJson(json['belongs_to_collection'] as Map<String,dynamic>) : null,
        budget = json['budget'] as int?,
        genres = (json['genres'] as List?)?.map((dynamic e) => Genres.fromJson(e as Map<String,dynamic>)).toList(),
        homepage = json['homepage'] as String?,
        id = json['id'] as int?,
        imdbId = json['imdb_id'] as String?,
        originalLanguage = json['original_language'] as String?,
        originalTitle = json['original_title'] as String?,
        overview = json['overview'] as String?,
        popularity = json['popularity'] as double?,
        posterPath = json['poster_path'] as String?,
        productionCompanies = (json['production_companies'] as List?)?.map((dynamic e) => ProductionCompanies.fromJson(e as Map<String,dynamic>)).toList(),
        productionCountries = (json['production_countries'] as List?)?.map((dynamic e) => ProductionCountries.fromJson(e as Map<String,dynamic>)).toList(),
        releaseDate = json['release_date'] as String?,
        revenue = json['revenue'] as int?,
        runtime = json['runtime'] as int?,
        spokenLanguages = (json['spoken_languages'] as List?)?.map((dynamic e) => SpokenLanguages.fromJson(e as Map<String,dynamic>)).toList(),
        status = json['status'] as String?,
        tagline = json['tagline'] as String?,
        title = json['title'] as String?,
        video = json['video'] as bool?,
        voteAverage = json['vote_average'] as double?,
        voteCount = json['vote_count'] as int?;

  Map<String, dynamic> toJson() => {
    'adult' : adult,
    'backdrop_path' : backdropPath,
    'belongs_to_collection' : belongsToCollection?.toJson(),
    'budget' : budget,
    'genres' : genres?.map((e) => e.toJson()).toList(),
    'homepage' : homepage,
    'id' : id,
    'imdb_id' : imdbId,
    'original_language' : originalLanguage,
    'original_title' : originalTitle,
    'overview' : overview,
    'popularity' : popularity,
    'poster_path' : posterPath,
    'production_companies' : productionCompanies?.map((e) => e.toJson()).toList(),
    'production_countries' : productionCountries?.map((e) => e.toJson()).toList(),
    'release_date' : releaseDate,
    'revenue' : revenue,
    'runtime' : runtime,
    'spoken_languages' : spokenLanguages?.map((e) => e.toJson()).toList(),
    'status' : status,
    'tagline' : tagline,
    'title' : title,
    'video' : video,
    'vote_average' : voteAverage,
    'vote_count' : voteCount
  };
}

class BelongsToCollection {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollection.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        posterPath = json['poster_path'] as String?,
        backdropPath = json['backdrop_path'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'poster_path' : posterPath,
    'backdrop_path' : backdropPath
  };
}

class Genres {
  final int? id;
  final String? name;

  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name
  };
}

class ProductionCompanies {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        logoPath = json['logo_path'] as String?,
        name = json['name'] as String?,
        originCountry = json['origin_country'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'logo_path' : logoPath,
    'name' : name,
    'origin_country' : originCountry
  };
}

class ProductionCountries {
  final String? iso31661;
  final String? name;

  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(Map<String, dynamic> json)
      : iso31661 = json['iso_3166_1'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'iso_3166_1' : iso31661,
    'name' : name
  };
}

class SpokenLanguages {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguages.fromJson(Map<String, dynamic> json)
      : englishName = json['english_name'] as String?,
        iso6391 = json['iso_639_1'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'english_name' : englishName,
    'iso_639_1' : iso6391,
    'name' : name
  };
}
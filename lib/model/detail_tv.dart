class DetailTV {
  final String? backdropPath;
  final List<CreatedBy>? createdBy;
  final List<int>? episodeRunTime;
  final String? firstAirDate;
  final List<Genres>? genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String>? languages;
  final String? lastAirDate;
  final LastEpisodeToAir? lastEpisodeToAir;
  final String? name;
  final dynamic nextEpisodeToAir;
  final List<Networks>? networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final List<Seasons>? seasons;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;

  DetailTV({
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  DetailTV.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'] as String?,
        createdBy = (json['created_by'] as List?)?.map((dynamic e) => CreatedBy.fromJson(e as Map<String,dynamic>)).toList(),
        episodeRunTime = (json['episode_run_time'] as List?)?.map((dynamic e) => e as int).toList(),
        firstAirDate = json['first_air_date'] as String?,
        genres = (json['genres'] as List?)?.map((dynamic e) => Genres.fromJson(e as Map<String,dynamic>)).toList(),
        homepage = json['homepage'] as String?,
        id = json['id'] as int?,
        inProduction = json['in_production'] as bool?,
        languages = (json['languages'] as List?)?.map((dynamic e) => e as String).toList(),
        lastAirDate = json['last_air_date'] as String?,
        lastEpisodeToAir = (json['last_episode_to_air'] as Map<String,dynamic>?) != null ? LastEpisodeToAir.fromJson(json['last_episode_to_air'] as Map<String,dynamic>) : null,
        name = json['name'] as String?,
        nextEpisodeToAir = json['next_episode_to_air'],
        networks = (json['networks'] as List?)?.map((dynamic e) => Networks.fromJson(e as Map<String,dynamic>)).toList(),
        numberOfEpisodes = json['number_of_episodes'] as int?,
        numberOfSeasons = json['number_of_seasons'] as int?,
        originCountry = (json['origin_country'] as List?)?.map((dynamic e) => e as String).toList(),
        originalLanguage = json['original_language'] as String?,
        originalName = json['original_name'] as String?,
        overview = json['overview'] as String?,
        popularity = json['popularity'] as double?,
        posterPath = json['poster_path'] as String?,
        productionCompanies = (json['production_companies'] as List?)?.map((dynamic e) => ProductionCompanies.fromJson(e as Map<String,dynamic>)).toList(),
        productionCountries = (json['production_countries'] as List?)?.map((dynamic e) => ProductionCountries.fromJson(e as Map<String,dynamic>)).toList(),
        seasons = (json['seasons'] as List?)?.map((dynamic e) => Seasons.fromJson(e as Map<String,dynamic>)).toList(),
        spokenLanguages = (json['spoken_languages'] as List?)?.map((dynamic e) => SpokenLanguages.fromJson(e as Map<String,dynamic>)).toList(),
        status = json['status'] as String?,
        tagline = json['tagline'] as String?,
        type = json['type'] as String?,
        voteAverage = json['vote_average'] as double?,
        voteCount = json['vote_count'] as int?;

  Map<String, dynamic> toJson() => {
    'backdrop_path' : backdropPath,
    'created_by' : createdBy?.map((e) => e.toJson()).toList(),
    'episode_run_time' : episodeRunTime,
    'first_air_date' : firstAirDate,
    'genres' : genres?.map((e) => e.toJson()).toList(),
    'homepage' : homepage,
    'id' : id,
    'in_production' : inProduction,
    'languages' : languages,
    'last_air_date' : lastAirDate,
    'last_episode_to_air' : lastEpisodeToAir?.toJson(),
    'name' : name,
    'next_episode_to_air' : nextEpisodeToAir,
    'networks' : networks?.map((e) => e.toJson()).toList(),
    'number_of_episodes' : numberOfEpisodes,
    'number_of_seasons' : numberOfSeasons,
    'origin_country' : originCountry,
    'original_language' : originalLanguage,
    'original_name' : originalName,
    'overview' : overview,
    'popularity' : popularity,
    'poster_path' : posterPath,
    'production_companies' : productionCompanies?.map((e) => e.toJson()).toList(),
    'production_countries' : productionCountries?.map((e) => e.toJson()).toList(),
    'seasons' : seasons?.map((e) => e.toJson()).toList(),
    'spoken_languages' : spokenLanguages?.map((e) => e.toJson()).toList(),
    'status' : status,
    'tagline' : tagline,
    'type' : type,
    'vote_average' : voteAverage,
    'vote_count' : voteCount
  };
}

class CreatedBy {
  final int? id;
  final String? creditId;
  final String? name;
  final int? gender;
  final String? profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  CreatedBy.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        creditId = json['credit_id'] as String?,
        name = json['name'] as String?,
        gender = json['gender'] as int?,
        profilePath = json['profile_path'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'credit_id' : creditId,
    'name' : name,
    'gender' : gender,
    'profile_path' : profilePath
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

class LastEpisodeToAir {
  final String? airDate;
  final int? episodeNumber;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? seasonNumber;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;

  LastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  LastEpisodeToAir.fromJson(Map<String, dynamic> json)
      : airDate = json['air_date'] as String?,
        episodeNumber = json['episode_number'] as int?,
        id = json['id'] as int?,
        name = json['name'] as String?,
        overview = json['overview'] as String?,
        productionCode = json['production_code'] as String?,
        seasonNumber = json['season_number'] as int?,
        stillPath = json['still_path'] as String?,
        voteAverage = json['vote_average'] as double?,
        voteCount = json['vote_count'] as int?;

  Map<String, dynamic> toJson() => {
    'air_date' : airDate,
    'episode_number' : episodeNumber,
    'id' : id,
    'name' : name,
    'overview' : overview,
    'production_code' : productionCode,
    'season_number' : seasonNumber,
    'still_path' : stillPath,
    'vote_average' : voteAverage,
    'vote_count' : voteCount
  };
}

class Networks {
  final String? name;
  final int? id;
  final String? logoPath;
  final String? originCountry;

  Networks({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });

  Networks.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        id = json['id'] as int?,
        logoPath = json['logo_path'] as String?,
        originCountry = json['origin_country'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'id' : id,
    'logo_path' : logoPath,
    'origin_country' : originCountry
  };
}

class ProductionCompanies {
  final int? id;
  final dynamic logoPath;
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
        logoPath = json['logo_path'],
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

class Seasons {
  final String? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;

  Seasons({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  Seasons.fromJson(Map<String, dynamic> json)
      : airDate = json['air_date'] as String?,
        episodeCount = json['episode_count'] as int?,
        id = json['id'] as int?,
        name = json['name'] as String?,
        overview = json['overview'] as String?,
        posterPath = json['poster_path'] as String?,
        seasonNumber = json['season_number'] as int?;

  Map<String, dynamic> toJson() => {
    'air_date' : airDate,
    'episode_count' : episodeCount,
    'id' : id,
    'name' : name,
    'overview' : overview,
    'poster_path' : posterPath,
    'season_number' : seasonNumber
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
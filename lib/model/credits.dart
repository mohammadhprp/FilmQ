class Credits {
  final int? id;
  final List<Cast>? cast;
  final List<Crew>? crew;

  Credits({
    this.id,
    this.cast,
    this.crew,
  });

  Credits.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        cast = (json['cast'] as List?)?.map((dynamic e) => Cast.fromJson(e as Map<String,dynamic>)).toList(),
        crew = (json['crew'] as List?)?.map((dynamic e) => Crew.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'cast' : cast?.map((e) => e.toJson()).toList(),
    'crew' : crew?.map((e) => e.toJson()).toList()
  };
}

class Cast {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Cast.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] as bool?,
        gender = json['gender'] as int?,
        id = json['id'] as int?,
        knownForDepartment = json['known_for_department'] as String?,
        name = json['name'] as String?,
        originalName = json['original_name'] as String?,
        popularity = json['popularity'] as double?,
        profilePath = json['profile_path'] as String?,
        castId = json['cast_id'] as int?,
        character = json['character'] as String?,
        creditId = json['credit_id'] as String?,
        order = json['order'] as int?;

  Map<String, dynamic> toJson() => {
    'adult' : adult,
    'gender' : gender,
    'id' : id,
    'known_for_department' : knownForDepartment,
    'name' : name,
    'original_name' : originalName,
    'popularity' : popularity,
    'profile_path' : profilePath,
    'cast_id' : castId,
    'character' : character,
    'credit_id' : creditId,
    'order' : order
  };
}

class Crew {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  Crew.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] as bool?,
        gender = json['gender'] as int?,
        id = json['id'] as int?,
        knownForDepartment = json['known_for_department'] as String?,
        name = json['name'] as String?,
        originalName = json['original_name'] as String?,
        popularity = json['popularity'] as double?,
        profilePath = json['profile_path'] as String?,
        creditId = json['credit_id'] as String?,
        department = json['department'] as String?,
        job = json['job'] as String?;

  Map<String, dynamic> toJson() => {
    'adult' : adult,
    'gender' : gender,
    'id' : id,
    'known_for_department' : knownForDepartment,
    'name' : name,
    'original_name' : originalName,
    'popularity' : popularity,
    'profile_path' : profilePath,
    'credit_id' : creditId,
    'department' : department,
    'job' : job
  };
}
class DetailFilmImage {
  final List<Backdrops>? backdrops;

  DetailFilmImage({
    this.backdrops,
  });

  DetailFilmImage.fromJson(Map<String, dynamic> json)
      : backdrops = (json['backdrops'] as List?)?.map((dynamic e) => Backdrops.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'backdrops' : backdrops?.map((e) => e.toJson()).toList()
  };
}

class Backdrops {
  final String? filePath;

  Backdrops({
    this.filePath,
  });

  Backdrops.fromJson(Map<String, dynamic> json)
      :filePath = json['file_path'] as String?;


  Map<String, dynamic> toJson() => {
    'file_path' : filePath,
  };
}
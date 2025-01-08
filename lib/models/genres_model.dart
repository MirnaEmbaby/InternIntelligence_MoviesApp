class GenresModel {
  List<Genres>? genres;

  GenresModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
  }
}

class Genres {
  int? id;
  String? name;

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

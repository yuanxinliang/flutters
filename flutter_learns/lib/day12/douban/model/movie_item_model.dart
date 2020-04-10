
class MovieItemModel {
  String title;
  String originalTitle;
  String year;
  String imgURL;
  double rating;
  List<String> genres;
  List<Cast> casts;
  Director director;

  MovieItemModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.originalTitle = json['original_title'];
    this.year = json['year'];
    this.imgURL = json['images']['medium'];
    this.rating = json['rating']['average'];
    this.genres = json['genres'].cast<String>();
    List<Cast> casts = [];
    for (var cast in json['casts']) {
      casts.add(Cast.fromJson(cast));
//      print(cast);
    }
    this.casts = casts;
    this.director = Director.fromJson(json['directors'][0]);
  }

  @override
  String toString() {
    return 'MovieItemModel{title: $title, originalTitle: $originalTitle, year: $year, imgURL: $imgURL, rating: $rating, genres: $genres, casts: $casts, director: $director}';
  }


}

class Person {
  String name;
  Person.fromJson(Map<String, dynamic>json) {
    this.name = json['name'];
  }
}

class Cast extends Person {
  Cast.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  String toString() {
    return '$name';
  }

}

class Director extends Person {
  Director.fromJson(Map<String, dynamic> json) : super.fromJson(json);
  @override
  String toString() {
    return '$name';
  }
}
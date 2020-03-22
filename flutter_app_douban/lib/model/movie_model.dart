
class MovieModel {

  String imgUrl;
  String title;
  String year;
  double rating;
  String brief;
  String original_title;

  MovieModel.fromMap(Map<String, dynamic> map) {
    this.imgUrl = map['images']['medium'];
    this.title = map['title'];
    this.year = map['year'];
    this.rating = map['rating']['average'];
    this.original_title = map['original_title'];

    List genres = map['genres'];
    var temp = '';
    for (String t in genres) {
      temp = temp + t + " ";
    }

    List directors = map['directors'];
    if (directors.length > 0) {
      Map<String, dynamic> director = directors[0];
      temp = temp + '/ ' + director['name'];
    }

    List casts = map['casts'];
    if (casts.length > 0) {
      temp += ' /';
    };
    for (Map<String, dynamic> cast in casts) {
      temp += ' ${cast['name']}';
    }

    this.brief = temp;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'movie: ${this.title}, ${rating}, ${year}, ${brief}';
  }

}
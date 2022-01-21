//Class to desctructure json to object or vice versa
class Movie {
  final String title;
  final String overview;
  final num vote_average;
  final num vote_count;
  final String poster_path;
  final String release_date;

  Movie({
    required this.title,
    required this.overview,
    required this.vote_average,
    required this.vote_count,
    required this.poster_path,
    required this.release_date,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "overview": overview,
        "vote_average": vote_average,
        "vote_count": vote_count,
        "poster_pat": poster_path,
        "release_date": release_date,
      };
}

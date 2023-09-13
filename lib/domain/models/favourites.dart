class Favourites {
  final int id;
  final List<String> favourites;

  Favourites({
    required this.id,
    required this.favourites,
  });

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
    id: json["id"],
      favourites: (json['favourites'] as String).split(',')  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "favourites" : favourites.join(','),
  };
}

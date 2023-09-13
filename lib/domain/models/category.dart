class Category {
  final String id;
  final String name;
  final String description;
  final String createdAt;
  final String modifyAt;
  final String imageUrl;
  final List<String> announcements;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.modifyAt,
    required this.imageUrl,
    this.announcements = const [],
  });

  factory Category.fromString(String category, List<Category> categories) {
    final list = categories.where((element) => element.name == category);
    if (list.isEmpty) {
      return categories.first;
    } else {
      return list.first;
    }
  }

  factory Category.fromJson(Map<String, Object?> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      modifyAt: json['modifyAt'] as String,
      imageUrl: json['imageUrl'] as String,
      announcements: (json['announcements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
          [],
    );
  }
}
final categories = [
  {
    "id": "all",
    "name": "All",
    "description": "none",
    "createdAt": "2023-08-14T22:33:16.680",
    "modifyAt": "2023-08-14T22:33:16.680",
    "imageUrl": "https://img.icons8.com/?size=512&id=5479&format=png"
  },

  {
    "id": "electronics",
    "name": "Electronics",
    "description": "none",
    "createdAt": "2023-08-14T22:33:16.680",
    "modifyAt": "2023-08-14T22:33:16.680",
    "imageUrl": "https://img.icons8.com/?size=512&id=1345&format=png"
  },
  {
    "id": "jewelery",
    "name": "Jewelery",
    "description": "none",
    "createdAt": "2023-08-14T22:33:16.680",
    "modifyAt": "2023-08-14T22:33:16.680",
    "imageUrl": "https://img.icons8.com/jewelry"
  },

  {
    "id": "men's clothing",
    "name": "Men's clothing",
    "description": "none",
    "createdAt": "2023-08-14T22:33:16.680",
    "modifyAt": "2023-08-14T22:33:16.680",
    "imageUrl": "https://img.icons8.com/clothes"
  },



  {
    "id": "women's clothing",
    "name": "Women's clothing",
    "description": "none",
    "createdAt": "2023-08-14T22:33:16.680",
    "modifyAt": "2023-08-14T22:33:16.680",
    "imageUrl": "https://img.icons8.com/?size=512&id=12666&format=png"
  },

];
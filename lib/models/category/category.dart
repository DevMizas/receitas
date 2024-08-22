class Category {
  final String id;
  final String title;
  final String  urlImage;

  const Category({
    required this.id,
    required this.title,
    this.urlImage = "assets/not_image.jpg",
  });
}

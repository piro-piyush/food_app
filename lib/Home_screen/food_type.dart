
class CategoryType {
  String? name;
  String img;
  bool isSelected;

  CategoryType({
    required this.name,
    required this.img,
    this.isSelected = false,
  });
}
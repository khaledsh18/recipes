class Recipe {
  final String name;
  final String? rate;
  final int? cookTime;
  final String thumbnailUrl;
  final String description;
  final List<String>? instruction;

  Recipe({
    required this.name,
    required this.rate,
    required this.instruction,
    required this.description,
    required this.cookTime,
    required this.thumbnailUrl,
  });
}

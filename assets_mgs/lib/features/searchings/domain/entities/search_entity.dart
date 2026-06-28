class SearchEntity {
  final String? id;
  final String? type;
  final String? title;
  final String? subtitle;
  final String? status;
  final String? icon;

  /// complete object returned from backend
  final dynamic object;

  const SearchEntity({
    this.id,
    this.type,
    this.title,
    this.subtitle,
    this.status,
    this.icon,
    this.object,
  });
}
import '../../domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    super.id,
    super.type,
    super.title,
    super.subtitle,
    super.status,
    super.icon,
    super.object,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json["id"]?.toString(),
      type: json["type"]?.toString(),
      title: json["title"]?.toString(),
      subtitle: json["subtitle"]?.toString(),
      status: json["status"]?.toString(),
      icon: json["icon"]?.toString(),
      object: json["object"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "title": title,
      "subtitle": subtitle,
      "status": status,
      "icon": icon,
      "object": object,
    };
  }

  static List<SearchModel> fromList(List<dynamic> json) {
    return json
        .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
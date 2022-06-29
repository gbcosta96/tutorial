class CompanyModel {
    String name;
    String description;
    int year;
    String? refId;

    CompanyModel({
      required this.name,
      required this.description,
      required this.year,
    });

    factory CompanyModel.fromJson(Map<String, dynamic> json, String refId) {
      return CompanyModel(
        name: json['name'],
        description: json['description'],
        year: json['json'],
      );
    }

    Map<String, dynamic> toJson() {
      return <String, dynamic> {
        'name': name,
        'description': description,
        'year': year
      };
    }
}
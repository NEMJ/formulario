class CheckBoxModel {
  CheckBoxModel({
    required this.id,
    required this.title,
    required this.subtitle,
    this.checked = false,
  });

  String id;
  String title;
  String subtitle;
  bool checked;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "checked": checked,
    };
  }
}
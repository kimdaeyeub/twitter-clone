class Threads {
  String text;
  String file;
  int createdAt;

  Threads({required this.text, required this.file, required this.createdAt});

  Threads.formJson(Map<String, dynamic> json)
      : text = json["text"],
        createdAt = json["createdAt"],
        file = json["file"];

  Map<String, dynamic> tojson() {
    return {
      "text": text,
      "file": file,
      "createdAt": createdAt,
    };
  }
}

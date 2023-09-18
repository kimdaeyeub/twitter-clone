class Threads {
  String text;
  String file;

  Threads({required this.text, required this.file});

  Threads.formJson(Map<String, dynamic> json)
      : text = json["text"],
        file = json["file"];

  Map<String, dynamic> tojson() {
    return {
      "text": text,
      "file": file,
    };
  }
}

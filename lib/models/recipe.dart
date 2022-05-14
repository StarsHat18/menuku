class Instruction {
  final String displayText;

  Instruction({
    required this.displayText,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        displayText: json["display_text"] != null ? json['display_text'] : '',
      );
}

class Section {
  Section({
    required this.components,
  });

  List<Component> components;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        components: json["components"] != null
            ? List<Component>.from(
                json["components"].map((x) => Component.fromJson(x)))
            : [],
      );
}

class Component {
  final String rawText;
  Component({
    required this.rawText,
  });

  factory Component.fromJson(Map<String, dynamic> json) => Component(
        rawText: json["raw_text"] != null ? json["raw_text"] : '',
      );

  Map<String, dynamic> toJson() => {
        "raw_text": rawText == null ? null : rawText,
      };
}

class Recipe {
  final String name;
  final String images;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instruction> instructions;
  final List<Section> sections;

  Recipe({
    required this.name,
    required this.images,
    required this.totalTime,
    required this.description,
    required this.videoUrl,
    required this.instructions,
    required this.sections,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      images: json['thumbnail_url'] as String,
      totalTime: json['total_time_minutes'] != null
          ? json['total_time_minutes'].toString()+" Minutes"
          : "30 minutes",
      description: json['description'] != null ? json['description'] : "",
      videoUrl: json['original_video_url'] != null
          ? json['original_video_url']
          : "No Video",
      instructions: json['instructions'] != null
          ? List<Instruction>.from(
              json["instructions"].map((x) => Instruction.fromJson(x)))
          : [],
      sections: json["sections"] != null
          ? List<Section>.from(json["sections"].map((x) => Section.fromJson(x)))
          : [],
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, totalTime: $totalTime}';
  }
}

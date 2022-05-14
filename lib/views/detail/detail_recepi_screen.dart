import 'package:flutter/material.dart';
import 'package:menuku/models/recipe.dart';
import 'package:menuku/views/widgets/card_recepi.dart';

class DetailRecepiScreen extends StatelessWidget {
  final String name;
  final String images;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instruction> instruction;
  final List<Section> sections;

  DetailRecepiScreen({
    required this.name,
    required this.images,
    required this.totalTime,
    required this.description,
    required this.videoUrl,
    required this.instruction,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    List<Component> components = List.from(sections[0].components);
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu, color: Colors.yellow,),
            SizedBox(width: 10),
            Text(
              'Food Recipes',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CardRecepi(
              title: name,
              cookTime: totalTime,
              thumbnailUrl: images,
              videoUrl: videoUrl,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description,
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.justify),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: instruction.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(instruction[index].displayText),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: components.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(components[index].rawText),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

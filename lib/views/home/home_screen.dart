import 'package:flutter/material.dart';
import 'package:menuku/models/api/recipe_api.dart';
import 'package:menuku/models/recipe.dart';
import 'package:menuku/views/detail/detail_recepi_screen.dart';
import 'package:menuku/views/home/home_viewm.dart';
import 'package:menuku/views/widgets/card_recepi.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false).getRecipes();
      setState(() {
        _isLoading= false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu, color: Colors.yellow),
            SizedBox(width: 10),
            Text(
              'Food Recipes',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: modelView.recipelist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: CardRecepi(
                    title: modelView.recipelist[index].name,
                    cookTime: modelView.recipelist[index].totalTime,
                    thumbnailUrl: modelView.recipelist[index].images,
                    videoUrl: modelView.recipelist[index].videoUrl,
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRecepiScreen(
                                  name: modelView.recipelist[index].name,
                                  totalTime:
                                      modelView.recipelist[index].totalTime,
                                  images: modelView.recipelist[index].images,
                                  description:
                                      modelView.recipelist[index].description,
                                  videoUrl:
                                      modelView.recipelist[index].videoUrl,
                                  instruction:
                                      modelView.recipelist[index].instructions,
                                  sections:
                                      modelView.recipelist[index].sections,
                                )))
                  },
                );
              },
            ),
    );
  }
}

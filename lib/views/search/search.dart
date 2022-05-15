import 'package:flutter/material.dart';
import 'package:menuku/views/detail/detail_recepi_screen.dart';
import 'package:menuku/views/search/search_viewm.dart';
import 'package:menuku/views/widgets/card_recepi.dart';
import 'package:provider/provider.dart';

class SearchRecepi extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final modelView = Provider.of<SearchViewModel>(context);
    return FutureBuilder(
      future: modelView.getRecipes(query),
      builder: (context, snapshot) {
        if (modelView.resultList.isEmpty) {
          return (Center(
            child: Text(
              "Recepi not found",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold),
            ),
          ));
        }
        return ListView.builder(
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
                              totalTime: modelView.recipelist[index].totalTime,
                              images: modelView.recipelist[index].images,
                              description:
                                  modelView.recipelist[index].description,
                              videoUrl: modelView.recipelist[index].videoUrl,
                              instruction:
                                  modelView.recipelist[index].instructions,
                              sections: modelView.recipelist[index].sections,
                            )))
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Recepi'),
    );
  }
}

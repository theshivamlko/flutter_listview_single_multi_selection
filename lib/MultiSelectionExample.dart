import 'package:flutter/material.dart';
import 'package:flutterlistviewselection/Movie.dart';

class MultiSelectionExample extends StatefulWidget {
  List<Movie> favoriteMovies;

  MultiSelectionExample(this.favoriteMovies);

  @override
  _MultiSelectionExampleState createState() => _MultiSelectionExampleState();
}

class _MultiSelectionExampleState extends State<MultiSelectionExample> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            widget.favoriteMovies[index].isSelected = !widget.favoriteMovies[index].isSelected;
            setState(() {});
          },
          child: Container(
            color: widget.favoriteMovies[index].isSelected
                ? Colors.green[100]
                : null,
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: widget.favoriteMovies[index].isSelected,
                     onChanged: (s) {
                       widget.favoriteMovies[index].isSelected = !widget.favoriteMovies[index].isSelected;
                      setState(() {});
                    }),
                Text(widget.favoriteMovies[index].movieName)
              ],
            ),
          ),
        );
      },
      itemCount: widget.favoriteMovies.length,
    );
  }
}

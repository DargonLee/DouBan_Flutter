import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final bool isEnable;
  final void Function(String value) onSubmit;

  SearchBar({
    Key key,
    this.isEnable,
    this.onSubmit
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 320,
      height: 32,
      child: TextField(
        enabled: isEnable,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.search),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(19.5)
          )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String? urlImage;
  const DisplayImage({Key? key, @required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      width: 100,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: _buildDisplayImage()));

  Widget _buildDisplayImage() => Image.network(urlImage ?? "");
}

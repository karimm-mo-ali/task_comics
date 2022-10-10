import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SharedImage extends StatelessWidget {
  final String image;
  const SharedImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
        fit: BoxFit.cover,
      ),
    );
  }
}

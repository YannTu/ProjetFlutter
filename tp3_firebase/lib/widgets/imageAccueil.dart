import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../dtos/transfert.dart';

class ImageAccueil extends StatelessWidget {
  const ImageAccueil({super.key, required Tache item})
      : _item = item;

  final Tache _item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.maxWidth;
          return Column(
            children: [
              SizedBox(height: 10),
              Container(
                child: (_item.imageUrl.isNotEmpty)
                    ? CachedNetworkImage(
                  imageUrl:
                  _item.imageUrl,
                  width: width,
                  height: width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(
                        width: width,
                        height: width,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) =>
                      Container(
                        width: width,
                        height: width,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                )
                    : Container(
                  width: width,
                  height: width,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

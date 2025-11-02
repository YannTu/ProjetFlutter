import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageConsultation extends StatelessWidget {
  const ImageConsultation({
    super.key,
    required String imagePath,
  }) : _imagePath = imagePath;

  final String _imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var size = MediaQuery.of(context).size;
              print(_imagePath);

              return (_imagePath.isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl: _imagePath,
                      width: size.width,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: size.width,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: size.width,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: Icon(Icons.image_not_supported, size: 100),
                      ),
                    )
                  : Container(
                      width: size.width,
                      height: 200,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Icon(Icons.image_not_supported, size: 100),
                    );
            },
          ),
        ),
      ],
    );
  }
}

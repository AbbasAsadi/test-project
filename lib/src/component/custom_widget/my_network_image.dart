import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage(this.imageURL,{
    Key? key,
    // required this.imageURL,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.customErrorWidget,
  }) : super(key: key);
  final String? imageURL;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? customErrorWidget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return (imageURL != null && imageURL!.isNotEmpty)
        ? CachedNetworkImage(
            imageUrl: imageURL!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
            placeholder: (context, url) => SizedBox(
              width: width,
              height: height,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.white,
                // direction: ShimmerDirection.rtl,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            errorWidget: (context, url, error) =>
                (customErrorWidget ?? errorWidget()),
          )
        : (customErrorWidget ?? errorWidget());
  }

  Container errorWidget() {
    return Container(
      height: height ?? 100,
      width: width,
      color: Colors.grey[100],
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({super.key, required this.imagePath,
    this.width, this.height, this.color, this.onTap, this.fit});
  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    if(imagePath.contains('https://') || imagePath.contains('http://') ){
      return CachedNetworkImage(
        imageUrl: imagePath,
        imageBuilder: (context,image){
          return InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundImage: image,),
          );
        },
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }

    if(imagePath.endsWith('svg')){
      return InkWell(
        onTap: onTap,
        child: ClipRRect(
          //borderRadius: BorderRadius.circular(15),
          child: SvgPicture.asset(
            imagePath,
            width: width,
            height: height,
            //fit: fit??BoxFit.cover,
            color: color,),
        ),
      );
    }
    if(imagePath.endsWith('png') || imagePath.endsWith('jpg') ||
        imagePath.endsWith('jpeg') || imagePath.endsWith('gif')){
      return InkWell(
        onTap:onTap,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          color: color,
        ),
      );
    }
    return const SizedBox();
  }
}

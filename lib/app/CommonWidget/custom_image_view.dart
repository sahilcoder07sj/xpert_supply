// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tbd_flutter/app/data/app_colors.dart';



class CustomImageView extends StatelessWidget {
  ///[imagePath] is required parameter for showing image
  String? imagePath;

  double? height;
  double? width;
  Color? color;
  BoxFit? fit;
  final String? placeHolder;
  Alignment? alignment;
  VoidCallback? onTap;
  EdgeInsetsGeometry? margin;
  BorderRadius? radius;
  BoxBorder? border;
  final BoxShape? shap;
  Color? backgroundColor;
  Color? dynamicBackgroundColor;

  ///a [CustomImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  CustomImageView({
    this.imagePath,
    this.height,
    this.backgroundColor,
    this.width,
    this.color,
    this.fit,
    this.shap = BoxShape.rectangle,
    this.dynamicBackgroundColor,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  ///build the image with border radius
  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter:
                  ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
            ),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: imagePath!,
            imageBuilder: (context, imageProvider) {
              return Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: dynamicBackgroundColor ?? AppColors.white,
                  shape: shap ?? BoxShape.rectangle,
                  image: DecorationImage(image: imageProvider, fit: fit ??  BoxFit.cover),
                ),
              );
            },
            placeholder: (context, url) {
              return Container(
                height: 30,
                width: 30,
                color: dynamicBackgroundColor ?? AppColors.white,
                child: LinearProgressIndicator(
                  color: Colors.grey.shade200,
                  backgroundColor: Colors.grey.shade100,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: dynamicBackgroundColor ?? AppColors.white,
                  shape: shap ?? BoxShape.rectangle,
                ),
                // child: shap == BoxShape.circle
                //     ? ClipOval(
                //         child: Image.asset(
                //           Assets.images.defaultProfile.path,
                //           fit: fit ?? BoxFit.cover,
                //           color: color,
                //         ),
                //       )
                //     : Image.asset(
                //         Assets.images.defaultProfile.path,
                //         fit: fit ?? BoxFit.cover,
                //         color: color,
                //       ),
              );
            },
          );
        case ImageType.png:
        case ImageType.asset:
        default:
          return Image.asset(
            placeHolder!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return const SizedBox();
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else if (startsWith('assets/')) {
      return ImageType.asset;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, asset, network, file, unknown }

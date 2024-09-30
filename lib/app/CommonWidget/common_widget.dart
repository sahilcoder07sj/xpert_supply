import '../data/all.dart';

class CommonWidget{

  static noDataFoundWidget(){
    return Center(
      child: AppText(
        "No data found",
        fontSize: 16.0,
      ),
    );
  }

  static roundIconWidget({required String imageName}){
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 6.50,
            offset: Offset(0, 10),
            spreadRadius: 0,
          )
        ],
      ),
      child: SvgPicture.asset(imageName),
    );
  }

  static circularIconWidget({Color? backgroundColor,required String icon, double? radius, void Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 20.0,
        backgroundColor: backgroundColor ?? AppColors.iconBG,
        child: SvgPicture.asset(icon),
      ),
    );
  }


  static commonShadowWidget({double? radius, BorderSide? borderSide}){
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: borderSide ?? BorderSide(width: 1, color: Color(0xFFF2F2F6)),
        borderRadius: BorderRadius.circular(radius ?? 12),
      ),
      shadows: [
        BoxShadow(
          color: Color(0xFFEFF0F3),
          blurRadius: 20.40,
          offset: Offset(0, 7),
          spreadRadius: 0,
        )
      ],
    );
  }

}


class CommonNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CommonNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: height,
          width: width,
          child: placeholder ??
              Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                  strokeWidth: 1.0,
                ),
              ),
        );
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: errorWidget ??
              Center(
                child: Icon(Icons.error),
              ),
        );
      },
    );
  }
}

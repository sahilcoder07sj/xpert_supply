import '../data/all.dart';

class CommonWidget{

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

  static circularIconWidget({Color? backgroundColor,required String icon, double? radius}){
    return CircleAvatar(
      radius: radius ?? 22.0,
      backgroundColor: backgroundColor ?? AppColors.iconBG,
      child: SvgPicture.asset(icon),
    );
  }


  static commonShadowWidget({double? radius}){
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFF2F2F6)),
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
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

  static circularIconWidget({required String icon, double? radius}){
    return CircleAvatar(
      radius: radius ?? 22.0,
      backgroundColor: AppColors.iconBG,
      child: SvgPicture.asset(icon),
    );
  }

}
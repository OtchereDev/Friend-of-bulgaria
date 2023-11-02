part of AppConfig;

class AppStyle {
  static BoxShadow shaddow1 = BoxShadow(
      blurRadius: 12,
      offset: Offset(0, 4),
      color: AppColors.BLACK.withOpacity(0.08));

      static  BoxDecoration decoration1 = BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    AppStyle.shaddow1
                  ]);
}

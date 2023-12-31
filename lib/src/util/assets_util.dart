class AssetsUtil {
  static String loadSvgBackground(String svgName) {
    return 'packages/flutter_screen/lib/svg/background/$svgName.svg';
  }

  static String loadScreenViewSvgBackground(String svgName) {
    return 'packages/flutter_screen/lib/svg/background/$svgName.svg';
  }

  static String loadScreenViewSvgAlert(String svgName) {
    return 'packages/flutter_screen/lib/svg/alert/$svgName.svg';
  }

  static String loadSvgAlert(String svgName) {
    return 'packages/flutter_screen/lib/svg/alert/$svgName.svg';
  }
  static String loadAsset(String svgName) {
    return '$svgName';
  }
}

class AssetsUtil {
  static String loadSvgBackground(String svgName) {
    return 'assets/svg/background/$svgName.svg';
  }

  static String loadScreenViewSvgBackground(String svgName) {
    return 'submodules/flutter_screen/assets/svg/background/$svgName.svg';
  }

  static String loadScreenViewSvgAlert(String svgName) {
    return 'submodules/flutter_screen/assets/svg/alert/$svgName.svg';
  }

  static String loadSvgAlert(String svgName) {
    return 'assets/svg/alert/$svgName.svg';
  }
}

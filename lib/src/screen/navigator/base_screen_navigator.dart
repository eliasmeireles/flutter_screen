import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_screen/flutter_screen.dart';

const initPath = "/";
const errorAlertPath = "/error";
const successfulPath = "/success";
const splashPath = "/splash";
const loginPath = "/login";
const logoutPath = "/logout";

abstract class BaseScreenNavigator {
  final Intl intl = GetIt.instance.get();
  late BuildContext context;
  final GlobalKey<NavigatorState> pageNavigatorKey =
      GlobalKey<NavigatorState>();

  late String initialPage;
  late String loadingPage;
  late String currentPage;

  BaseScreenNavigator({
    this.initialPage = initPath,
    this.loadingPage = DefaultLoadingPage.route,
  }) {
    currentPage = initialPage;
  }

  void home() =>
      saveNavigator((navigator) => navigator.pushReplacementNamed(initialPage));

  void pushReplacementNamed(String path) =>
      saveNavigator((navigator) => navigator.pushReplacementNamed(path));

  void push(String path) =>
      saveNavigator((navigator) => navigator.pushNamed(path));

  void showSuccessful() => saveNavigator(
      (navigator) => navigator.pushReplacementNamed(successfulPath));

  void errorAlert<ApplicationResponse>(ApplicationResponse response) =>
      saveNavigator((navigator) => navigator.pushReplacementNamed(
            errorAlertPath,
            arguments: response,
          ));

  bool canPop() => pageNavigatorKey.currentState?.canPop() ?? false;

  void loading() {
    currentPage = loadingPage;
    saveNavigator((navigator) => navigator.pushNamed(loadingPage));
  }

  Widget alertBuild({
    String? message,
    String? alertIcon,
    IconData? iconButton,
    required Function onTap,
  }) {
    return DefaultAlertPage(
      message: message ?? intl.couldNotCompleteTheRequest,
      asset: alertIcon,
      iconButton: iconButton ?? FontAwesomeIcons.rotate,
      onTap: onTap.call,
    );
  }

  bool canPopPage() {
    if (isErrorState() || isLogoutPage() || isLoginPage() || isSplashPage()) {
      if (canPop()) {
        currentPage = initialPage;
        pageNavigatorKey.currentState?.pop();
      }
      return false;
    }
    return isSuccessfulState();
  }

  bool isHomeState() => currentPage == initialPage;

  bool isSuccessfulState() => currentPage == successfulPath;

  bool isErrorState() => currentPage == errorAlertPath;

  Widget errorAlertBuilder({
    required RouteSettings settings,
    required BaseController controller,
    Function? onTap,
  }) {
    final response = settings.arguments as ApplicationResponse?;
    final resource = AlertResource(
      message: alertResourceMessage(response),
      svgIcon: alertResourceSvgIcon(response),
    );
    return alertBuild(
      onTap: onTap ?? canPopPage,
      message: resource.message,
      alertIcon: resource.svgIcon,
    );
  }

  Widget logoutAlertBuilder({
    required BaseController controller,
  }) {
    final resource = AlertResource(
      message: intl.confirmationLogoutMessage,
      svgIcon: AssetsUtil.loadScreenViewSvgAlert("undraw_feeling_blue_4b7q"),
    );
    return alertBuild(
      onTap: controller.doLogout,
      iconButton: Icons.exit_to_app,
      message: resource.message,
      alertIcon: resource.svgIcon,
    );
  }

  String alertResourceMessage<T extends ApplicationResponse>(T? response) {
    return response?.errorResource(intl).message ??
        intl.couldNotCompleteTheRequest;
  }

  String alertResourceSvgIcon<T extends ApplicationResponse>(
      ApplicationResponse? response) {
    return AssetsUtil.loadScreenViewSvgAlert(
      response?.errorResource(intl).svgIcon ?? "undraw_server_down_s4lk_error",
    );
  }

  Widget navigate(RouteSettings settings, BaseController controller) {
    switch (settings.name) {
      case logoutPath:
        currentPage = logoutPath;
        return logoutAlertBuilder(controller: controller);
      case DefaultLoadingPage.route:
        currentPage = DefaultLoadingPage.route;
        return const DefaultLoadingPage();
      case errorAlertPath:
        currentPage = errorAlertPath;
        return errorAlertBuilder(
          settings: settings,
          controller: controller,
        );
      default:
        return nextNavigate(settings, controller);
    }
  }

  Widget nextNavigate(RouteSettings settings, BaseController controller);

  void withContext(BuildContext context) => this.context = context;

  void saveNavigator(Function(NavigatorState) run) {
    if (pageNavigatorKey.currentContext != null) {
      run.call(Navigator.of(pageNavigatorKey.currentContext!));
    }
  }

  void saveGlobalNavigator(Function(NavigatorState) run) {
    if (ScreenViewRouter.globalNavigatorKey.currentContext != null) {
      run.call(
        Navigator.of(
          ScreenViewRouter.globalNavigatorKey.currentContext!,
        ),
      );
    }
  }

  bool isLoginPage() => currentPage != loginPath;

  bool isSplashPage() => currentPage != splashPath;

  bool isLogoutPage() => currentPage == logoutPath;

  void screenPop() => saveGlobalNavigator((navigator) => navigator.pop());
}

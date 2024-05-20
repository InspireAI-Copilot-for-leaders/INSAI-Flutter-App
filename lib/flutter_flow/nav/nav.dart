import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: RootPageContext.wrap(
          appStateNotifier.loggedIn ? const DashboardWidget() : const LandingPageWidget(),
          errorRoute: state.uri.toString(),
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? const DashboardWidget() : const LandingPageWidget(),
          ),
          routes: [
            FFRoute(
              name: 'LandingPage',
              path: 'landingPage',
              builder: (context, params) => const LandingPageWidget(),
            ),
            FFRoute(
              name: 'auth_signupOrLogin',
              path: 'auth_signupOrLogin',
              builder: (context, params) => const AuthSignupOrLoginWidget(),
            ),
            FFRoute(
              name: 'linkedinConnect',
              path: 'linkedinConnect',
              requireAuth: true,
              builder: (context, params) => LinkedinConnectWidget(
                connectSuccess: params.getParam(
                  'connectSuccess',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'phone_number_verify',
              path: 'phoneNumberVerify',
              builder: (context, params) => const PhoneNumberVerifyWidget(),
            ),
            FFRoute(
              name: 'forgot_pass',
              path: 'forgot_pass',
              builder: (context, params) => const ForgotPassWidget(),
            ),
            FFRoute(
              name: 'linkedinAuth',
              path: 'linkedinAuth/:code',
              requireAuth: true,
              builder: (context, params) => LinkedinAuthWidget(
                code: params.getParam(
                  'code',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'brandVoice',
              path: 'brandVoice',
              requireAuth: true,
              builder: (context, params) => const BrandVoiceWidget(),
            ),
            FFRoute(
              name: 'discoverPage',
              path: 'discoverPage',
              requireAuth: true,
              builder: (context, params) => const DiscoverPageWidget(),
            ),
            FFRoute(
              name: 'articleDetails',
              path: 'articleDetails',
              requireAuth: true,
              asyncParams: {
                'articleDocument':
                    getDoc(['article'], ArticleRecord.fromSnapshot),
              },
              builder: (context, params) => ArticleDetailsWidget(
                articleRef: params.getParam(
                  'articleRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['article'],
                ),
                articleTitle: params.getParam(
                  'articleTitle',
                  ParamType.String,
                ),
                articleContent: params.getParam(
                  'articleContent',
                  ParamType.String,
                ),
                articleDomain: params.getParam(
                  'articleDomain',
                  ParamType.String,
                ),
                articleDocument: params.getParam(
                  'articleDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'createWithInspireAI',
              path: 'createWithInspireAI',
              requireAuth: true,
              builder: (context, params) => CreateWithInspireAIWidget(
                contextForContent: params.getParam(
                  'contextForContent',
                  ParamType.String,
                ),
                topicForContent: params.getParam(
                  'topicForContent',
                  ParamType.String,
                ),
                contentType: params.getParam(
                  'contentType',
                  ParamType.String,
                ),
                broadDomain: params.getParam(
                  'broadDomain',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'viewOrEditPost',
              path: 'viewOrEditPost',
              requireAuth: true,
              builder: (context, params) => ViewOrEditPostWidget(
                postText: params.getParam(
                  'postText',
                  ParamType.String,
                ),
                postRef: params.getParam(
                  'postRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users', 'created_posts'],
                ),
                postTitle: params.getParam(
                  'postTitle',
                  ParamType.String,
                ),
                oneLinerIndex: params.getParam(
                  'oneLinerIndex',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'otherLeaders',
              path: 'otherLeaders',
              requireAuth: true,
              builder: (context, params) => const OtherLeadersWidget(),
            ),
            FFRoute(
              name: 'ProfileDetails',
              path: 'profileDetails',
              requireAuth: true,
              builder: (context, params) => const ProfileDetailsWidget(),
            ),
            FFRoute(
              name: 'postDetailed',
              path: 'postDetailed',
              requireAuth: true,
              builder: (context, params) => PostDetailedWidget(
                postRef: params.getParam(
                  'postRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users', 'postedOnLinkedin'],
                ),
                postText: params.getParam(
                  'postText',
                  ParamType.String,
                ),
                postURN: params.getParam(
                  'postURN',
                  ParamType.String,
                ),
                postedOn: params.getParam(
                  'postedOn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'dashboard',
              path: 'dashboard',
              requireAuth: true,
              builder: (context, params) => const DashboardWidget(),
            ),
            FFRoute(
              name: 'storiesPage',
              path: 'storiesPage',
              builder: (context, params) => StoriesPageWidget(
                domain: params.getParam(
                  'domain',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'support',
              path: 'support',
              builder: (context, params) => const SupportWidget(),
            ),
            FFRoute(
              name: 'postReview',
              path: 'postReview',
              builder: (context, params) => PostReviewWidget(
                postRef: params.getParam(
                  'postRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users', 'created_posts'],
                ),
              ),
            ),
            FFRoute(
              name: 'viewOrEditOneLiner',
              path: 'viewOrEditOneLiner',
              requireAuth: true,
              builder: (context, params) => ViewOrEditOneLinerWidget(
                postText: params.getParam<String>(
                  'postText',
                  ParamType.String,
                  isList: true,
                ),
                postRef: params.getParam(
                  'postRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users', 'created_posts'],
                ),
                postTitle: params.getParam(
                  'postTitle',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'editBrandVoice',
              path: 'editBrandVoice',
              requireAuth: true,
              builder: (context, params) => const EditBrandVoiceWidget(),
            ),
            FFRoute(
              name: 'allPostsOverview',
              path: 'allPostsOverview',
              requireAuth: true,
              builder: (context, params) => const AllPostsOverviewWidget(),
            ),
            FFRoute(
              name: 'campaigns',
              path: 'campaigns',
              requireAuth: true,
              builder: (context, params) => const CampaignsWidget(),
            ),
            FFRoute(
              name: 'viewScheduledPost',
              path: 'viewScheduledPost',
              requireAuth: true,
              asyncParams: {
                'postDocument': getDoc(
                    ['scheduled_posts'], ScheduledPostsRecord.fromSnapshot),
              },
              builder: (context, params) => ViewScheduledPostWidget(
                postDocument: params.getParam(
                  'postDocument',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'payWall',
              path: 'payWall',
              builder: (context, params) => const PayWallWidget(),
            ),
            FFRoute(
              name: 'accessRequested',
              path: 'accessRequested',
              builder: (context, params) => const AccessRequestedWidget(),
            ),
            FFRoute(
              name: 'expertiseAreaEdit',
              path: 'expertiseAreaEdit',
              requireAuth: true,
              builder: (context, params) => const ExpertiseAreaEditWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/landingPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 100.0,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

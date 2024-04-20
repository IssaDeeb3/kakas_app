/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/alert.json
  LottieGenImage get alert =>
      const LottieGenImage('assets/animation/alert.json');

  /// File path: assets/animation/base_loading.json
  LottieGenImage get baseLoading =>
      const LottieGenImage('assets/animation/base_loading.json');

  /// File path: assets/animation/delete.json
  LottieGenImage get delete =>
      const LottieGenImage('assets/animation/delete.json');

  /// File path: assets/animation/edit.json
  LottieGenImage get edit => const LottieGenImage('assets/animation/edit.json');

  /// File path: assets/animation/empty.json
  LottieGenImage get empty =>
      const LottieGenImage('assets/animation/empty.json');

  /// File path: assets/animation/login_background.json
  LottieGenImage get loginBackground =>
      const LottieGenImage('assets/animation/login_background.json');

  /// List of all assets
  List<LottieGenImage> get values =>
      [alert, baseLoading, delete, edit, empty, loginBackground];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/aboutUs.png
  AssetGenImage get aboutUs => const AssetGenImage('assets/icons/aboutUs.png');

  /// File path: assets/icons/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/icons/cart.png');

  /// File path: assets/icons/cartNew.png
  AssetGenImage get cartNew => const AssetGenImage('assets/icons/cartNew.png');

  /// File path: assets/icons/contact.png
  AssetGenImage get contact => const AssetGenImage('assets/icons/contact.png');

  /// File path: assets/icons/history.png
  AssetGenImage get history => const AssetGenImage('assets/icons/history.png');

  /// File path: assets/icons/historyNew.png
  AssetGenImage get historyNew =>
      const AssetGenImage('assets/icons/historyNew.png');

  /// File path: assets/icons/historyy.png
  AssetGenImage get historyy =>
      const AssetGenImage('assets/icons/historyy.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/homeNew.png
  AssetGenImage get homeNew => const AssetGenImage('assets/icons/homeNew.png');

  /// File path: assets/icons/img.png
  AssetGenImage get img => const AssetGenImage('assets/icons/img.png');

  /// File path: assets/icons/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/icons/logout.png');

  /// File path: assets/icons/no-image.png
  AssetGenImage get noImage => const AssetGenImage('assets/icons/no-image.png');

  /// File path: assets/icons/order.png
  AssetGenImage get order => const AssetGenImage('assets/icons/order.png');

  /// File path: assets/icons/pick_image.png
  AssetGenImage get pickImage =>
      const AssetGenImage('assets/icons/pick_image.png');

  /// File path: assets/icons/product.png
  AssetGenImage get product => const AssetGenImage('assets/icons/product.png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// File path: assets/icons/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/icons/settings.png');

  /// File path: assets/icons/terms.png
  AssetGenImage get terms => const AssetGenImage('assets/icons/terms.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        aboutUs,
        cart,
        cartNew,
        contact,
        history,
        historyNew,
        historyy,
        home,
        homeNew,
        img,
        logout,
        noImage,
        order,
        pickImage,
        product,
        search,
        settings,
        terms
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/space.jpg
  AssetGenImage get space => const AssetGenImage('assets/images/space.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [logo, space];
}

class Assets {
  Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

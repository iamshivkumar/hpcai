// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_school/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesignIntro {
  final String title;
  final String description;
  final String image;
  DesignIntro({
    required this.title,
    required this.description,
    required this.image,
  });
}

class IntroView extends StatefulWidget {
  IntroView({
    super.key,
  });

  List<DesignIntro> intros = [];

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationController.repeat(reverse: true);

    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        final nextPage = _currentPage + 1;
        if (nextPage < widget.intros.length) {
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
          );
        }
        _animationController.forward();
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final introPages = List.generate(
      widget.intros.length,
      (i) {
        final e = widget.intros[i];
        return IntroPage(
          image: e.image,
          title: e.title ?? '',
          description: e.description,
        );
      },
    );

    Widget indicator(bool isActive) {
      return Container(
        height: 8.0,
        width: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: isActive
              ? context.scheme.primaryContainer
              : context.scheme.surfaceVariant,
          shape: BoxShape.circle,
        ),
      );
    }

    List<Widget> buildPageIndicator() {
      List<Widget> indicators = [];
      for (int i = 0; i < introPages.length; i++) {
        indicators.add(
          i == _currentPage ? indicator(true) : indicator(false),
        );
      }
      return indicators;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.intros.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget? child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                  }
                  return Align(
                    alignment: Alignment.center,
                    child: Transform.scale(
                      // scale: 1,
                      scale: Curves.easeOut.transform(value),
                      child: child,
                    ),
                  );
                },
                child: introPages[index],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...buildPageIndicator(),
            ],
          ),
        ),
      ],
    );
  }
}

class IntroPage extends ConsumerWidget {
  final String? image;
  final String? title;
  final String? description;

  const IntroPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: image != null
                ? image!.contains('.svg')
                    ? image!.startsWith('assets/')
                        ? SvgPicture.asset(image!)
                        : SvgPicture.network(ref.imgUrl(image!))
                    : image!.startsWith('assets/')
                        ? Image.asset(image!)
                        : CachedNetworkImage(imageUrl: ref.imgUrl(image!))
                : const SizedBox.shrink(),
          ),
          if (title != null) ...[
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title!,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: context.scheme.primary),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          if (description != null) ...[
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description!,
                style: TextStyle(color: context.scheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/no_data_widget.dart';
import 'package:shopyneer/features/home/models/advertising_response_model.dart';
import 'package:size_config/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/theme/colors.dart';

class AdsSlider extends StatefulWidget {
  AdsSlider({super.key, required this.imageUrls});
  final List<Advertise> imageUrls;
  final List<String> fakeUrls = [
    "https://shopyneer.com/cdn/shop/files/55541425a1dab62315d6b31edc53091a.jpg?v=1731094370&width=2000",
    "https://shopyneer.com/cdn/shop/files/copy_0b3c20ac-e028-474c-b100-d572d5f23633.jpg?v=1730359256&width=2000",
    "https://shopyneer.com/cdn/shop/files/copy_29c9774f-e95f-4466-87bb-d850753affc9.jpg?v=1730359279&width=2000",
    "https://shopyneer.com/cdn/shop/files/6.jpg?v=1730189751&width=2000",
  ];

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  final PageController _pageController =
      PageController(); // Controller for PageView
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Automatically change the page every 1 second
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < widget.imageUrls.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: widget.imageUrls.isEmpty
          ? const NoDataWidget(
              title: "لا توجد إعلانات حاليا",
            )
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: widget.imageUrls.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: "${widget.fakeUrls[index]}",
                            placeholder: (context, url) => const Center(
                              child: LoadingWidget(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.imageUrls.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 8.0,
                    dotHeight: 8.0, // Set the width of the active dot
                    expansionFactor: 2,
                    dotColor: greyF4,
                    activeDotColor: primary, // Customize the active dot color
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 3000),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
    );
  }
}

/// -----------------------------------------------------------
///

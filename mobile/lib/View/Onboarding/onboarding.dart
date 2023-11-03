import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton/AppTheme/app_config.dart';
import 'package:hackaton/Core/Helpers/navigation_helper.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:hackaton/Utils/utils.dart';
import 'package:hackaton/View/Auth/get_started.dart';
import 'package:image_fade/image_fade.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});
  final selectedIndex = ValueNotifier(0);
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (context, page, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    height: 4,
                    width: page == 0
                        ? (Utils.screenWidth(context) / 3)
                        : page == 1
                            ? (Utils.screenWidth(context) / 1.6)
                            : Utils.screenWidth(context) / 1,
                    color: AppColors.PRIMARYCOLOR,
                  ),
                  Expanded(
                      flex: 6,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return _PageLayout(
                            description: data[index]['desc'],
                            image: data[index]['image'],
                            title: data[index]['title'],
                          );
                        },
                        onPageChanged: (value) {
                          selectedIndex.value = value;
                        },
                      )),
                  if (page == 0)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButton(
                        name: 'Keep going',
                        onTap: () {
                          pageController.animateToPage(page + 1,
                              duration: Duration(microseconds: 1000),
                              curve: Curves.easeOut);
                        },
                      ),
                    ),
                  if (page == 1)
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: CustomOutlineButton(
                                  name: 'Go back',
                                  onTap: () {
                                    pageController.previousPage(
                                        duration:
                                            const Duration(microseconds: 1000),
                                        curve: Curves.easeOut);
                                  },
                                ),
                              ),
                            ),
                            AppSpaces.width8,
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: CustomButton(
                                  name: "Keep going",
                                  onTap: () {
                                    pageController.animateToPage(page + 1,
                                        duration: Duration(microseconds: 1000),
                                        curve: Curves.easeOut);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                  if (page == 2)
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: CustomOutlineButton(
                                  name: 'Go back',
                                  onTap: () {
                                    pageController.previousPage(
                                        duration:
                                            const Duration(microseconds: 1000),
                                        curve: Curves.easeOut);
                                  },
                                ),
                              ),
                            ),
                            AppSpaces.width8,
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: CustomButton(
                                  name: "Get Started",
                                  onTap: () {
                                    SharedPrefsManager _s =
                                        SharedPrefsManager();
                                    _s.setGetStarted(true);
                                    AppNavigationHelper.navigateToWidget(
                                        context, GetStarted());
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                  AppSpaces.height16
                ],
              );
            }),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String? name;
  final bool rightIcon;
  final VoidCallback? onTap;
  const CustomOutlineButton({
    super.key,
    this.onTap,
    this.name,
    this.rightIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: AppColors.PRIMARYCOLOR,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            side: const BorderSide(
                width: 1, color: AppColors.PRIMARYCOLOR) //<-- SEE HERE
            ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            rightIcon
                ? SizedBox.shrink()
                : Icon(
                    Icons.arrow_back,
                    size: 15,
                    color: AppColors.PRIMARYCOLOR,
                  ),
            AppSpaces.width8,
            Text(
              name!,
              style: TextStyle(fontSize: 15),
            ),
            AppSpaces.width8,
            !rightIcon
                ? SizedBox.shrink()
                : Icon(
                    Icons.arrow_forward,
                    size: 15,
                    color: AppColors.PRIMARYCOLOR,
                  ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final String? name;

  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    this.onTap,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        color: AppColors.PRIMARYCOLOR,
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name ?? ""),
            AppSpaces.width8,
            Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.WHITE,
              size: 15,
            )
          ],
        ));
  }
}

class _PageLayout extends StatelessWidget {
  final String image, title, description;

  const _PageLayout(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageViewContainer(image: image),
        AppSpaces.height16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              AppSpaces.height8,
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ImageViewContainerRemote extends StatelessWidget {
  const ImageViewContainerRemote({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ImageFade(
      image: NetworkImage(image),
      width: double.infinity,
      height: Utils.screenHeight(context) / 4.5,
      duration: const Duration(milliseconds: 900),
      syncDuration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      fit: BoxFit.cover,
      placeholder: Container(
        color: const Color(0xFFCFCDCA),
        alignment: Alignment.center,
        child: const Icon(Icons.photo, color: Colors.white30, size: 128.0),
      ),
      loadingBuilder: (context, progress, chunkEvent) =>
          Center(child: CircularProgressIndicator(value: progress)),
      errorBuilder: (context, error) => Container(
        color: const Color(0xFF6F6D6A),
        alignment: Alignment.center,
        child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
      ),
    );
  }
}

class ImageViewContainer extends StatelessWidget {
  const ImageViewContainer({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ImageFade(
      image: AssetImage(image),
      duration: const Duration(milliseconds: 900),
      syncDuration: const Duration(milliseconds: 150),
      alignment: Alignment.center,
      fit: BoxFit.cover,
      placeholder: Container(
        color: const Color(0xFFCFCDCA),
        alignment: Alignment.center,
        child: const Icon(Icons.photo, color: Colors.white30, size: 128.0),
      ),
      loadingBuilder: (context, progress, chunkEvent) =>
          Center(child: CircularProgressIndicator(value: progress)),
      errorBuilder: (context, error) => Container(
        color: const Color(0xFF6F6D6A),
        alignment: Alignment.center,
        child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
      ),
    );
  }
}

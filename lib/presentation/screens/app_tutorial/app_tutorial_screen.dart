import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title:
          'Ullamnostrud officia id id adipisicing est sint laborum incididunt fugiat ex qui quis magna. Aliqua aute duis nulla quis aliqua aliquip nisi Lorem ut proident exercitation. Officia aliquip dolor irure veniam. Tempor esse in eiusmod tempor dolore culpa amet.',
      caption: 'caption',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title:
          'Voluptate in iim amet sit duis sint aliquip dolore reprehenderit sunt sint occaecat aute eu amet aute. Nulla fugiat aute culpa Lorem officia incididunt nostrud ex dolor.',
      caption: 'caption',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title:
          'Dolorostrud labore aliquip incididunt aute ex velit et ad cillum quis irure.',
      caption: 'caption',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () => context.pop(), child: Text('Salir'))),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 400),
                    child: FilledButton(
                        onPressed: () => context.pop(), child: Text('Comenzar')),
                  ))
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final tittleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: tittleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';
import 'package:group5_tutorial/review_page.dart';
import 'package:group5_tutorial/test_page.dart';
import 'package:video_player/video_player.dart';

import 'commot/core/navigator.dart';
import 'commot/shared/app_button.dart';
import 'commot/shared/custom_image_widget.dart';
import 'commot/utils/colors.dart';
import 'data/model/course.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key, required this.course});
  static const routeName = '/lessonPage';
  final Course course;
  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late FlickManager flickManager;

  setParames(String url) async {
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(url),
    ));
  }

  @override
  void initState() {
    super.initState();
    setParames(widget.course.lesson.first.video);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              10.height,
              Container(
                height: 250,
                width: double.infinity,
                color: AppColor.white,
                child: FlickVideoPlayer(flickManager: flickManager),
              ),
              16.height,
              Text(
                widget.course.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              9.height,
              const Text(
                "March 17, 2024",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              12.height,
              Row(
                children: [
                  CustomImageWidget(
                    imagePath: widget.course.tutor.image,
                    width: 32,
                    height: 32,
                  ),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.course.tutor.name.replaceRange(
                            widget.course.tutor.name.length > 23
                                ? 24
                                : widget.course.tutor.name.length,
                            widget.course.tutor.name.length,
                            widget.course.tutor.name.length > 23 ? ".." : ''),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      const Text(
                        'Educator',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "3m",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColor.primary,
                        ),
                      ),
                      10.width,
                      Text(
                        '${widget.course.lesson.length} Lessons',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              33.height,
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                        text: "Take test",
                        color: AppColor.white,
                        onTap: () {
                          flickManager.flickVideoManager?.videoPlayerController
                              ?.pause();
                          pushToNextScreen(
                              child: TestPage(
                                test: widget.course.test,
                              ),
                              name: TestPage.routeName);
                        }),
                  ),
                  80.width,
                  Expanded(
                    child: AppButton(
                        text: "Reviews",
                        addBorder: true,
                        bg: AppColor.white,
                        onTap: () {
                          flickManager.flickVideoManager?.videoPlayerController
                              ?.pause();
                          pushToNextScreen(
                              child: ReviewPage(
                                review: widget.course.review,
                                course: widget.course,
                              ),
                              name: ReviewPage.routeName);
                        }),
                  ),
                ],
              ),
              33.height,
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final lesson = widget.course.lesson[index];
                        return InkWell(
                          onTap: () {
                            print(lesson.video);
                            flickManager.handleChangeVideo(
                                VideoPlayerController.networkUrl(
                                    Uri.parse(lesson.video)));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 9),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_circle_outline_outlined,
                                  color: AppColor.grey72,
                                ),
                                18.width,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        lesson.title.replaceRange(
                                            lesson.title.length > 23
                                                ? 24
                                                : lesson.title.length,
                                            lesson.title.length,
                                            lesson.title.length > 23
                                                ? ".."
                                                : ''),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        lesson.time,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.check_circle_outline,
                                  color: AppColor.grey72,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 15.height,
                      itemCount: widget.course.lesson.length))
            ],
          ),
        ),
      ),
    );
  }
}

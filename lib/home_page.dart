
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';
import 'package:group5_tutorial/data/model/course.dart';
import 'package:group5_tutorial/providers/course_provider.dart';
import 'package:group5_tutorial/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'commot/core/navigator.dart';
import 'commot/shared/app_textfield.dart';
import 'commot/shared/custom_image_widget.dart';
import 'commot/utils/colors.dart';
import 'lesson_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int option = 1;
  late Course course;
  @override
  void initState() {
    CourseProvider().getCourse().then((value) => course = value!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              Consumer<UserProvider>(builder: (context, model, _) {
                return Text(
                  '${model.user?.firstName ?? '-'} ${model.user?.surname ?? '-'}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                );
              }),
              25.height,
              const AuthTextField(
                hintText: 'Search your course',
                prefixIcon: Icon(Icons.search_sharp),
              ),
              23.height,
              const Text(
                'Explore Courses',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              13.height,
              Row(
                children: [
                  Expanded(
                      child: SelectionCard(
                    text: 'All Topics',
                    onTap: () {
                      setState(() {
                        option = 1;
                      });
                    },
                    isSelected: option == 1,
                    path: 'assets/block.svg',
                  )),
                  20.width,
                  Expanded(
                      child: SelectionCard(
                    text: 'Popular',
                    onTap: () {
                      setState(() {
                        option = 2;
                      });
                    },
                    isSelected: option == 2,
                    path: 'assets/fire.png',
                  )),
                ],
              ),
              21.height,
              Row(
                children: [
                  Expanded(
                      child: SelectionCard(
                    text: 'Newest',
                    onTap: () {
                      setState(() {
                        option = 3;
                      });
                    },
                    isSelected: option == 3,
                    path: 'assets/star.png',
                  )),
                  20.width,
                  Expanded(
                      child: SelectionCard(
                    text: 'Advance',
                    onTap: () {
                      setState(() {
                        option = 4;
                      });
                    },
                    isSelected: option == 4,
                    path: 'assets/click.svg',
                  )),
                ],
              ),
              35.height,
              Consumer<CourseProvider>(
                builder: (context, provider, child) {
                  return SizedBox(
                    // height: 300,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      primary: false,
                      itemBuilder: (context, index) {
                        return CourseCard(
                            courseTitle: provider.course?.name ?? '',
                            name: provider.course?.tutor.name ?? '',
                            time: '3m',
                            lessons: '${provider.course?.lesson.length}',
                            onTap: () {
                              pushToNextScreen(
                                  child: LessonPage(
                                    course: provider.course!,
                                  ),
                                  name: LessonPage.routeName);
                            },
                            thumbnail: 'assets/thumbnail.png',
                            tutorImage: provider.course?.tutor.image ?? '');
                      },
                      separatorBuilder: (context, index) => 12.width,
                      itemCount: 1,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  const SelectionCard(
      {super.key,
      required this.text,
      required this.onTap,
      required this.isSelected,
      required this.path});
  final String text;
  final String path;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 46,
              width: 46,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: isSelected
                    ? AppColor.white
                    : AppColor.primary.withOpacity(0.09),
              ),
              child: CustomImageWidget(imagePath: path),
            ),
            20.width,
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: isSelected ? AppColor.white : AppColor.greyText),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key,
      required this.courseTitle,
      required this.name,
      required this.time,
      required this.lessons,
      required this.onTap,
      required this.thumbnail,
      required this.tutorImage});
  final String courseTitle;
  final String thumbnail;
  final String tutorImage;
  final String name;
  final String time;
  final String lessons;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 400,
        // width: 226,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageWidget(imagePath: thumbnail),
            9.height,
            Text(
              courseTitle.replaceRange(
                  courseTitle.length > 33 ? 34 : courseTitle.length,
                  courseTitle.length,
                  courseTitle.length > 33 ? ".." : ''),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            5.width,
            Expanded(
              child: Row(
                children: [
                  CustomImageWidget(
                    imagePath: tutorImage,
                    width: 32,
                    height: 32,
                  ),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name.replaceRange(name.length > 23 ? 24 : name.length,
                            name.length, name.length > 23 ? ".." : ''),
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
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColor.primary,
                  ),
                ),
                10.width,
                Text(
                  '$lessons Lessons',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

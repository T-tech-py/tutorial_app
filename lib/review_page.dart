
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';
import 'package:group5_tutorial/providers/course_provider.dart';
import 'package:group5_tutorial/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'commot/core/navigator.dart';
import 'commot/shared/app_button.dart';
import 'commot/shared/app_textfield.dart';
import 'commot/utils/colors.dart';
import 'data/model/course.dart';
import 'data/model/review.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.review, required this.course});
  static const routeName = '/reviewPage';
  final List<Review> review;
  final Course course;
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:  true,
      backgroundColor: AppColor.bg,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            const Row(
              children: [
                BackButton(),
                Spacer(),
                Text(
                  'Reviews',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                Spacer(),
              ],
            ),
            40.height,
            Expanded(
              child: Consumer<CourseProvider>(
                builder: (context, model, child) {
                  return ListView.builder(
                    itemCount: model.course?.review.length,
                    itemBuilder: (context,index)=>Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(
                                '${model.course?.review[index].name.split(' ').first[0]}'
                                    '${model.course?.review[index].name.split(' ').last[0]}'),
                          ),
                          15.width,
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.course?.review[index].name??'N/A',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColor.primary),
                                ),
                                Text(
                                  model.course?.review[index].comment??'N/A',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          15.width,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            40.height,
            AppButton(
                text: 'Add review',
                width: double.infinity,
                onTap: () {
                  var comment = '';
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColor.transparent,
                      isScrollControlled: true,
                      builder: (_) {
                        return Container(
                          padding: const EdgeInsets.all(22),
                          decoration: const BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: BackButton()),
                                const Text(
                                  'Add Review',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                  ),
                                ),
                                20.height,
                                AuthTextField(
                                  heading: "Comment",
                                  hintText: "Add your comment here",
                                  onChanged: (val) {
                                    setState(() {
                                      comment = val;
                                    });
                                  },
                                ),
                                30.height,
                                AppButton(
                                    text: "Add review",
                                    width: double.infinity,
                                    onTap: () {
                                      if (comment.isNotEmpty) {
                                        var data = {
                                          "name":
                                              "${UserProvider().user?.firstName} ${UserProvider().user?.surname}",
                                          "comment": comment,
                                        };
                                        List<Map<String, dynamic>> d = [];
                                        d.addAll(widget.course.review
                                            .map((e) => e.toJson()));
                                        d.add(data);
                                        var course = Course(
                                            name: widget.course.name,
                                            code: widget.course.code,
                                            lesson: widget.course.lesson,
                                            review: d
                                                .map((e) => Review.fromJson(e))
                                                .toList(),
                                            test: widget.course.test,
                                            tutor: widget.course.tutor);
                                        CourseProvider().editCourse(course);
                                        pop();
                                      }
                                    }),
                              ],
                            ),
                          ),
                        );
                      });
                }),
            40.height,
          ],
        ),
      )),
    );
  }
}

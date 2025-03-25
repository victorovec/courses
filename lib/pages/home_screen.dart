import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lesson/pages/book.dart';
import 'package:lesson/pages/profile.dart';
import 'package:lesson/widget/bottom_navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson/function/function.dart';
import 'package:lesson/pages/card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: Colors.pink[50],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage("assets/woman.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Padding(
            padding: EdgeInsets.all(16.h),
            child: ListView(
              children: [
                Text(
                  "Hi Jack, Let's start learning",
                  style: TextStyle(fontSize: 35.h, fontWeight: FontWeight.bold,fontFamily:"Courier New"),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15,
                          ), // Circular border
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ), // Optional border
                        ),
                        child: SizedBox(
                          height: 50.h,
                          width: 40.w,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Search Here...",
                              border: InputBorder.none, // Remove default border
                              prefixIcon: Icon(Icons.search, color: Colors.black),
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Icon(
                          FontAwesomeIcons.barsStaggered,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ongoing Course",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    InkWell(child: Text("See All")),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.all(16),
                  height: 240.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/mastercard.svg",
                                width: 40.w,
                                height: 40.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Responsive Web Design Adobe...",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Amir Mikasa",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Course Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "30% Complete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 8.0,
                          activeTrackColor:
                              Colors
                                  .deepOrangeAccent, // Loaded (played) part color
                          inactiveTrackColor:
                              Colors.white, // Unloaded part color
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 0.0,
                          ), // Hides the thumb
                          overlayShape:
                              SliderComponentShape
                                  .noOverlay, // Removes glow effect
                          disabledActiveTrackColor:
                              Colors
                                  .deepOrangeAccent, // Force deep orange when disabled
                          disabledInactiveTrackColor:
                              Colors.white, // Force white when disabled
                        ),
                        child: Slider(
                          min: 0.0,
                          max: 100.0,
                          value: 60.0, // Fixed at 60%
                          onChanged: null, // Disable interaction
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_box_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "16 Lessons",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(Icons.play_arrow, size: 35.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Courses",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          "/featured_courses",
                        );
                      },
                      child: Text("See All"),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                bookList(),
                bookList(),
              ],
            ),
          ),
          const CreditCardScreen(),
          const Book(),
          const Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}


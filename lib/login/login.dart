import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson/function/function.dart';

class Login extends ConsumerWidget {
  Login({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.pink[50],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 30.sp,
              backgroundImage: AssetImage("assets/woman.png"),
              backgroundColor: Colors.transparent,
              //child: Icon(Icons.person, size: 30), // Default icon if no image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Text(
              "Hello, Let's get started! ",
              style: TextStyle(fontSize: 35.h, fontWeight: FontWeight.bold,
              //fontFamily:"Courier New"
              ),
            ),
            Text(
              "Join and find the recommended job for you and enjoy satisfying service from us",
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  // Sign In Tab
                  Expanded(
                    child: GestureDetector(
                      onTap:
                          () => _pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.sp),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == 0
                                  ? Colors.deepOrangeAccent
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color:
                                  currentIndex == 0
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Sign Up Tab
                  Expanded(
                    child: GestureDetector(
                      onTap:
                          () => _pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == 1
                                  ? Colors.deepOrangeAccent
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color:
                                  currentIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            // Swipeable PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  ref.read(currentIndexProvider.notifier).state = index;
                },
                children: [
                  //Sign in page
                  buildLogin(ref, context),
                  //Sign up page
                  buildSignup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


final currentIndexProvider = StateProvider<int>((ref) => 0);
final isCheckedProvider = StateProvider<bool>((ref) => false);
final obscureTextProvider = StateProvider<bool>((ref) => true);
final emailControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

final passwordControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson/pages/card.dart';
import 'package:lesson/widget/bottom_navbar.dart';
import 'package:lesson/pages/book.dart';
import 'package:lesson/pages/profile.dart';

class FeaturedCourses extends ConsumerWidget {
  const FeaturedCourses({super.key});

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
          padding:  EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Featured Course",style: TextStyle(fontSize: 35.h, fontWeight: FontWeight.bold,fontFamily:"Courier New" ),),
              SizedBox(height: 10.h,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/ad1.jpg",fit: BoxFit.cover,),
                            
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("(129 Reviews)"),
                          SizedBox(height: 5.h,),
                          Text(
                            "Build Wireless & Fidelity Prototypes...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp
                            ),
                            ),
                            SizedBox(height: 5.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Row(
                                children: [
                                  Icon(Icons.person_2_outlined),
                                  SizedBox(width: 5.w,),
                                  Text("Enrolled")
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box_outlined),
                                  SizedBox(width: 5.w,),
                                  Text("16 Lessons")
                                ],
                              ),Row(
                                children: [
                                  Icon(Icons.alarm),
                                  SizedBox(width: 5.w,),
                                  Text("3h 51m")
                                ],
                              )
                            ],
                          )
                        ],
                      )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/ad2.jpg",fit: BoxFit.cover,),
                            
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("(130 Reviews)"),
                          SizedBox(height: 5.h,),
                          Text(
                            "Interior Design Architecture Learning",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp
                            ),
                            ),
                            SizedBox(height: 5.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Row(
                                children: [
                                  Icon(Icons.person_2_outlined),
                                  SizedBox(width: 5.w,),
                                  Text("Enrolled")
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_box_outlined),
                                  SizedBox(width: 5.w,),
                                  Text("16 Lessons")
                                ],
                              ),Row(
                                children: [
                                  Icon(Icons.alarm),
                                  SizedBox(width: 5.w,),
                                  Text("3h 51m")
                                ],
                              )
                            ],
                          )
                        ],
                      )
                      )
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
        const CreditCardScreen(),
        const Book(),
        const Profile(),
      ]),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavbar extends ConsumerWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return SafeArea(
      bottom: true, // Ensures proper spacing at the bottom
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 10.h,
          left: 20.w,
          right: 20.w,
        ), // Adjusted margin
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, // No extra background
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              _buildNavItem(Icons.home_outlined, 0, selectedIndex),
              _buildNavItem(Icons.credit_card, 1, selectedIndex),
              _buildNavItem(Icons.description_outlined, 2, selectedIndex),
              _buildNavItem(Icons.person_2_outlined, 3, selectedIndex),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              ref.read(selectedIndexProvider.notifier).state = index;
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    int index,
    int selectedIndex,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              selectedIndex == index ? Colors.deepPurple : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 28,
          color: selectedIndex == index ? Colors.white : Colors.grey,
        ),
      ),
      label: '',
    );
  }
}

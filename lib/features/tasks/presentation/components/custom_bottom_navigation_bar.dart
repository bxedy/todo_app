import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int)? onTabTapped;
  final int selectedTabIndex;
  const CustomBottomNavigationBar(
      {super.key, this.onTabTapped, required this.selectedTabIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: AppColors.paleWhite,
          ),
        ),
      ),
      height: 100,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: selectedTabIndex,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.mutedAzure,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTypography.urbanist14W600(),
        unselectedLabelStyle: AppTypography.urbanist14W600(),
        onTap: onTabTapped,
        items: [
          _customBottomNavigationBarItem(
            iconPath: AppAssets.todo,
            label: 'Todo',
            isSelected: selectedTabIndex == 0,
          ),
          _customBottomNavigationBarItem(
            iconPath: AppAssets.plus,
            label: 'Create',
            isSelected: selectedTabIndex == 1,
          ),
          _customBottomNavigationBarItem(
            iconPath: AppAssets.search,
            label: 'Search',
            isSelected: selectedTabIndex == 2,
          ),
          _customBottomNavigationBarItem(
            iconPath: AppAssets.checked,
            label: 'Done',
            isSelected: selectedTabIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      {required String label,
      required String iconPath,
      required bool isSelected}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: iconPath.toSvgPictureWidget(
          color: isSelected ? AppColors.blue : AppColors.mutedAzure,
        ),
      ),
      label: label,
    );
  }
}

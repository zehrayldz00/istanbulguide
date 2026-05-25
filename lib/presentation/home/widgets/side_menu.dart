import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme/app_colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.topWaveColor),
            accountName: Text(
              'hesapadiniçek',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "hesapmaili@example.com",
              style: TextStyle(fontSize: 14.sp),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.background,
              child: Text(
                "HA",
                style: TextStyle(fontSize: 24.sp, color: AppColors.topWaveColor),
              ),
            ),
          ),

          _buildMenuItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Divider(),

          _buildMenuItem(icon: Icons.settings, text: 'Settings', onTap: () {}),

          _buildMenuItem(
            icon: Icons.logout,
            text: 'Log Out',
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppColors.topWaveColor),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontSize: 16.sp,
          fontFamily: 'CircularStd',
        ),
      ),
    );
  }
}

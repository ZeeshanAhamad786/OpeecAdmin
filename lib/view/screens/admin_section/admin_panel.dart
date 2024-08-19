
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec_admin/view/screens/admin_section/payment_screen.dart';
import 'package:opeec_admin/view/screens/admin_section/pricing_screen.dart';
import 'package:opeec_admin/view/screens/admin_section/privacy_policy_screen.dart';
import 'package:opeec_admin/view/screens/admin_section/profile_screen.dart';
import 'package:opeec_admin/view/screens/admin_section/terms_conditions_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override

  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {


  String selectedRoute = '/screen1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomSideBar(
            selectedRoute: selectedRoute,
            onSelected: (route) {
              setState(() {
                selectedRoute = route;
              });
            },
          ),
          Expanded(
              child: getBody()),
        ],
      ),
    );
  }

  Widget getBody() {
    switch (selectedRoute) {
      case '/screen1':
        return const Center(child: Text('This is Screen 1'));
      case '/screen2':
        return const Center(child: Text('This is Screen 2'));
      case '/screen3':
        return const Center(child: Text('This is Screen 3'));
      case '/screen4':
        return const Center(child: Text('This is Screen 4'));
      case '/screen5':
        return const Center(child: Text('This is Screen 5'));
      case '/screen6':
        return const Center(child: Text('This is Screen 6'));
      case '/screen7':
        return const PricingScreen();
      case '/screen8':
      return const TermsAndConditionScreen();
      case '/screen9':
        return const PrivacyAndPolicyScreen();
      case '/screen10':
        return const PaymentScreen();
        case '/screen11':
        return const Center(child: Text('This is Screen 11'));
      case '/profile': // New case for the profile screen
        return const ProfileScreen();
      default:
        return const Center(child: Text('ZEESHAN'));
    }
  }
}

class CustomSideBar extends StatelessWidget {
  final String selectedRoute;
  final ValueChanged<String> onSelected;

  const CustomSideBar({
    Key? key,
    required this.selectedRoute,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w, // Adjust as per your requirement
      decoration: BoxDecoration(color:  Colors.white,borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
      child: Column(
        children: [
          SizedBox(height: 7.h,),
          Image.asset(
            "assets/png/OPEEC.png",
            width: MediaQuery.of(context).size.width * 0.12, // Adjusted for responsiveness
          ),
          SizedBox(height: 5.h,),
          GestureDetector(onTap: () {
            onSelected('/profile');
          },
            child: const CircleAvatar(
              backgroundImage:
                   AssetImage("assets/png/profileImage.png") ,
              radius: 50,
            ),
          ),
          SizedBox(height: 2.h,),
          Text("Mohsin Zulfikar ",style: Constant.textNameBlack,),
          SizedBox(height: 5.h,),
          Flexible(
            child: ListView(
              children: [
                CustomSidebarButton(
                  title: 'Dashboard',
                  route: '/screen1',
                  isSelected: selectedRoute == '/screen1',
                  onTap: () => onSelected('/screen1'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Users',
                  route: '/screen2',
                  isSelected: selectedRoute == '/screen2',
                  onTap: () => onSelected('/screen2'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Equipment',
                  route: '/screen3',
                  isSelected: selectedRoute == '/screen3',
                  onTap: () => onSelected('/screen3'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Rentals',
                  route: '/screen4',
                  isSelected: selectedRoute == '/screen4',
                  onTap: () => onSelected('/screen4'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Chat Support',
                  route: '/screen5',
                  isSelected: selectedRoute == '/screen5',
                  onTap: () => onSelected('/screen5'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Category ',
                  route: '/screen6',
                  isSelected: selectedRoute == '/screen6',
                  onTap: () => onSelected('/screen6'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Pricing',
                  route: '/screen7',
                  isSelected: selectedRoute == '/screen7',
                  onTap: () => onSelected('/screen7'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Terms & conditions',
                  route: '/screen8',
                  isSelected: selectedRoute == '/screen8',
                  onTap: () => onSelected('/screen8'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Privacy policy',
                  route: '/screen9',
                  isSelected: selectedRoute == '/screen9',
                  onTap: () => onSelected('/screen9'),
                ),
                SizedBox(height: 1.8.h,),
                CustomSidebarButton(
                  title: 'Payment',
                  route: '/screen10',
                  isSelected: selectedRoute == '/screen10',
                  onTap: () => onSelected('/screen10'),
                ),
                SizedBox(height: 6.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 2.w, right: 2.w),
                      child: SvgPicture.asset("assets/svg/logoutAdmin.svg",height: 24.px,width: 24.px,),
                    ),
                    SizedBox(width: 1.w,),
                    Padding(
                      padding:  EdgeInsets.only(right: 2.w),
                      child: CustomSidebarButton(
                        title: 'Log out',
                        route: '/screen11',
                        isSelected: selectedRoute == '/screen11',
                        onTap: () => onSelected('/screen11'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h,width: 2.h,)
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class CustomSidebarButton extends StatelessWidget {
  final String title;
  final String route;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomSidebarButton({
    Key? key,
    required this.title,
    required this.route,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: isSelected ? MyColor.orangeColor1 :  MyColor.blackColor1,
                  fontWeight: FontWeight.w400,fontSize: 11.5.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}

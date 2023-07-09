// import 'package:flutter/material.dart';

// import 'package:quickalert/quickalert.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/cubit/app_cubit.dart';
// import '../core/utils/app_colors.dart';
// import '../core/utils/app_string.dart';
// import '../pages/welcome_page.dart';
// import 'my_button.dart';
// import 'my_drawer_item.dart';

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({
//     Key? key,
//     required this.onPressed1,
//     required this.onPressed2,
//     required this.onPressed3,
//     required this.onPressed4,
//     this.onPressed5,
//     required this.title1,
//     required this.title2,
//     required this.title3,
//     required this.title4,
//     this.title5,
//     required this.icon1,
//     required this.icon2,
//     required this.icon3,
//     required this.icon4,
//     this.icon5,
//   }) : super(key: key);

//   final String title1;
//   final String title2;
//   final String title3;
//   final String title4;
//   final String? title5;

//   final IconData icon1;
//   final IconData icon2;
//   final IconData icon3;
//   final IconData icon4;
//   final IconData? icon5;

//   final VoidCallback onPressed1;
//   final VoidCallback onPressed2;
//   final VoidCallback onPressed3;
//   final VoidCallback onPressed4;
//   final VoidCallback? onPressed5;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         AppCubit appCubit = AppCubit.get(context);
//         return Drawer(
//           elevation: 5,
//           child: ListView(
//             children: [
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5.0),
//                         child: Icon(
//                           Icons.person,
//                           color: Colors.grey[300],
//                           size: 80,
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 12),
//                       child: Text(
//                         AppStrings.firstNameArabic,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                           fontSize: 25,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               MyDrawerItem(title: title1, onPressed: onPressed1, icon: icon1),
//               const SizedBox(
//                 height: 8,
//               ),
//               MyDrawerItem(title: title2, onPressed: onPressed2, icon: icon2),
//               const SizedBox(
//                 height: 8,
//               ),
//               MyDrawerItem(title: title3, onPressed: onPressed3, icon: icon3),
//               const SizedBox(
//                 height: 8,
//               ),
//               MyDrawerItem(title: title4, onPressed: onPressed4, icon: icon4),
//               const SizedBox(
//                 height: 8,
//               ),
//               MyDrawerItem(
//                   title: title5 ?? '',
//                   onPressed: onPressed5 ?? () {},
//                   icon: icon5 ?? Icons.error),
//               Divider(
//                 color: Colors.grey[550],
//               ),
//               const Center(
//                 child: Text(
//                   'Contact Us',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: const [
//                   Icon(
//                     Icons.whatsapp,
//                     color: Colors.green,
//                     size: 40,
//                   ),
//                   Icon(
//                     Icons.facebook,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   Icon(
//                     Icons.phone,
//                     size: 40,
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: MyButton(
//                   textSize: 20,
//                   maxHeight: 30,
//                   maxWid: 15,
//                   minHeight: 30,
//                   minWid: 15,
//                   primaryColor: Colors.red,
//                   textColor: Colors.white,
//                   elevation: 0,
//                   onPressed: () {
//                     QuickAlert.show(
//                       context: context,
//                       type: QuickAlertType.confirm,
//                       title: 'هل تريد تسجيل الخروج؟',
//                       titleColor: AppColors.secondaryColor,
//                       confirmBtnText: 'موافق',
//                       cancelBtnText: 'إلغاء',
//                       animType: QuickAlertAnimType.slideInUp,
//                       confirmBtnColor: Colors.red,
//                       cancelBtnTextStyle: TextStyle(
//                         color: AppColors.primaryColor,
//                         fontFamily: AppStrings.appFont,
//                         fontSize: 20,
//                       ),
//                       confirmBtnTextStyle: const TextStyle(
//                         fontFamily: AppStrings.appFont,
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                       onConfirmBtnTap: () async {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return Center(
//                               child: CircularProgressIndicator(
//                                   color: AppColors.primaryColor),
//                             );
//                           },
//                         );
//                         await appCubit.logOut();
//                         Navigator.pop(context);
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const WelcomePage(),
//                             ),
//                             (route) => false);
//                       },
//                       onCancelBtnTap: () {
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                   child: const Text('تسجيل الخروج'),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:assist_app/bloc/cubit/app_cubit.dart';
// import 'package:assist_app/core/enums/connection_enum.dart';
// import 'package:assist_app/core/enums/logged_in_enum.dart';
// import 'package:assist_app/core/enums/refresh_enum.dart';
// import 'package:assist_app/core/enums/user_enum.dart';
// import 'package:assist_app/core/utils/app_strings.dart';
// import 'package:assist_app/core/utils/media_query_values.dart';
// import 'package:assist_app/pages/admin_pages/admin_home_page.dart';
// import 'package:assist_app/pages/common_pages/register_page.dart';
// import 'package:assist_app/pages/student_pages/student_home_page.dart';
// import 'package:assist_app/pages/teacher_pages/teacher_home_page.dart';

// import 'package:assist_app/widgets/my_text_field.dart';
// import 'package:firebase/core/utils/media_query_values.dart';
// import 'package:firebase/pages/register_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:assist_app/core/utils/app_colors.dart';
// import 'package:assist_app/widgets/my_button.dart';
// import 'package:quickalert/quickalert.dart';

// import '../Widgets/my_button.dart';
// import '../Widgets/my_text_field.dart';
// import '../bloc/cubit/app_cubit.dart';
// import '../core/utils/app_colors.dart';
// import '../core/utils/app_string.dart';

// class LogInPage extends StatelessWidget {
//   LogInPage({Key? key}) : super(key: key);
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         AppCubit appCubit = AppCubit.get(context);
//         return Scaffold(
//             backgroundColor: Colors.white,
//             body: Align(
//               alignment: Alignment.center,
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Center(
//                           child: Text(
//                             'تسجيل الدخول',
//                             style: TextStyle(
//                               fontSize:
//                                   40 * MediaQuery.of(context).textScaleFactor,
//                               color: AppColors.secondaryColor,
//                               fontFamily: AppStrings.appFont,
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           color: Colors.grey[550],
//                           thickness: 3,
//                         ),
//                         Card(
//                           shadowColor: Colors.black,
//                           color: Colors.white,
//                           elevation: 7,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           child: SizedBox(
//                             width: context.width,
//                             child: Padding(
//                               padding: const EdgeInsets.all(25),
//                               child: Column(
//                                 // mainAxisAlignment: MainAxisAlignment.,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   MyTextField(
//                                     controller: appCubit.emailController,
//                                     labelText: "البريد الألكتروني",
//                                     textInputType: TextInputType.emailAddress,
//                                     hintText: 'ahmad@gmail.com',
//                                   ),
//                                   SizedBox(
//                                     height: context.height / 90,
//                                   ),
//                                   MyTextField(
//                                     controller: appCubit.passwordController,
//                                     labelText: "كلمة السر",
//                                     textInputType:
//                                         TextInputType.visiblePassword,
//                                     hideInput: true,
//                                     hintText: 'xxxxxxxx',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: context.height / 40,
//                         ),
//                         appCubit.loadingEnum == LoadingEnum.loading
//                             ? Center(
//                                 child: CircularProgressIndicator(
//                                     color: AppColors.primaryColor),
//                               )
//                             : MyButton(
//                                 primaryColor: AppColors.primaryColor,
//                                 textColor: Colors.white,
//                                 child: const Text('تسجيل الدخول'),
//                                 onPressed: () async {
//                                   await appCubit.logInEvents();

//                                   if (appCubit.loggedInEnum ==
//                                       LoggedInEnum.succeed) {
//                                     if (appCubit.userEnum == UserEnum.student) {
//                                       appCubit.me();
//                                       Navigator.pushAndRemoveUntil(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const StudentHomePage(),
//                                           ),
//                                           (route) => false);

//                                       QuickAlert.show(
//                                         context: context,
//                                         type: QuickAlertType.success,
//                                         autoCloseDuration:
//                                             const Duration(milliseconds: 900),
//                                         title: 'أهلاً وسهلاً',
//                                         textColor: AppColors.secondaryColor,
//                                         text: '...تم تسجيل الدخول بنجاح',
//                                         titleColor: AppColors.secondaryColor,
//                                         confirmBtnText: 'تم',
//                                         confirmBtnColor:
//                                             Colors.greenAccent[700]!,
//                                         confirmBtnTextStyle: const TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: AppStrings.appFont,
//                                           fontSize: 20,
//                                         ),
//                                       );
//                                     } else if (appCubit.userEnum ==
//                                         UserEnum.admin) {
//                                       appCubit.me();
//                                       Navigator.pushAndRemoveUntil(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const AdminHomePage(),
//                                           ),
//                                           (route) => false);

//                                       QuickAlert.show(
//                                         context: context,
//                                         type: QuickAlertType.success,
//                                         autoCloseDuration:
//                                             const Duration(milliseconds: 300),
//                                         title: 'أهلاً وسهلاً',
//                                         text: 'تم تسجيل الدخول بنجاح',
//                                         textColor: AppColors.secondaryColor,
//                                         showCancelBtn: false,
//                                         confirmBtnText: 'تم',
//                                         titleColor: AppColors.secondaryColor,
//                                         confirmBtnColor:
//                                             Colors.greenAccent[700]!,
//                                         confirmBtnTextStyle: const TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: AppStrings.appFont,
//                                           fontSize: 20,
//                                         ),
//                                       );
//                                     } else if (appCubit.userEnum ==
//                                         UserEnum.teacher) {
//                                       appCubit.me();
//                                       Navigator.pushAndRemoveUntil(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 TeacherHomePage(),
//                                           ),
//                                           (route) => false);

//                                       QuickAlert.show(
//                                         context: context,
//                                         type: QuickAlertType.success,
//                                         autoCloseDuration:
//                                             const Duration(milliseconds: 300),
//                                         title: 'أهلاً وسهلاً',
//                                         showCancelBtn: false,
//                                         confirmBtnText: 'تم',
//                                         titleColor: AppColors.secondaryColor,
//                                         confirmBtnColor:
//                                             Colors.greenAccent[700]!,
//                                         confirmBtnTextStyle: const TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: AppStrings.appFont,
//                                         ),
//                                       );
//                                     }
//                                   } else if (appCubit.loggedInEnum ==
//                                       LoggedInEnum.serverError) {
//                                     QuickAlert.show(
//                                       context: context,
//                                       type: QuickAlertType.error,
//                                       title: '!! هناك خطأ',
//                                       text: '!! تأكد من اتصالك بالانترنت',
//                                       confirmBtnColor: Colors.red[700]!,
//                                       confirmBtnText: 'موافق',
//                                       confirmBtnTextStyle: const TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: AppStrings.appFont,
//                                         fontSize: 20,
//                                       ),
//                                     );
//                                   } else {
//                                     QuickAlert.show(
//                                       context: context,
//                                       type: QuickAlertType.error,
//                                       title: '!! هناك خطأ',
//                                       text: '!! تأكد من الحساب أو كلمة السر',
//                                       confirmBtnColor: Colors.red[700]!,
//                                       confirmBtnText: 'موافق',
//                                       confirmBtnTextStyle: const TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: AppStrings.appFont,
//                                         fontSize: 20,
//                                       ),
//                                     );
//                                   }
//                                 },
//                               ),
//                         SizedBox(
//                           height: context.height / 90,
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             appCubit.clearControllersEvent();
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: ((context) => RegisterPage()),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             'ليس لديك حساب؟',
//                             style: TextStyle(
//                                 color: AppColors.secondaryColor, fontSize: 15),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ));
//       },
//     );
//   }
// }

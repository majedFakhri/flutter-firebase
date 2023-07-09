// import 'package:firebase/core/utils/media_query_values.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:quickalert/models/quickalert_type.dart';
// import 'package:quickalert/widgets/quickalert_dialog.dart';

// import '../Widgets/my_button.dart';
// import '../Widgets/my_text_field.dart';
// import '../bloc/cubit/app_cubit.dart';
// import '../core/utils/app_colors.dart';
// import '../core/utils/app_string.dart';
// import 'log_in_page.dart';

// class RegisterPage extends StatelessWidget {
//   RegisterPage({Key? key}) : super(key: key);
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         AppCubit appCubit = AppCubit.get(context);
//         return SafeArea(
//           child: Scaffold(
//               backgroundColor: Colors.white,
//               body: Align(
//                 alignment: Alignment.center,
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: formKey,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Center(
//                             child: Text(
//                               'إنشاء حساب جديد',
//                               style: TextStyle(
//                                 fontSize:
//                                     40 * MediaQuery.of(context).textScaleFactor,
//                                 color: AppColors.secondaryColor,
//                                 fontFamily: AppStrings.appFont,
//                               ),
//                             ),
//                           ),
//                           Divider(
//                             color: Colors.grey[550],
//                             thickness: 3,
//                           ),
//                           Card(
//                             shadowColor: Colors.black,
//                             color: Colors.white,
//                             elevation: 7,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 15,
//                               ),
//                             ),
//                             child: SizedBox(
//                               width: context.width,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(25.0),
//                                 child: Column(
//                                   // mainAxisAlignment: MainAxisAlignment.,
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.firstNameEnglishController,
//                                       labelText: ':(EN)الأسم الأول',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.middleNameEnglishController,
//                                       labelText: ':(EN)الأسم الأوسط',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.lastNameEnglishController,
//                                       labelText: ':(EN)الأسم الأخير',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller: appCubit.countryController,
//                                       labelText: ':المدينة',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller: appCubit.emailController,
//                                       labelText: ':البريد الألكتروني',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.firstNameArabicController,
//                                       labelText: ':الأسم الأول',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.middleNameArabicController,
//                                       labelText: ':الأسم الأوسط',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.lastNameArabicController,
//                                       labelText: ':الأسم الأخير',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller:
//                                           appCubit.specializationController,
//                                       labelText: ':الأختصاص',
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller: appCubit.birthController,
//                                       labelText: ':الميلاد',
//                                       textInputType: TextInputType.datetime,
//                                       readOnly: true,
//                                       onTap: () async {
//                                         DateTime? pickeddate =
//                                             await showDatePicker(
//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime(1950),
//                                                 lastDate: DateTime.now());

//                                         if (pickeddate != null) {
//                                           appCubit.birthController.text =
//                                               DateFormat('yyyy-MM-dd')
//                                                   .format(pickeddate)
//                                                   .toString();
//                                         }
//                                       },
//                                     ),
//                                     MyTextField(
//                                       validator: "names",
//                                       controller: appCubit.phoneController,
//                                       labelText: ':الهاتف',
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: context.height / 40,
//                           ),
//                           appCubit.loadingEnum == LoadingEnum.loading
//                               ? Center(
//                                   child: CircularProgressIndicator(
//                                       color: AppColors.primaryColor),
//                                 )
//                               : MyButton(
//                                   primaryColor: AppColors.primaryColor,
//                                   textColor: Colors.white,
//                                   child: const Text('تسجيل'),
//                                   onPressed: () async {
//                                     if (formKey.currentState!.validate()) {
//                                       await appCubit.registerEvents();

//                                       appCubit.me();
//                                       if (appCubit.loggedInEnum ==
//                                           LoggedInEnum.succeed) {
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const StudentHomePage(),
//                                           ),
//                                         );
//                                         QuickAlert.show(
//                                           context: context,
//                                           type: QuickAlertType.success,
//                                           autoCloseDuration:
//                                               const Duration(milliseconds: 900),
//                                           title: 'أهلاً وسهلاً',
//                                           textColor: AppColors.secondaryColor,
//                                           text: '...تم تسجيل الحساب بنجاح',
//                                           titleColor: AppColors.secondaryColor,
//                                           confirmBtnText: 'موافق',
//                                           confirmBtnColor:
//                                               Colors.greenAccent[700]!,
//                                           confirmBtnTextStyle: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: AppStrings.appFont,
//                                             fontSize: 20,
//                                           ),
//                                         );
//                                       } else if (appCubit.loggedInEnum ==
//                                           LoggedInEnum.serverError) {
//                                         QuickAlert.show(
//                                           context: context,
//                                           type: QuickAlertType.error,
//                                           title: '!! هناك خطأ',
//                                           text: '!! تأكد من اتصالك بالانترنت',
//                                           confirmBtnColor: Colors.red[700]!,
//                                           confirmBtnText: 'موافق',
//                                           confirmBtnTextStyle: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: AppStrings.appFont,
//                                             fontSize: 20,
//                                           ),
//                                         );
//                                       } else {
//                                         QuickAlert.show(
//                                           context: context,
//                                           type: QuickAlertType.error,
//                                           title: '!! هناك خطأ',
//                                           text: '!! تأكد من المعلومات المدخلة',
//                                           confirmBtnColor: Colors.red[700]!,
//                                           confirmBtnText: 'موافق',
//                                           confirmBtnTextStyle: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: AppStrings.appFont,
//                                             fontSize: 20,
//                                           ),
//                                         );
//                                       }

//                                       // Navigator.pushReplacement(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //       builder: (context) => const StudentHomePage(),
//                                       //     ),
//                                       //   );
//                                     }
//                                   }),
//                           SizedBox(
//                             height: context.height / 90,
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               appCubit.clearControllersEvent();
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: ((context) => LogInPage()),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'لديك حساب؟',
//                               style: TextStyle(
//                                   color: AppColors.secondaryColor,
//                                   fontSize: 15),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//         );
//       },
//     );
//   }
// }

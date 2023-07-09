// import 'package:firebase/core/utils/media_query_values.dart';
// import 'package:firebase/pages/log_in_page.dart';
// import 'package:firebase/pages/register_page.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../Widgets/my_button.dart';
// import '../bloc/cubit/app_cubit.dart';
// import '../core/utils/app_colors.dart';
// import '../core/utils/app_string.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         // AppCubit appCubit = AppCubit.get(context);
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: Align(
//             alignment: Alignment.center,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                 ),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       SizedBox(
//                         width: context.width / 3,
//                         height: context.height / 3,
//                         child: Image.asset(
//                           AppStrings.appLogoPath,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: MyButton(
//                           primaryColor: AppColors.primaryColor,
//                           textColor: Colors.white,
//                           child: const Text('تسجيل الدخول'),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LogInPage(),
//                               ),
//                             );
//                             print(AppStrings.token == ""
//                                 ? "no token"
//                                 : AppStrings.token);
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: MyButton(
//                             primaryColor: AppColors.primaryColor,
//                             textColor: Colors.white,
//                             child: const Text('تسجيل'),
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => RegisterPage(),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ]),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

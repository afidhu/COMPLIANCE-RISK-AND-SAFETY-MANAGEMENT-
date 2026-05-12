//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class TextInput extends StatefulWidget {
//   const TextInput({super.key});
//
//   @override
//   State<TextInput> createState() => _TextInputState();
// }
//
// class _TextInputState extends State<TextInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(1.sp),
//       padding: EdgeInsets.all(1.sp),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.grey.shade300,
//           width: 1.0,
//         ),
//       ),
//       child: AutocompleteBasicExample(),
//     );
//   }
// }
//
//
// class AutocompleteBasicExample extends StatelessWidget {
//   const AutocompleteBasicExample({super.key});
//
//   static const List<String> _kOptions = <String>['asardvark','aardvark','aasrdvark', 'bear', 'cheetah', 'dog', 'dolphin', 'elephant', 'flamingo', 'giraffe', 'gorilla', 'bobcat', 'chameleon'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Autocomplete<String>(
//       optionsBuilder: (TextEditingValue textEditingValue) {
//         if (textEditingValue.text.isEmpty) {
//           return const Iterable<String>.empty();
//         }
//         return _kOptions.where(
//               (option) => option.toLowerCase().contains(
//             textEditingValue.text.toLowerCase(),
//           ),
//         );
//       },
//       fieldViewBuilder: (context, controller, focusNode, onSubmit) {
//         return TextField(
//           controller: controller,
//           focusNode: focusNode,
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//               onPressed: () {
//                 onSubmit();
//               },
//               icon: const Icon(Icons.arrow_forward),
//             ),
//             prefixIcon: Icon(Icons.search),
//             hintText: 'Search medicines',
//           ),
//         );
//       },
//     );
//   }
// }
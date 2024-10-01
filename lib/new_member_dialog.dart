// // ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import 'new_member.dart';

// class NewMemberDialog extends StatefulWidget {
//   final Isar isar;

//   const NewMemberDialog({Key? key, required this.isar}) : super(key: key);

//   @override
//   _NewMemberDialogState createState() => _NewMemberDialogState();
// }

// class _NewMemberDialogState extends State<NewMemberDialog> {
//   bool isKnownTime = true;

//   bool isMale = true;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   final TextEditingController nameController = TextEditingController();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//       // ignore: avoid_print
//       print('Selected Time: ${picked.format(context)}');
//     }
//   }
// void _saveMember() async {
//   if (nameController.text.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Please enter a name.')),
//     );
//     return;
//   }

//   if (selectedDate == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Please select a birthday.')),
//     );
//     return;
//   }

//   final newMember = NewMember(
//     name: nameController.text,
//     isMale: isMale,
//     birthday: selectedDate,
//     time: NewMember.timeOfDayToString(selectedTime), // Convert TimeOfDay to String
//   );

//   await widget.isar.writeTxn(() async {
//     await widget.isar.newMembers.put(newMember);
//   });

//   Navigator.of(context).pop();
// }

//   // void _saveMember() async {
//   //   final newMember = NewMember(
//   //     name: nameController.text,
//   //     isMale: isMale,
//   //     birthday: selectedDate,
//   //     time: NewMember.timeOfDayToString(selectedTime), // Convert TimeOfDay to String
//   //   );

//   //   await widget.isar.writeTxn(() async {
//   //     await widget.isar.newMembers.put(newMember);
//   //   });

//   //   Navigator.of(context).pop();
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return AlertDialog(
//   //     title: const Text('Add New Member'),
//   //     content: Column(
//   //       mainAxisSize: MainAxisSize.min,
//   //       children: [
//   //         TextField(
//   //           controller: nameController,
//   //           decoration: const InputDecoration(
//   //             labelText: 'Name',
//   //           ),
//   //         ),
//   //         Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //           children: [
//   //             Text('Sex: ${isMale ? "Male" : "Female"}'),
//   //             Switch(
//   //               value: isMale,
//   //               onChanged: (value) {
//   //                 setState(() {
//   //                   isMale = value;
//   //                 });
//   //               },
//   //             ),
//   //           ],
//   //         ),
//   //         Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //           children: [
//   //             Text('Birthday: ${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "Not set"}'),
//   //             TextButton(
//   //               onPressed: () => _selectDate(context),
//   //               child: const Text('Select Date'),
//   //             ),
//   //           ],
//   //         ),
//   //         Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //           children: [
//   //             Text('Time: ${selectedTime != null ? selectedTime!.format(context) : "Not set"}'),
//   //             TextButton(
//   //               onPressed: () => _selectTime(context),
//   //               child: const Text('Select Time'),
//   //             ),
//   //           ],
//   //         ),
//   //       ],
//   //     ),
//   //     actions: [
//   //       TextButton(
//   //         onPressed: () {
//   //           Navigator.of(context).pop();
//   //         },
//   //         child: const Text('Cancel'),
//   //       ),
//   //       TextButton(
//   //         onPressed: _saveMember,
//   //         child: const Text('Save'),
//   //       ),
//   //     ],
//   //   );
//   // }
//   @override
// Widget build(BuildContext context) {
//   return AlertDialog(
//     title: const Text('Add New Member'),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           controller: nameController,
//           decoration: const InputDecoration(
//             labelText: 'Name',
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Sex: ${isMale ? "Male" : "Female"}'),
//             Switch(
//               value: isMale,
//               onChanged: (value) {
//                 setState(() {
//                   isMale = value;
//                 });
//               },
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Birthday: ${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "Not set"}'),
//             TextButton(
//               onPressed: () => _selectDate(context),
//               child: const Text('Select Date'),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Known Time: ${isKnownTime ? "Yes" : "No"}'),
//             Switch(
//               value: isKnownTime,
//               onChanged: (value) {
//                 setState(() {
//                   isKnownTime = value;
//                 });
//               },
//             ),
//           ],
//         ),
//         if (isKnownTime) ...[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Time: ${selectedTime != null ? selectedTime!.format(context) : "Not set"}'),
//               TextButton(
//                 onPressed: () => _selectTime(context),
//                 child: const Text('Select Time'),
//               ),
//             ],
//           ),
//         ],
//       ],
//     ),
//     actions: [
//       TextButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         child: const Text('Cancel'),
//       ),
//       TextButton(
//         onPressed: _saveMember,
//         child: const Text('Save'),
//       ),
//     ],
//   );
// }

// }

///
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'new_member.dart';

class NewMemberDialog extends StatefulWidget {
  final Isar isar;

  const NewMemberDialog({Key? key, required this.isar}) : super(key: key);

  @override
  _NewMemberDialogState createState() => _NewMemberDialogState();
}

class _NewMemberDialogState extends State<NewMemberDialog> {
  bool isKnownTime = true;
  bool isMale = true;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController nameController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      // ignore: avoid_print
      print('選時: ${picked.format(context)}');
    }
  }

  void _saveMember() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('請輸入姓名')),
      );
      return;
    }

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('請輸入生日')),
      );
      return;
    }

    final newMember = NewMember(
      name: nameController.text,
      isMale: isMale,
      birthday: selectedDate,
      time: NewMember.timeOfDayToString(
          selectedTime), // Convert TimeOfDay to String
    );

    await widget.isar.writeTxn(() async {
      await widget.isar.newMembers.put(newMember);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('加新資料'),
      content: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '名',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('性別: ${isMale ? "男" : "女"}'),
                  Switch(
                    value: isMale,
                    onChanged: (value) {
                      setState(() {
                        isMale = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '生日: ${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "還未選"}'),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('日期'),
                  ),
                ],
              ),
              // SizedBox(height: 16),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Known Time: ${isKnownTime ? "Yes" : "No"}'),
              //     Switch(
              //       value: isKnownTime,
              //       onChanged: (value) {
              //         setState(() {
              //           isKnownTime = value;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              if (isKnownTime) ...[
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Time: ${selectedTime != null ? selectedTime!.format(context) : "還未選"}'),
                    TextButton(
                      onPressed: () => _selectTime(context),
                      child: const Text('時間'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveMember,
          child: const Text('Save'),
        ),
      ],
    );
  }
}

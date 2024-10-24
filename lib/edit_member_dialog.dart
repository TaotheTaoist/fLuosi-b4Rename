// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart';
// import 'new_member.dart';

// class EditMemberDialog extends StatefulWidget {
//   final NewMember member;
//   final Isar isar;

//   EditMemberDialog({
//     required this.member,
//     required this.isar,
//   });

//   @override
//   _EditMemberDialogState createState() => _EditMemberDialogState();
// }

// class _EditMemberDialogState extends State<EditMemberDialog> {
//   late TextEditingController nameController;
//   late bool isMale;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   bool isKnownTime = true;

//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.member.name);
//     isMale = widget.member.isMale;
//     selectedDate = widget.member.birthday;
//     selectedTime = NewMember.stringToTimeOfDay(widget.member.time);
//     isKnownTime = selectedTime != null;
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
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
//       initialTime: selectedTime ?? TimeOfDay.now(),
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//         isKnownTime = true;
//       });
//     }
//   }

//   void _saveMember() async {
//     if (nameController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter a name.')),
//       );
//       return;
//     }

//     final updatedMember = widget.member
//       ..name = nameController.text
//       ..isMale = isMale
//       ..birthday = selectedDate
//       ..time = NewMember.timeOfDayToString(selectedTime);

//     try {
//       await widget.isar.writeTxn(() async {
//         // Ensure no other transactions are active before performing this operation
//         await widget.isar.newMembers.put(updatedMember);
//       });
//       Navigator.of(context).pop(updatedMember);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to update member: $e')),
//       );
//     }
//   }

//   // void _saveMember() async {
//   //   if (nameController.text.isEmpty) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Please enter a name.')),
//   //     );
//   //     return;
//   //   }

//   //   final updatedMember = widget.member
//   //     ..name = nameController.text
//   //     ..isMale = isMale
//   //     ..birthday = selectedDate
//   //     ..time = NewMember.timeOfDayToString(selectedTime);

//   //   try {
//   //     await widget.isar.writeTxn(() async {
//   //       await widget.isar.newMembers.put(updatedMember);
//   //     });
//   //     Navigator.of(context).pop(updatedMember);
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Failed to update member: $e')),
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Edit Member'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: 'Name',
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Sex: ${isMale ? "Male" : "Female"}'),
//               Switch(
//                 value: isMale,
//                 onChanged: (value) {
//                   setState(() {
//                     isMale = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                   'Birthday: ${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "Not set"}'),
//               TextButton(
//                 onPressed: () => _selectDate(context),
//                 child: const Text('Select Date'),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Known Time: ${isKnownTime ? "Yes" : "No"}'),
//               Switch(
//                 value: isKnownTime,
//                 onChanged: (value) {
//                   setState(() {
//                     isKnownTime = value;
//                     if (!value) selectedTime = null; // Clear time if not known
//                   });
//                 },
//               ),
//             ],
//           ),
//           if (isKnownTime) ...[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                     'Time: ${selectedTime != null ? selectedTime!.format(context) : "Not set"}'),
//                 TextButton(
//                   onPressed: () => _selectTime(context),
//                   child: const Text('Select Time'),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: _saveMember,
//           child: const Text('Save'),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'new_member.dart';

class EditMemberDialog extends StatefulWidget {
  final NewMember member;
  final Isar isar;

  EditMemberDialog({
    required this.member,
    required this.isar,
  });

  @override
  _EditMemberDialogState createState() => _EditMemberDialogState();
}

class _EditMemberDialogState extends State<EditMemberDialog> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late bool isMale;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isKnownTime = true;

  @override
  void initState() {
    super.initState();
    idController =
        TextEditingController(text: widget.member.id?.toString() ?? '');
    nameController = TextEditingController(text: widget.member.name);
    isMale = widget.member.isMale;
    selectedDate = widget.member.birthday;
    selectedTime = NewMember.stringToTimeOfDay(widget.member.time);
    isKnownTime = selectedTime != null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
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
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        isKnownTime = true;
      });
    }
  }

  // void _saveMember() async {
  //   if (nameController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please enter a name.')),
  //     );
  //     return;
  //   }

  //   final updatedMember = widget.member
  //     ..id = int.tryParse(idController.text) // Parse the new ID as an integer
  //     ..name = nameController.text
  //     ..isMale = isMale
  //     ..birthday = selectedDate
  //     ..time = NewMember.timeOfDayToString(selectedTime);

  //   try {
  //     await widget.isar.writeTxn(() async {
  //       await widget.isar.newMembers.put(updatedMember);
  //     });
  //     Navigator.of(context).pop(updatedMember);
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to update member: $e')),
  //     );
  //   }
  // }
  // void _saveMember() async {
  //   if (nameController.text.isEmpty) {

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('請輸入名子')),
  //       );
  //       return;

  //   }

  //   // Parse the new ID from the input field
  //   final int? newId = int.tryParse(idController.text);

  //   if (newId == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Invalid ID entered.')),
  //     );
  //     return;
  //   }

  //   // Check if the ID already exists in the database
  //   final existingMember = await widget.isar.newMembers.get(newId);

  //   // If the ID exists and it's not the same member we're editing, show an alert
  //   if (existingMember != null && existingMember.id != widget.member.id) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('已有此ID'),
  //           content: Text(
  //               'A member with ID $newId already exists. Please choose a different ID.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Close the alert dialog
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //     return; // Stop further execution if there's an ID conflict
  //   }

  //   try {
  //     await widget.isar.writeTxn(() async {
  //       // If the ID has changed, delete the original member
  //       if (widget.member.id != newId) {
  //         await widget.isar.newMembers.delete(widget.member.id!);
  //       }

  //       // Create the updated member object
  //       final updatedMember = NewMember(
  //         name: nameController.text, // Assign the updated name
  //         isMale: isMale, // Assign updated gender
  //         birthday: selectedDate, // Assign updated birthday
  //         time:
  //             NewMember.timeOfDayToString(selectedTime), // Assign updated time
  //       );

  //       // Manually set the new ID (outside of the constructor)
  //       updatedMember.id = newId;

  //       // Insert the updated member
  //       await widget.isar.newMembers.put(updatedMember);
  //     });

  //     // Close the dialog after successfully saving
  //     Navigator.of(context).pop();
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('無法更改: $e')),
  //     );
  //   }
  // }
  // void _saveMember() async {
  //   if (nameController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('請輸入名子')),
  //     );
  //     return;
  //   }

  //   // Parse the new ID from the input field
  //   final int? newId = int.tryParse(idController.text);

  //   if (newId == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Invalid ID entered.')),
  //     );
  //     return;
  //   }

  //   // Check if the ID already exists in the database
  //   final existingMember = await widget.isar.newMembers.get(newId);

  //   // If the ID exists and it's not the same member we're editing, show an alert
  //   if (existingMember != null && existingMember.id != widget.member.id) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('已有此ID'),
  //           content: Text(
  //               'A member with ID $newId already exists. Please choose a different ID.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Close the alert dialog
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //     return; // Stop further execution if there's an ID conflict
  //   }

  //   try {
  //     await widget.isar.writeTxn(() async {
  //       // If the ID has changed, delete the original member
  //       if (widget.member.id != newId) {
  //         await widget.isar.newMembers.delete(widget.member.id!);
  //       }

  //       // Create the updated member object
  //       final updatedMember = NewMember(
  //         name: nameController.text, // Assign the updated name
  //         isMale: isMale, // Assign updated gender
  //         birthday: selectedDate, // Assign updated birthday
  //         time:
  //             NewMember.timeOfDayToString(selectedTime), // Assign updated time
  //       );

  //       // Manually set the new ID (outside of the constructor)
  //       updatedMember.id = newId;

  //       // Insert the updated member
  //       await widget.isar.newMembers.put(updatedMember);
  //     });

  //     // Use setState here to update any state variables if necessary
  //     setState(() {
  //       // Update any state here, if needed.
  //       // For example, if you need to update a list or any other UI element:
  //       // membersList.add(updatedMember); // Example of updating state
  //     });

  //     // Close the dialog after successfully saving
  //     Navigator.of(context).pop();
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('無法更改: $e')),
  //     );
  //   }
  // }
  void _saveMember() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('請輸入名子')),
      );
      return;
    }

    // Parse the new ID from the input field
    final int? newId = int.tryParse(idController.text);

    if (newId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid ID entered.')),
      );
      return;
    }

    // Check if the ID already exists in the database
    final existingMember = await widget.isar.newMembers.get(newId);

    // If the ID exists and it's not the same member we're editing, show an alert
    if (existingMember != null && existingMember.id != widget.member.id) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('已有此ID'),
            content: Text(
                'A member with ID $newId already exists. Please choose a different ID.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Stop further execution if there's an ID conflict
    }

    try {
      await widget.isar.writeTxn(() async {
        // If the ID has changed, delete the original member
        if (widget.member.id != newId) {
          await widget.isar.newMembers.delete(widget.member.id!);
        }

        // Update the existing member or create a new one
        widget.member.id = newId;
        widget.member.name = nameController.text;
        widget.member.isMale = isMale;
        widget.member.birthday = selectedDate;
        widget.member.time = NewMember.timeOfDayToString(selectedTime);

        // Save the updated member
        await widget.isar.newMembers.put(widget.member);
      });

      // Pass the updated member back to the parent
      Navigator.of(context)
          .pop(widget.member); // Close dialog and pass back the updated member
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('無法更改: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('更改資料'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '請輸入姓名',
              ),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '生日: ${selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : "未選"}'),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('請輸入生日'),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('確認時間: ${isKnownTime ? "Yes" : "No"}'),
            //     Switch(
            //       value: isKnownTime,
            //       onChanged: (value) {
            //         setState(() {
            //           isKnownTime = value;
            //           if (!value)
            //             selectedTime = null; // Clear time if not known
            //         });
            //       },
            //     ),
            //   ],
            // ),
            if (isKnownTime)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '時間: ${selectedTime != null ? selectedTime!.format(context) : "未選"}'),
                  TextButton(
                    onPressed: () => _selectTime(context),
                    child: const Text('選時'),
                  ),
                ],
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _saveMember,
          child: const Text('Save'),
        ),
      ],
    );
  }
}

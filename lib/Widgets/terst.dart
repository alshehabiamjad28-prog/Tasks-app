// // 1️⃣ متغير لتخزين التاريخ
// DateTime? selectedDate;
//
// // 2️⃣ دالة لفتح الـ DatePicker
// Future<void> pickDate(BuildContext context) async {
//   DateTime now = DateTime.now();
//   DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: now,
//     firstDate: now,
//     lastDate: DateTime(now.year + 5),
//   );
//
//   if (picked != null) {
//     selectedDate = picked; // حفظ التاريخ
//   }
// }
//



//
// // داخل الودجت
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// padding: EdgeInsets.all(16),
// shape: CircleBorder(), // يعطي شكل دائري للزر
// backgroundColor: Colors.blue, // لون الزر
// ),
// onPressed: () => pickDate(context),
// child: FaIcon(
// FontAwesomeIcons.calendar, // أيقونة التقويم
// color: Colors.white,
// size: 24,
// ),
// ),

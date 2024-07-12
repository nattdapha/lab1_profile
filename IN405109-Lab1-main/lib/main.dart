import 'package:flutter/material.dart';
import 'package:lab1/DetailPage.dart';
import 'package:lab1/student.dart'; // Assuming Student class is defined in student.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 54, 130, 244)),
        useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
      Student("อรัญ ศรีสวัสดิ์", "643450095-5", "image/Arun.jpg", "About Arun", "02/02/2003", "อ่านหนังสือ", "กะหรี่ปั๊ป", "arun@kkumail.com", "https://www.facebook.com/profile.php?id=100009484489572"),
      Student("กฤติยา สินโพธิ์", "643450320-4", "image/B1.jpg", "About Krittiya", "27/04/2003", "ดูหนังและซีรีส์", "ไก่ย่าง", "krittiya@kkumail.com", "https://www.facebook.com/profile.php?id=100008555494222"),
      Student("ปรเมศวร์ สิทธิมงคล", "643450078-5", "image/Parames.jpg", "About Poramet", "25/12/2002", "ทำอาหาร", "ปลาสามรส ,ไก่ผัดเม็ดมะม่วงหิมพานต์", "poramet@kkumail.com", "https://www.facebook.com/kki.jik.3"),
      Student("พรธิตา ขานพล", "643450080-8", "image/B5.jpg", "About Pornthita", "12/09/2002", "ถ่ายภาพ", "ส้มตำปูปลาร้า ,ขนมปัง", "pornthita@kkumail.com", "https://www.facebook.com/pornthita.hkanphol.58"),
      Student("อมรรัตน์ มาระเหว", "643450094-7", "image/B2.jpg", "About Amonrat", "01/01/2002", "ปลูกต้นไม้", "ปลาราดพริก", "amonrat@kkumail.com", "https://www.facebook.com/amonrart.m"),
      Student("ณัฐธิดา บุญพา", "643450647-2", "image/B4.jpg", "About Natthida", "27/03/2003", "เล่นเกม", "ก๋วยเตี๋ยว ,ยำ ,ข้าวไข่ดาว", "natthida@kkumail.com", "https://www.facebook.com/jannattida.za/"),
      Student("ทัศนีย์ มลาตรี", "643450075-1", "image/B3.jpg", "About Thatsanee", "07/09/2002", "ร้องเพลง", "ข้าวกะเพรา", "thatsanee@kkumail.com", "https://www.facebook.com/tatsanee.tookta"),
      Student("รัตพงษ์ ปานเจริญ", "643450650-3", "image/Ratpong.jpg", "About Rattapong", "17/11/2002", "ออกกำลังกาย", "โค้ก ,ขนมหวาน", "rattapong@kkumail.com", "https://www.facebook.com/profile.php?id=100011589436120"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My Students"),
      ),
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return displayItem(context: context, student: datas[index]);
          }),
    );
  }

  Widget displayItem({required BuildContext context, required Student student}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      data: student,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  image: AssetImage(student.image),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    student.studentid,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

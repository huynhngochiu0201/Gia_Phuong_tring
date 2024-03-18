import 'package:flutter/material.dart';
import 'package:pt_bat2/model/data_model.dart';

import '../components/custom_text_field.dart';
//import 'package:pt_bat2/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController ipAController = TextEditingController();
  TextEditingController ipBController = TextEditingController();
  TextEditingController ipCController = TextEditingController();
  TextEditingController resurltController = TextEditingController();

  @override
  void initState() {
    /// initState được gọi một lần duy nhất khi một widget được tạo và thêm vào cây giao diện
    resurltController.text = 'Resurlt';
    super.initState();
  }

  String get checkValue {
    String a = ipAController.text.trim();
    String b = ipBController.text.trim();
    String c = ipCController.text.trim();

    if (a == '' || b == '' || c == '') {
      return 'Not null';
    }

    try {
      double.parse(a);
      double.parse(b);
      double.parse(c);
    } on FormatException {
      return 'Vui lòng nhạp so';
    }
    return 'ok';
  }

  // void input() {
  //   a = Validoter.getString();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'ax2 + bx + c = 0',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                CustomTextField(
                  controller: ipAController,
                  textController: 'Input a',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    controller: ipBController, textController: 'Input b'),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    controller: ipCController, textController: 'Input c'),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (checkValue == 'ok') {
                      double a = double.parse(ipAController.text.trim());
                      double b = double.parse(ipBController.text.trim());
                      double c = double.parse(ipCController.text.trim());

                      List<double>? listResult = DataModel.gpt(a, b, c);

                      String strResult;

                      if (listResult == null) {
                        strResult = 'Phuong trinh vo so nghiem';
                      } else if (listResult.isEmpty) {
                        //isEmpty là kiểm tra xem một chuỗi hoặc cấu trúc dữ liệu có rỗng không.
                        strResult = 'Phuong trinh vo nghiem';
                      } else if (listResult.length == 1) {
                        strResult = 'x = ${listResult[0].toStringAsFixed(2)}';
                      } else {
                        strResult =
                            'x1 = ${listResult[0].toStringAsFixed(2)}, x2 = ${listResult[1].toStringAsFixed(2)}';
                      }
                      resurltController.text = strResult;
                    } else {
                      final snackBar = SnackBar(
                        content: Text(checkValue),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child: const Text(
                    'Calculator',
                    selectionColor: Colors.black12,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: resurltController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
                  readOnly:
                      true, //readOnly: true là dùng để chỉ đọc ko  dùng để nhập
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

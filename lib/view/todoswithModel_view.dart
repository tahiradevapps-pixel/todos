import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todos_model.dart';
import 'package:flutter_application_1/repo/api_repo.dart';

class ApiwithModelscreen extends StatefulWidget {
  const ApiwithModelscreen({super.key});

  @override
  State<ApiwithModelscreen> createState() => _ApiscreenState();
}
class _ApiscreenState extends State<ApiwithModelscreen> {
  List<Map<String, dynamic>>? result;
  final idcontroler = TextEditingController();

  Future<List<TodosModel>?> getdata(String number) async {
    List<TodosModel>? result = await ApiRepo().getchatsWithModel(
      idcontroler.text,
    );
    return result ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Record")),
      body: Column(
        children: [
          TextField(
            controller: idcontroler,
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              labelText: "Write id..... ",
              suffixIcon: IconButton(
                onPressed: () async {
                  await getdata(idcontroler.text);
                  setState(() {});
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),

          SizedBox(height: 10),

          FutureBuilder(
            future: getdata(idcontroler.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (!snapshot.hasData) {
                return Text("No Data Here");
              }
              if (snapshot.hasError) {
                return Text("Some Error");
              }
              final chat = snapshot.data;
              return Expanded(
                child: ListView.builder(
                  itemCount: chat?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final record = chat?[index];
                    return ListTile(
                      title: Text(record?.title ?? ""),
                      subtitle: Column(
                        children: [
                          Text(record?.completed.toString() ?? ""),
                          Text(record?.id.toString() ?? ""),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

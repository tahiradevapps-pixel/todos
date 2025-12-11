import 'package:flutter/material.dart';
import 'package:flutter_application_1/repo/api_repo.dart';

class Apiscreen extends StatefulWidget {
  const Apiscreen({super.key});

  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {
  List<Map<String, dynamic>>? result;
  final idcontroler = TextEditingController();

  Future<List<Map<String, dynamic>>> getdata(String number) async {
    List<Map<String, dynamic>>? result = await ApiRepo().getchats(
      idcontroler.text,
    );
    return result ?? [];
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
                      title: Text(record?["userId"].toString() ?? ""),
                      subtitle: Text(record?["title"].toString() ?? ""),
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/comment_model.dart';
import 'package:flutter_application_1/repo/comment_repo.dart';

class CommentwithmodelView extends StatefulWidget {
  const CommentwithmodelView({super.key});

  @override
  State<CommentwithmodelView> createState() => _ApiscreenState();
  
}

class _ApiscreenState extends State<CommentwithmodelView> {
  List<Map<String, dynamic>>? result;
  final idcontroler = TextEditingController();

  Future<List<CommentModel>?> getdata(String number) async {
    List<CommentModel>? result = await CommentRepo().getComentModel(
      idcontroler.text,
    
    );
    return result ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Comments Result")),
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
                    final recoment = chat?[index];
                    return ListTile(
                      title: Text(recoment?.name ?? " "),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(recoment?.email.toString() ?? " "),
                          Text(recoment?.body.toString() ?? " "),
                          Text(recoment?.id.toString() ?? " "),
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

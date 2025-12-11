import 'package:flutter/material.dart';
import 'package:flutter_application_1/repo/todos_repo.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  // List<Map<String, dynamic>>? response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('todos view')),
      body: Column(
        children: [
          FutureBuilder(
            future: TodosRepo().getTodoNotes(),
            builder: (context, Snapshot) {
              if (Snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (!Snapshot.hasData) {
                return Text(' no data found');
              }
              if (Snapshot.hasError) {
                return Text("get error");
              }
              final data = Snapshot.data;
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    final result = data?[index];
                    return ListTile(
                      title: Text(result?["userId"].toString() ?? ''),
                      subtitle: Text(result?["title"].toString() ?? ''),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/repo/todos_repo.dart';

// class TodosView extends StatefulWidget {
//   const TodosView({super.key});

//   @override
//   State<TodosView> createState() => _TodosViewState();
// }

// class _TodosViewState extends State<TodosView> {
//   List<Map<String, dynamic>>? response;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("OUr todos result")),
//       body: Column(
//         children: [
//           FutureBuilder(
//             future: TodosRepo().getTodoNotes(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               }
//               if (!snapshot.hasData) {
//                 return Text("no data found");
//               }
//               if (snapshot.hasError) {
//                 return Text("get error");
//               }

//               final data = snapshot.data;
//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: data?.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     final result = data?[index];
//                     return ListTile(
//                       title: Text(result?["userId"].toString() ?? ''),
//                       subtitle: Text(result?["title"].toString() ?? ''),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

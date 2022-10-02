import 'package:flutter/material.dart';
import 'package:flutter3/routes.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.dashboard),
//           title: Text("Belajar MaterialApp Scaffold"),
//           actions: <Widget>[
//             Icon(Icons.search),
//           ],
//           actionsIconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: Color.fromARGB(255, 15, 113, 194),
//           bottom: PreferredSize(
//             child: Container(
//               color: Color.fromARGB(255, 66, 190, 70),
//               height: 4.0,
//             ),
//             preferredSize: Size.fromHeight(4.0)
//           ),
//           centerTitle: true,
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Color.fromARGB(255, 17, 104, 175),
//           child: Text('+'),
//           onPressed: () {},
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(width: 50, height: 50, decoration: BoxDecoration(color: Color.fromARGB(255, 0, 80, 146),
//         shape: BoxShape.circle),),
//             Container(width: 50, height: 50, decoration: BoxDecoration(color: Color.fromARGB(255, 0, 142, 207),
//         shape: BoxShape.circle),),
//         Container(width: 50, height: 50, decoration: BoxDecoration(color:
//       Color.fromARGB(255, 0, 174, 255), shape: BoxShape.circle),),
//             Row(
//               children: <Widget>[
//                 Container(width: 50, height: 50, margin: const EdgeInsets.only(left: 40) , decoration: BoxDecoration(color:
//       Color.fromARGB(255, 0, 174, 255), shape: BoxShape.circle),),
//                 Container(width: 50, height: 50, decoration: BoxDecoration(color: Color.fromARGB(255, 0, 142, 207),
//         shape: BoxShape.circle),),
//                 Container(width: 50, height: 50, decoration: BoxDecoration(color:
//       Color.fromARGB(255, 0, 94, 138), shape: BoxShape.circle),),
//               ],
//             )
//           ],
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
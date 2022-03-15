import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  TextEditingController _i = TextEditingController();
  TextEditingController _p = TextEditingController();

  @override
  void initState() {
    _i = TextEditingController();
    _p = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _i.dispose();
    _p.dispose();
    super.dispose();
  }

  String _id = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log in to exam system")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: TextField(
                onChanged: (v) => setState(() {
                  _id = v;
                }),
                controller: _i,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter id',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: TextField(
                onChanged: (v) => setState(() {
                  _password = v;
                }),
                controller: _p,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Log in"),
              onPressed: () {
                setState(() {
                  _id = _i.text;
                  _password = _p.text;
                  _i.text = "";
                  _p.text = "";
                  // checkLogin(context, _id, _password);
                  Navigator.of(context).pushNamed(
                    '/home',
                    arguments: {_id, _password}
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }

// checkLogin(BuildContext context, String id, String password) {
//   BlocProvider<StudentBloc>(
//     create: (context) => StudentBloc()..add(StudentInitializedEvent()),
//     child: BlocBuilder<StudentBloc, StudentState>(
//       builder: (context, state){
//         print("tuka sme");
//
//         if (state is StudentElementsState){
//           Student student = state.students!.firstWhere((element) => element.id==id&&element.password==password);
//           print(student);
//           if(student.id=="181519"){
//             Navigator.of(context).pushNamed(
//               '/home',
//               arguments: student,
//             );
//             return Text("text");
//           }
//         }
//         return Text("text");
//       }
//     ),
//   );
// }
}

import 'package:flutter/material.dart';
import 'package:student_organizer/exam.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController _c = TextEditingController();
  TextEditingController _y = TextEditingController();
  TextEditingController _m = TextEditingController();
  TextEditingController _d = TextEditingController();
  TextEditingController _h = TextEditingController();
  TextEditingController _min = TextEditingController();

  @override
  void initState() {
    _c = TextEditingController();
    _y = TextEditingController();
    _m = TextEditingController();
    _d = TextEditingController();
    _h = TextEditingController();
    _min = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _c.dispose();
    _y.dispose();
    _m.dispose();
    _d.dispose();
    _h.dispose();
    _min.dispose();
    super.dispose();
  }

  final String title = "Student Organizer";
  final List<ExamApplication> elements = [
    ExamApplication(
        courseName: "Mobilni Informaciski Sistemi",
        dateTime: DateTime(2017, 9, 7, 17, 30)),
    ExamApplication(
        courseName: "Voved vo Pametni Gradovi",
        dateTime: DateTime(2017, 9, 7, 17, 30))
  ];
  String _course = "";
  String _year = "2019";
  String _month = "12";
  String _day = "7";
  String _hour = "17";
  String _minute = "30";

  void addExamApplication(course, year, month, day, hour, minute) {
    setState(() {
      elements.add(ExamApplication(
          courseName: course,
          dateTime: DateTime(year, month, day, hour, minute)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: TextField(
                    onChanged: (v) => setState(() {
                      _course = v;
                    }),
                    controller: _c,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter course name',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                        width: double.infinity,
                        child: TextField(
                          onChanged: (v) => setState(() {
                            _year = v;
                          }),
                          controller: _y,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Year',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        width: double.infinity,
                        child: TextField(
                          onChanged: (v) => setState(() {
                            _month = v;
                          }),
                          controller: _m,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Month',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                        width: double.infinity,
                        child: TextField(
                          onChanged: (v) => setState(() {
                            _day = v;
                          }),
                          controller: _d,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Day',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 8, 5, 0),
                        width: double.infinity,
                        child: TextField(
                          onChanged: (v) => setState(() {
                            _hour = v;
                          }),
                          controller: _h,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Hour',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 10, 0),
                        width: double.infinity,
                        child: TextField(
                          onChanged: (v) => setState(() {
                            _minute = v;
                          }),
                          controller: _min,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Minute',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text("Add course exam to schedule"),
                    onPressed: () {
                      setState(() {
                        _course = _c.text;
                        _year = _y.text;
                        _month = _m.text;
                        _day = _d.text;
                        _hour = _h.text;
                        _minute = _min.text;
                        addExamApplication(
                            _course,
                            int.parse(_year),
                            int.parse(_month),
                            int.parse(_day),
                            int.parse(_hour),
                            int.parse(_minute));
                        _c.text = "";
                        _y.text = "";
                        _m.text = "";
                        _d.text = "";
                        _h.text = "";
                        _min.text = "";
                      });
                    },
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: elements.length,
                itemBuilder: (context, index) {
                  print(elements[index]);
                  return Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            elements[index].courseName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "${elements[index].dateTime.year.toString()}-${elements[index].dateTime.month.toString().padLeft(2, '0')}-${elements[index].dateTime.day.toString().padLeft(2, '0')} ${elements[index].dateTime.hour.toString().padLeft(2, '0')}:${elements[index].dateTime.minute.toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

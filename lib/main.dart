import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_organizer/blocs/list_event.dart';
import 'package:student_organizer/exam.dart';

import 'list_detail_screen.dart';
import 'blocs/list_bloc.dart';
import 'blocs/list_event.dart';
import 'blocs/list_state.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<ListBloc>(
        create: (BuildContext context) =>
            ListBloc()..add(ListInitializedEvent()),
      ),
    ], child: MyApp()),
  );
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

  bool isVisible = false;

  final String title = "Student Organizer";

  // final List<ExamApplication> elements = [
  //   ExamApplication(
  //       courseName: "Mobilni Informaciski Sistemi",
  //       dateTime: DateTime(2017, 9, 7, 17, 30)),
  //   ExamApplication(
  //       courseName: "Voved vo Pametni Gradovi",
  //       dateTime: DateTime(2017, 9, 7, 17, 30))
  // ];
  String _course = "";
  String _year = "2019";
  String _month = "12";
  String _day = "7";
  String _hour = "17";
  String _minute = "30";

  void addExamApplication(
      BuildContext ctx, course, year, month, day, hour, minute) {
    final bloc = BlocProvider.of<ListBloc>(ctx);
    bloc.add(ListElementAddedEvent(
        element: ExamApplication(
            courseName: course,
            dateTime: DateTime(year, month, day, hour, minute))));
  }

  void _deleteItem(BuildContext ctx, ExamApplication examApplication) {
    final bloc = BlocProvider.of<ListBloc>(ctx);
    bloc.add(ListElementDeletedEvent(element: examApplication));
  }

  void _showHideAddMenu() {
    setState(() => isVisible = !isVisible);
  }

  dynamic _createAppBar(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
            trailing: Row(
              children: [
                GestureDetector(
                  onTap: () => _showHideAddMenu(),
                  child: !isVisible
                      ? const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            CupertinoIcons.add,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            CupertinoIcons.minus,
                          ),
                        ),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(title),
            actions: <Widget>[
              GestureDetector(
                onTap: () => _showHideAddMenu(),
                child: !isVisible
                    ? const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.add,
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.remove,
                        ),
                      ),
              ),
            ],
          );
  }

  Widget _createBody(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isVisible,
          child: Column(
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
                          context,
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
        ),
        Expanded(
          child: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
            return state.runtimeType == ListEmptyState
                ? const Center(
                    child: Text("No elements"),
                  )
                : Center(
                    child: ListView.builder(
                      itemCount: (state as ListElementsState).elements?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: ListTile(
                            title: Text(
                              (state as ListElementsState).elements![index].courseName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            subtitle: Text(
                              "${(state).elements![index].dateTime.year.toString()}-${(state).elements![index].dateTime.month.toString().padLeft(2, '0')}-${(state).elements![index].dateTime.day.toString().padLeft(2, '0')} ${(state).elements![index].dateTime.hour.toString().padLeft(2, '0')}:${(state).elements![index].dateTime.minute.toString().padLeft(2, '0')}",
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteItem(context,
                                  (state as ListElementsState).elements![index]),
                            ),
                            onTap: () => _showDetail(context,
                                (state as ListElementsState).elements![index]),
                          ),
                        );
                      },
                    ),
                  );
          }),
        )
      ],
    );
  }

  void _showDetail(BuildContext context, element) {
    Navigator.of(context).pushNamed(
      ListDetailsScreen.routeName,
      arguments: element,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            home: CupertinoPageScaffold(
              child: _createBody(context),
              navigationBar: _createAppBar(context),
            ),
          )
        :
    // BlocProvider<ListBloc>(
            // create: (BuildContext context) =>
            //     ListBloc()..add(ListInitializedEvent()),
            // child:
        MaterialApp(
              title: title,
              initialRoute: '/',
              routes: {
                '/': (ctx) => Scaffold(
                      appBar: _createAppBar(context),
                      body: _createBody(context),
                    ),
                ListDetailsScreen.routeName: (ctx) => ListDetailsScreen(),
              },
            // ),
          );
  }
}

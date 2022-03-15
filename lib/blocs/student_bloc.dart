import 'package:flutter_bloc/flutter_bloc.dart';
import '../exam.dart';
import '../student.dart';
import 'student_event.dart';
import 'student_state.dart';

abstract class AddItemDelegate{
  void onSuccess();
  void onError(String message);
}

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  List<Student>? _students;

  StudentBloc() : super(StudentInitState()) {
    on<StudentInitializedEvent>((event, emit) {
      this._students = [
        Student(
          id: "181519",
          password: "Flutter123",
          name: "Gorast",
          surname: "Angelovski",
          exams: [
            ExamApplication(
                courseName: "Mobilni Informaciski Sistemi",
                dateTime: DateTime(2022, 3, 21, 17, 30)),
            ExamApplication(
                courseName: "Voved vo Pametni Gradovi",
                dateTime: DateTime(2022, 3, 20, 17, 30))
          ],
        ),
      ];
      StudentInitState state = StudentInitState();
      state.students = this._students;
      emit(state);
    });
    on<StudentAddedEvent>((event, emit) {
      this._students!.add((event.student as Student));
      emit(StudentElementsState(students: this._students));
      print("added");
      print(event.student);
    });
    on<StudentDeletedEvent>((event, emit) {
      this._students!.remove(event.student);
      if (this._students!.length > 0) {
        emit(StudentElementsState(students: this._students));
      } else {
        emit(StudentEmptyState());
      }
    });
    // on<CheckIfStudentExistsEvent>((event, emit) {
    //   var existingStudent = this._students!.firstWhere((element) =>
    //       element.id == event.id && element.password == event.password);
    //
    //   emit();
    // });
  }
}

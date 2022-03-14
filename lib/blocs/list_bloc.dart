import 'package:flutter_bloc/flutter_bloc.dart';
import '../exam.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  List<ExamApplication>? _elements;

  ListBloc() : super(ListInitState()) {
    on<ListInitializedEvent>((event, emit) {
      this._elements = [
        ExamApplication(
            courseName: "Mobilni Informaciski Sistemi",
            dateTime: DateTime(2017, 9, 7, 17, 30)),
        ExamApplication(
            courseName: "Voved vo Pametni Gradovi",
            dateTime: DateTime(2017, 9, 7, 17, 30))
      ];
      ListInitState state = ListInitState();
      state.elements = this._elements;
      emit(state);
    });
    on<ListElementAddedEvent>((event, emit){
      this._elements!.add((event.element as ExamApplication));
      emit(ListElementsState(elements: this._elements));
      print("added");
      print(event.element);
    });
    on<ListElementDeletedEvent>((event, emit){
      this._elements!.remove(event.element);
      if(this._elements!.length > 0){
        emit(ListElementsState(elements: this._elements));
      }
      else{
        emit(ListEmptyState());
      }
    });
  }
}

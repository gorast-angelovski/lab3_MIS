import '../exam.dart';

abstract class ListState {}

class ListInitState extends ListElementsState {
  ListInitState() {
    elements = [];
  }
}

class ListEmptyState extends ListState {}

class ListElementsState extends ListState {
  late List<ExamApplication> elements;
  ListElementsState({elements});
}

class ListError extends ListState{
  final error;
  ListError({this.error});
}
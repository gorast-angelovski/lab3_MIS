import '../exam.dart';

abstract class ListEvent{}

class ListInitializedEvent extends ListEvent {}

class ListElementAddedEvent extends ListEvent {
  final ExamApplication element;
  ListElementAddedEvent({required this.element});
}

class ListElementDeletedEvent extends ListEvent {
  final ExamApplication element;
  ListElementDeletedEvent({required this.element});
}
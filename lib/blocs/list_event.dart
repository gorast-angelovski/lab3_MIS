import '../exam.dart';

abstract class ListEvent{}

class ListInitializedEvent extends ListEvent {}

class ListElementAddedEvent extends ListEvent {
  final ExamApplication? element;
  ListElementAddedEvent({this.element});
}

class ListElementDeletedEvent extends ListEvent {
  final ExamApplication? element;
  ListElementDeletedEvent({this.element});
}
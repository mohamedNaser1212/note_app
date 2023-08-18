part of 'search_note_cubit.dart';

@immutable
abstract class SearchNoteState {}

class SearchNoteInitial extends SearchNoteState {}
class SearchNoteNoResults extends SearchNoteState {}
class SearchNoteFailure extends SearchNoteState {
  final String message;
  SearchNoteFailure({required this.message});
}
class SearchNoteSuccess extends SearchNoteState {
  final List<NoteModel> searchResults;
  SearchNoteSuccess({required this.searchResults});
}

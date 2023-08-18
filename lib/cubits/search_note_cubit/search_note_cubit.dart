import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';

part 'search_note_state.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit({required this.notes}) : super(SearchNoteInitial());

  final List<NoteModel> notes;
  List<NoteModel>? searchResults;

  searchNotesByTitle(String query) async {
    if (query.isEmpty) {
      emit(SearchNoteNoResults());
      return;
    }

    searchResults = notes.where((note) =>
        note.title.toLowerCase().contains(query.toLowerCase())).toList();

    if (searchResults != null && searchResults!.isNotEmpty) {

      emit(SearchNoteSuccess(searchResults: searchResults!));
    } else {
      emit(SearchNoteNoResults());
    }
  }
}

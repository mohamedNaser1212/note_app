import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  List<NoteModel>? searchResults;

  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(KNotesBox);
    notes = notesBox.values.toList();
    searchResults = notes; // Initialize searchResults with the main notes list
    emit(NotesSuccess());
  }

  searchNotesByTitle(String query) {
    if (query.isEmpty) {
      searchResults = notes; // Reset search results to main notes list
    } else {
      searchResults = notes?.where((note) =>
          note.title.toLowerCase().contains(query.toLowerCase())).toList();
    }

    emit(NotesSuccess());
  }
  void updateNoteInList(NoteModel editedNote) {
    final index = notes?.indexWhere((note) => note.key == editedNote.key);
    if (index != null && index >= 0) {
      notes![index] = editedNote;
      emit(NotesSuccess());
    }
  }
}

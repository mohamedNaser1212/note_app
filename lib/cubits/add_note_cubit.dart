import 'package:bloc/bloc.dart';
import 'package:flutter/Material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(KNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}

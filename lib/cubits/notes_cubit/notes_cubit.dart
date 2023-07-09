import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() async {
    emit(NotesLoading());
  try {
    var notesBox = Hive.box<NoteModel>(KNotesBox);

    List <NoteModel> notes=notesBox.values.toList();
    emit(NotesSuccess(notes));
  } on Exception catch (e) {
    emit(NotesFailure(e.toString()));
  }}
}

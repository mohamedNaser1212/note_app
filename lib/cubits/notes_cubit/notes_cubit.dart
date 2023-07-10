import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
List<NoteModel>?notes;
  fetchAllNotes() async {
    // emit(NotesLoading());

    var notesBox = Hive.box<NoteModel>(KNotesBox);
    notes=notesBox.values.toList();
    emit(NotesSuccess());
 }
}

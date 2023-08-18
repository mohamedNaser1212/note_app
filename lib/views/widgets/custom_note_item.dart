import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../../models/note_model.dart';
import '../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.title.toString()), // Unique key for each note
      direction: DismissDirection.horizontal, // Only allow horizontal swipes
      onDismissed: (direction) {
        // Delete the note and fetch updated notes
        note.delete();
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();

        // Show a snackbar to notify the user about the deletion
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Note deleted'),
            duration: Duration(seconds: 1),

          ),
        );
      },
      background: Container(
        color: Colors.brown,
        alignment: Alignment.centerRight ,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.white,
          size: 24,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }));
        },
        child: Container(
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 10),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: Text(
                    note.subtitle,
                    style: TextStyle(
                        fontSize: 18, color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

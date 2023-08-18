import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/search_note_cubit/search_note_cubit.dart';
import '../../models/note_model.dart';
import '../edit_note_view.dart';
import 'custom_note_item.dart';

class SearchPage extends StatelessWidget {
  final List<NoteModel>
      yourNotesList; // Replace this with your actual notes list

  SearchPage({required this.yourNotesList});

  @override
  Widget build(BuildContext context) {
    // Create an instance of SearchNoteCubit with yourNotesList
    var searchNoteCubit = SearchNoteCubit(notes: yourNotesList);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Notes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                searchNoteCubit.searchNotesByTitle(query);
              },
              decoration: const InputDecoration(
                labelText: 'Search by Title',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          BlocProvider<SearchNoteCubit>.value(
            value: searchNoteCubit, // Provide the created cubit
            child: BlocBuilder<SearchNoteCubit, SearchNoteState>(
              builder: (context, state) {
                if (state is SearchNoteFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is SearchNoteSuccess) {
                  final searchResults = state.searchResults;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final note = searchResults[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical spacing
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return EditNoteView(
                                    note: note,
                                  );
                                }));
                              },
                              child: NoteItem(note: note),
                            ),
                          );
                        },
                      )
                    ),
                  );
                } else if (state is SearchNoteNoResults) {
                  return const Center(
                    child: Text('No matching results.'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddNotesState{
}
class AddNotesInitial extends AddNotesState{}
class AddNotesLoading extends AddNotesState{}
class AddNotesSuccess extends AddNotesState{}
class AddNotesFailure extends AddNotesState{
  String message;

  AddNotesFailure(this.message);
}
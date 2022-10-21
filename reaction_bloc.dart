import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_chat/bloc/reaction_states.dart';
import 'package:oranos_chat/data/reaction_model.dart';

class ReactionCubit extends Cubit<ReactionStates> {
  ReactionCubit() : super(ReactionInitialState());
  static ReactionCubit get(context) => BlocProvider.of(context);

  Map<int, ReactionModel> reactionList = {
    1: ReactionModel(reactionId: 1, isFavourite: false),
    2: ReactionModel(reactionId: 2, isFavourite: false)
  };

  void changeToFavourite({required int id}) {
    reactionList[id]!.isFavourite = !reactionList[id]!.isFavourite;
    //reactionList.add(ReactionModel(reactionId: id, isFavourite: true));
    emit(ReactionChangeState());
  }
}

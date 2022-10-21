abstract class ReactionStates {}

class ReactionInitialState extends ReactionStates {}

class ReactionChangeState extends ReactionStates {}

class ReactionErrorState extends ReactionStates {
  final String error;
  ReactionErrorState(this.error);
}

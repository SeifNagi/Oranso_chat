import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_chat/bloc/reaction_states.dart';
import 'package:oranos_chat/presentation/style/color.dart';

import '../../../../bloc/reaction_bloc.dart';
import '../../../../data/dome_data.dart';
import '../../../style/text_style.dart';
import '../../../widget/customized_text.dart';

class RecomendedExpertsContainer extends StatelessWidget {
  const RecomendedExpertsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => ReactionCubit(),
        child: Builder(
          builder: (context) {
            ReactionCubit reactionCubit = ReactionCubit.get(context);
            return SizedBox(
                height: height / 3,
                width: width,
                child: ListView.builder(
                  itemCount: recomendedExperts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 1.0,
                                    offset: Offset.fromDirection(120.0))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.asset(
                                          '${recomendedExperts[index]['profile_image']}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BlocConsumer<ReactionCubit,
                                        ReactionStates>(
                                      listener: (context, state) {},
                                      builder: (context, state) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  CustomizedText(
                                                    textContent:
                                                        '${recomendedExperts[index]['rate']}',
                                                    textStyle: blackSmallText,
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    reactionCubit
                                                        .changeToFavourite(
                                                            id: recomendedExperts[
                                                                index]['id']);
                                                  },
                                                  icon: const Icon(
                                                      Icons.favorite),
                                                  color: reactionCubit
                                                          .reactionList.isEmpty
                                                      ? Colors.grey
                                                      : reactionCubit
                                                              .reactionList[
                                                                  recomendedExperts[
                                                                          index]
                                                                      ['id']]!
                                                              .isFavourite
                                                          ? Colors.red
                                                          : lightGreyColor)
                                            ],
                                          ),
                                          CustomizedText(
                                              textContent:
                                                  recomendedExperts[index]
                                                      ['name']),
                                          CustomizedText(
                                              textContent:
                                                  recomendedExperts[index]
                                                      ['position'])
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}

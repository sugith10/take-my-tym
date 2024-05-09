import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_title_box_widget.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/submit_button.dart';
import '../bloc/submit_proposal_bloc/submit_proposal_bloc.dart';


class ProposalMessage extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback callback;
  final FocusNode focusNode;
  final SubmitProposalBloc bloc;

  const ProposalMessage({
    required this.callback,
    required this.focusNode,
    required this.controller,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: HomePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            AppTitleBoxWidget(
              title: "Why hire you?",
              child: SizedBox(
                height: 100.h,
                child: SingleChildScrollView(
                  child: TextField(
                    focusNode: focusNode,
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Tell the hirer why you're a good fit.",
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    maxLines: null,
                    style: Theme.of(context).textTheme.labelMedium,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Note: Before commit with any contract make sure you reachout contracter and verified the source.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: SubmitButton(
                    backgroundColor: AppDarkColor.instance.success,
                    foregroundColor: AppDarkColor.instance.primaryText,
                    callback: () {
                      focusNode.unfocus();
                      callback();
                    },
                    text: 'Submit',
                    child: BlocBuilder(bloc: bloc,
                    builder: (context,state){
                      if(state is SubmitProposalLoadingState){
                        return const CircularProgressIndicator();
                      }
                      return const Text("Submit");
                    },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
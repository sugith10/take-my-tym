import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class ProfileWidget extends StatelessWidget {
  final String picture;
  const ProfileWidget({
    required this.picture,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: SizedBox(
        child: Row(
          children: [
            const CircleProfilePicWidget(
              height: 80,
              width: 80,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<AppUserBloc>().userModel!.firstName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.read<AppUserBloc>().userModel!.email,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

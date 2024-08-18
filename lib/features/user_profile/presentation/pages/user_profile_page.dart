import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/bloc/authentication_bloc.dart';
import '../bloc/user_profile_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  final TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is! UserProfileLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final userProfile = state.user;
          final nickname = userProfile?.nickname ?? 'Unknown User';
          final pictureUrl = userProfile?.pictureUrl ?? '';

          return Scaffold(
            appBar: _appBar(nickname, pictureUrl, context),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: (kIsWeb)
                          ? Text(
                        'Use the "--web-renderer=html" option\n to show the picture avatar properly',
                        textAlign: TextAlign.center,
                      )
                          : SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Table(
                        border: TableBorder.all(),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(5),
                        },
                        children: [
                          TableRow(children: [
                            _paddedWidget(_boldText('Email')),
                            _paddedWidget(Text('${userProfile?.email ?? 'N/A'}')),
                          ]),
                          TableRow(children: [
                            _paddedWidget(_boldText('Name')),
                            _paddedWidget(Text('${userProfile?.name ?? 'N/A'}')),
                          ]),
                          TableRow(children: [
                            _paddedWidget(_boldText('Picture')),
                            _paddedWidget(Container(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                radius: 16,
                                child: ClipOval(
                                  child: Image.network(
                                    pictureUrl,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            _paddedWidget(_boldText('Nickname')),
                            _paddedWidget(Text(nickname)),
                          ]),
                          TableRow(children: [
                            _paddedWidget(_boldText('IsEmailVerified')),
                            _paddedWidget(Text('${userProfile?.isEmailVerified ?? 'N/A'}')),
                          ]),
                          TableRow(children: [
                            _paddedWidget(_boldText('UpdatedAt')),
                            _paddedWidget(Text('${userProfile?.updatedAt ?? 'N/A'}')),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _paddedWidget(Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget,
    );
  }

  Widget _boldText(String text) {
    return Text(text, style: _textStyle);
  }

  AppBar _appBar(String nickname, String pictureUrl, BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
        radius: 12, // Smaller size for the avatar
        backgroundImage: pictureUrl.isNotEmpty
            ? NetworkImage(pictureUrl)
            : const AssetImage('assets/img/profile_img.png') as ImageProvider,
      ),
      title: Text(nickname, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.orange,
      actions: [

        IconButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(LogOut());
          },
          icon: const Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }
}

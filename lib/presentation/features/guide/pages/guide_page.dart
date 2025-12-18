import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istanbulguidetwo/core/config/theme/app_colors.dart';
import '../../../../service_locator.dart';
import '../bloc/guide_cubit.dart';
import '../bloc/guide_state.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GuideCubit>(),
      child: const GuideView(),
    );
  }
}

class GuideView extends StatefulWidget {
  const GuideView({super.key});

  @override
  State<GuideView> createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Ben');
  final ChatUser _aiUser = ChatUser(
    id: '2',
    firstName: 'Istanbul Guide',
    profileImage: "assets/images/avatar.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Istanbul Guide"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<GuideCubit, GuideState>(
        builder: (context, state) {
          if (state is GuideError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          if (state is GuideLoaded) {
            final List<ChatMessage> messages = state.messages.map((e) {
              return ChatMessage(
                text: e.text,
                user: e.isUser ? _currentUser : _aiUser,
                createdAt: e.createdAt,
              );
            }).toList();

            return DashChat(
              currentUser: _currentUser,
              messages: messages,
              onSend: (ChatMessage m) {
                context.read<GuideCubit>().sendMessage(m.text);
              },
              typingUsers: state.isTyping ? [_aiUser] : [],
              inputOptions: const InputOptions(
                inputTextStyle: TextStyle(color: Colors.black),
                sendOnEnter: true,
              ),
              messageOptions: MessageOptions(
                avatarBuilder: (ChatUser user, Function? onPress, Function? onLongPress) {
                  if (user.id == _aiUser.id) {
                    return Padding(
                      padding: EdgeInsets.only(right: 5.w, left: 8.w,),
                      child: Container(
                        width: 45.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(user.profileImage ?? ''),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.transparent,

                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                currentUserContainerColor: AppColors.x,
                containerColor: AppColors.primary,
                textColor: AppColors.textColor,
                currentUserTextColor: Colors.white,
                showTime: true,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
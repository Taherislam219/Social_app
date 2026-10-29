import 'package:first_app/components/app_text_field.dart';
import 'package:first_app/components/toolbar.dart';
import 'package:first_app/components/user_avatar.dart';
import 'package:first_app/config/app_strings.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

enum Gender { none, male, female, others }

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Gender gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: AppStrings.editProfile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    UserAvatar(),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              AppTextField(hint: AppStrings.firstName),

              const SizedBox(height: 16),
              AppTextField(hint: AppStrings.lastName),

              const SizedBox(height: 16),
              AppTextField(hint: AppStrings.phoneNumber),

              const SizedBox(height: 16),
              AppTextField(hint: AppStrings.location),

              const SizedBox(height: 16),
              AppTextField(hint: AppStrings.birthday),

              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: AppColors.fieldColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: const Text(
                        AppStrings.gender,

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<Gender>(
                            title: const Text('Male'),
                            value: Gender.male,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            contentPadding: EdgeInsets.zero,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ),

                        Expanded(
                          child: RadioListTile<Gender>(
                            title: const Text('Female'),
                            value: Gender.female,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            contentPadding: EdgeInsets.zero,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ),

                        Expanded(
                          child: RadioListTile<Gender>(
                            title: const Text('Others'),
                            value: Gender.others,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            contentPadding: EdgeInsets.zero,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

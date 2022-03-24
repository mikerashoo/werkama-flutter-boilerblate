import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:werkama_flutter_setup/components/custom_title.dart';
import 'package:werkama_flutter_setup/components/error_message_box.dart';
import 'package:werkama_flutter_setup/models/users_response.dart';
import 'package:werkama_flutter_setup/providers/app_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.textToShow}) : super(key: key);
  static const routeName = '/second_screen';
  final String textToShow;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isLoading = true;
  bool hasError = false;
  UsersResponseData? usersData;

  @override
  void initState() {
    super.initState();
    initializeScreen();
  }

  /// show loading
  /// remove error incase you click on retry user should not see error message
  /// fetch users
  /// if response is as expected show data else show error screen
  initializeScreen() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);

    dynamic fetchUsersResponse = await appProvider.fetchUsers();
    if (fetchUsersResponse is UsersResponseData) {
      setState(() {
        isLoading = false;
        hasError = false;
        usersData = fetchUsersResponse;
      });
    } else {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second screen'),
        ),
        body: SafeArea(
            child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : hasError
                        ? ErrorTryAgainBox(
                            onTryAgain: initializeScreen,
                          )
                        : SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CustomTitle(
                                      title: 'Fetched users :',
                                    ),
                                    ListView.builder(
                                        itemCount: usersData!.data!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext buildContext, index) {
                                          User _user =
                                              usersData!.data!.elementAt(index);
                                          return Card(
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      '${_user.firstname} ${_user.lastname}'),
                                                  Text('${_user.email}'),
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                  ]),
                            ),
                          ))));
  }
}

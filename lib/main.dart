import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

String appID = "8ced4f18da7747659a9d0fb30393bd6d";

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
    agoraConnectionData: AgoraConnectionData(
        appId: appID, channelName: "test", username: "user"),
  );
  // Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
              ),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }
}

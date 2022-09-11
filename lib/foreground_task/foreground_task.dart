//
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';
//
// Future<void> initForegroundTask() async {
//   await FlutterForegroundTask.init(
//     androidNotificationOptions: AndroidNotificationOptions(
//       channelId: 'notification_channel_id',
//       channelName: 'Foreground Notification',
//       channelDescription: 'This notification appears when the foreground service is running.',
//       channelImportance: NotificationChannelImportance.LOW,
//       priority: NotificationPriority.LOW,
//       iconData: const NotificationIconData(
//         resType: ResourceType.mipmap,
//         resPrefix: ResourcePrefix.ic,
//         name: 'launcher',
//       ),
//       buttons: [
//         const NotificationButton(id: 'sendButton', text: 'Send'),
//         const NotificationButton(id: 'testButton', text: 'Test'),
//       ],
//     ),
//     iosNotificationOptions: const IOSNotificationOptions(
//       showNotification: true,
//       playSound: false,
//     ),
//     foregroundTaskOptions: const ForegroundTaskOptions(
//       interval: 5000,
//       autoRunOnBoot: true,
//       allowWifiLock: true,
//     ),
//     printDevLog: true,
//   );
// }

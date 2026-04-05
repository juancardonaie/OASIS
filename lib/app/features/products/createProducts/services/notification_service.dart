import 'package:signalr_netcore/signalr_client.dart';
import 'package:http/http.dart' as http;

class NotificationService {

  static final NotificationService _instance = NotificationService._internal();

  //Este constructor especial devuelve una instancia ya existente, no crea una nueva.
  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();
  
  late HubConnection hubConnection; //Este es el Websocket
  final url = 'https://imaginary-huffier-thuy.ngrok-free.dev/notifications';
  final urlApi = 'https://imaginary-huffier-thuy.ngrok-free.dev/api/Notification/Send';

  Function(String message)? onMessage;


  Future<void> startConnection() async{
    hubConnection = HubConnectionBuilder()
      .withUrl(url)
      .build();

    await hubConnection.start();

    listenNotification();

    // print('Conexión abierta');
  }

  Future<void> sendNotification() async{
    final response = await http.post(
      Uri.parse(urlApi),
    );

    if(response.statusCode != 200){
      throw Exception('Error enviando notificación.');
    }
  }

  void listenNotification(){
    hubConnection.on('ReceiveNotification', (args){
      final message = args?[0]?.toString();
      // print('Notificación: ${message}');

      if(onMessage != null && message != null){
        onMessage!(message);
      }

    });
  }

 
}

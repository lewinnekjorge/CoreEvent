class UserStatus {
  String picUrl;
  String title;
  String message;
  //String message = '';
  //String? dbRef;

  UserStatus({
    //required this.picUrl,
    required this.picUrl,
    required this.title,
    required this.message,
    //this.dbRef,
  });

  factory UserStatus.fromJson(Map<String, dynamic> map) {
    final data = map["data"];
    return UserStatus(
        //picUrl: data['picUrl'],
        title: data['name'],
        picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
        message: data['message']);
        //dbRef: map['ref']);
  }

//   Map<String, dynamic> toJson() {
//     return {
//       //"picUrl": picUrl,
//       "name": title,
//       "email": 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
//       "message": message
//       //"timestamp": Timestamp.now(),
//     };
//   }
}

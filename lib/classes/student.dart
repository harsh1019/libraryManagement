class Student {
  String name;
  String adminNo;
  String email;
  String contactNo;
  Student(
      {required this.name,
      required this.adminNo,
      required this.email,
      required this.contactNo});
  Student.fromJason(Map<String, String> json)
      : name = json["name"].toString(),
        contactNo = json["contactNo"].toString(),
        email = json["email"].toString(),
        adminNo = json["adminNo"].toString().toUpperCase();
}

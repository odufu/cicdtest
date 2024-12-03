class Property {
  //BASIC DETAILS
  final String title;

  final String details;
  final String location;
  final String propType; // Appartment, Store, Office

  //MEDIA
  List<String>? images = [];
  String? video = "";

  double price = 0;
  bool? isPooled = false;
  bool? isTaken = false;

  //FEATURES
  bool? eletricity = true;
  bool? security = true;
  bool? water = true;

  int? bedrooms;
  int? bathrooms;

  //PAYMENTS
  String? paymentPlan = "Outright"; //Weekly, Monthly, yearly
  double? upFront = 0;
  String? nextPaymentDueDate;
  List<Pool>? pools = [];

  //OFFICIAL DOCUMENTS
  bool? registeredSurvey = true;
  bool? governmentAproved = true;
  List<String>? documents = [];

  //Property Documents
  String? siteMap = "";
  String? housePlan = "";

  Property({
    //BASIC DETAILS
    required this.title,
    required this.price,
    required this.details,
    required this.location,
    required this.propType,
    this.isPooled,
    this.isTaken,
    //MEDIA
    this.images,
    this.video,

    //FEATURES
    this.eletricity,
    this.water,
    this.security,
    this.bedrooms,
    this.bathrooms,

    //PAYMENTS
    this.paymentPlan,
    this.upFront,
    this.nextPaymentDueDate,
    this.pools,

    //PRICES

    //official documents
    this.registeredSurvey,
    this.governmentAproved,
    this.documents,

    //property documents
    this.housePlan,
    this.siteMap,
  });
}

class Pool {
  String? owner = "";
  bool? isTaken = false;
  double? price = 0;
  double? equity = 0;
  final String date;
  Pool({
    this.owner,
    this.isTaken,
    this.price,
    this.equity,
    required this.date,
  });
}

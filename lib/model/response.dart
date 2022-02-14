// class Address {
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;

//   Address({this.street, this.suite, this.city, this.zipcode, this.geo});

//   Map<String, dynamic> toJson(Address address) {
//     return {
//       'street': address.street,
//       'suite': address.suite,
//       'geo': address.geo.toJson()
//     };
//   }

//   Address fromJson(Map<String, dynamic> json) {
//     return Address(
//         street: json['street'],
//         suite: json['suite'],
//         city: json['city'],
//         geo: json['geo']);
//   }

//   @override
//   String toString() {
//     return 'Street: $street';
//   }
// }

// class Geo {
//   String? lat;
//   String lng;
//   Geo({this.lat, required this.lng});
//   Map<String, dynamic> toJson(Geo geo) {
//     return {
//       'lat': geo.lat,
//       'lng': geo.lng,
//     };
//   }

//   Geo fromJson(Map<String, dynamic> json) {
//     return Geo(
//       lat: json['lat'],
//       lng: json['lng'],
//     );
//   }
// }

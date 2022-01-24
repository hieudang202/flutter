
class Coupon{
  final String id;
  final String Description;
  final String StartDate;
  final String EndDate;
  final String UPCCode;
  final int DiscountType;
  final String DiscountValue;



  Coupon.fromJson(Map json):
        id = json["Id"],
        Description = json["FirstName"],
        StartDate = json["LoyaltyId"],
        EndDate = json["Phone"],
        UPCCode = json["Email"],
        DiscountType = json["Point"],
        DiscountValue = json["Currency"];
}
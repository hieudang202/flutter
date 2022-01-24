
class gift {
  final String IdGroupProduct;
  final String DescriptionProductGroup;
  final String IdProduct;
  final String Description;
  final String Status;
  final String UPC;
  final int DefaultExpiryPeriod;//thoi gian het han
  final double Total;

  gift.fromJson(Map json):
      IdGroupProduct = json["IdGroupProduct"],
      DescriptionProductGroup = json["DescriptionProductGroup"],
      IdProduct = json["IdProduct"],
      Description = json["Description"],
      Status = json["Status"],
      UPC = json["UPC"],
      DefaultExpiryPeriod = json["DefaultExpiryPeriod"],
      Total = json["Total"];
}
class DsGift {
  final List<gift> Gift;
  DsGift.fromJson(Map json):
        Gift = (json['Gifts'] as List).map((G) => gift.fromJson(G)).toList();
}
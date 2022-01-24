class BonusBuy{
  final String idBonus;
  final String nameBonnus;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String discountPercent;
  final String nameStore;
  final String nameStoreGroup;
  final String nameLoyaty;

  BonusBuy({
  this.idBonus,
  this.nameBonnus,
  this.startDate,
  this.endDate,
  this.startTime,
  this.endTime,
  this.discountPercent,
  this.nameStore,
  this.nameStoreGroup,
  this.nameLoyaty});

  factory BonusBuy.fromJson(Map<String, dynamic> json){
    return BonusBuy(
        idBonus: json["IdBonus"],
        nameBonnus: json["NameBonnus"],
        startDate: json["StartDate"],
        endDate: json["EndDate"],
        startTime: json["StartTime"],
        endTime: json["EndTime"],
        discountPercent: json["DiscountPercent"],
        nameStore: json["NameStore"],
        nameStoreGroup: json["NameStoreGroup"],
        nameLoyaty: json["NameLoyaty"]
    );
  }
}

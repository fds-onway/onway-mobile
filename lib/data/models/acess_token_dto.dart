class AcessTokenDto {
  final String accessToken;
  final DateTime expirationDate;

  AcessTokenDto({
    required this.accessToken,
    required this.expirationDate,
  });

  AcessTokenDto.fromJson(Map<String, dynamic> json)
    : accessToken = json['accessToken'],
      expirationDate = DateTime.parse(json['expirationDate']);

  bool get isValid {
    return DateTime.now().isBefore(expirationDate);
  }
}

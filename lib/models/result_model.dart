class ResultModel {
  double areaFloor;
  int piecesByWidth;
  int piecesByLength;
  double unitPrice;

  ResultModel({
    this.areaFloor,
    this.piecesByWidth,
    this.piecesByLength,
    this.unitPrice,
  });

  get amountPieces => piecesByWidth * piecesByLength;
  get amountFooter => piecesByWidth + piecesByLength;
  get amountPiecesAndFooter => amountPieces + amountFooter;
  get areaWithoutFooter => amountPieces * areaFloor;
  get areaWithFooter => amountPiecesAndFooter * areaFloor;
  get totalPrice => unitPrice * amountPiecesAndFooter;
}

import 'dart:developer';
import 'package:conx/pages/search/model_search/model_for_search.dart';

class SearchWithModel {
  static String getLinkSearch({required ModelOrderList99 m}) {
    String data = "";
    try {
      if (m.search.toString() != "null" && m.search.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&search=${m.search}";
        } else {
          data = "search=${m.search}";
        }
      }

      if (m.weightFrom.toString() != "null" &&
          m.weightFrom.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&weight_from=${m.weightFrom}";
        } else {
          data = "weight_from=${m.weightFrom}";
        }
      }

      if (m.weightTo.toString() != "null" && m.weightTo.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&weight_to=${m.weightTo}";
        } else {
          data = "weight_to=${m.weightTo}";
        }
      }
      if (m.locationFrom.toString() != "null" &&
          m.locationFrom.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&location_from=${m.locationFrom}";
        } else {
          data = "location_from=${m.locationFrom}";
        }
      }
      if (m.locationTo.toString() != "null" &&
          m.locationTo.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&location_to=${m.locationTo}";
        } else {
          data = "location_to=${m.locationTo}";
        }
      }
      if (m.volumeFrom.toString() != "null" &&
          m.volumeFrom.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&volume_from=${m.volumeFrom}";
        } else {
          data = "volume_from=${m.volumeFrom}";
        }
      }
      if (m.volumeTo.toString() != "null" && m.volumeTo.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&volume_to=${m.volumeTo}";
        } else {
          data = "volume_to=${m.volumeTo}";
        }
      }
      if (m.dateFrom.toString() != "null" && m.dateFrom.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&date_from=${m.dateFrom}";
        } else {
          data = "date_from=${m.dateFrom}";
        }
      }
      if (m.dateTo.toString() != "null" && m.dateTo.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&date_to=${m.dateTo}";
        } else {
          data = "date_to=${m.dateTo}";
        }
      }
      if (m.typePayment.toString() != "null" &&
          m.typePayment.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&type_payment=${m.typePayment}";
        } else {
          data = "type_payment=${m.typePayment}";
        }
      }
      if (m.priceFrom.toString() != "null" &&
          m.priceFrom.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&price_from=${m.priceFrom}";
        } else {
          data = "price_from=${m.priceFrom}";
        }
      }
      if (m.priceTo.toString() != "null" && m.priceTo.toString().isNotEmpty) {
        if (data.isNotEmpty) {
          data = "$data&price_to=${m.priceTo}";
        } else {
          data = "price_to=${m.priceTo}";
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return data;
  }
}

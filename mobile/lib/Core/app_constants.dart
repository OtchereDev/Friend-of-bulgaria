const String paymentUrl =
    "https://q85wmohwmg.execute-api.eu-west-2.amazonaws.com/v1";
const String baseUrl = "http://18.170.226.199";
// final String kBaseUrlV2 = url.baseV2;
// final String kParcel = url.parcelUrl; fuel-ms.test.oyaghana.com
// final String kHiringUrl = url.hiringUrl;
// final String kBaseUrlWeb = url.web;
// final String kUnAuthenticatedBaseUrl = url.unAuthenticatedBase;
const String kGoogleApiKey = "AIzaSyC5Boj4dIR3QYo4ezPgwFZVDsMHDaRVR28";

//"AIzaSyCcGeOs6pbNgrCSvMarV34r0Oit6eEewtw";

// hardedCoded Salt
const kSalt = "salt_for_encoding";
const whitelogo = "assets/images/logo_text.png";
const logo = "assets/images/logo.png";
const getstartedImage = "assets/images/getstarted.png";

List<Map<String, dynamic>> buttonName = [
  {"title": "Patient", "icon": "assets/icons/user.svg"},
  {"title": "Doctor", "icon": "assets/icons/doc.svg"}
];

const DETAILS =
    "You are invited to the Friends of Bulgaria TRADITIONAL CHARITY CHRISTMAS PARTY Thursday- 1 December 2022, 7 – 11pm at the Bulgarian Embassy186-188 Queen’s Gate, London SW7 5HLfrom 7.00pm to 10.00pm by kind permission of Patron His Excellency the Ambassador of Bulgaria Marin Raykov in the presence of Honorary Patrons, Prince Kyril Saxe-Coburg and Prince Boris Tirnovski with Project Partners Darina Rykova and Borislava Cherkezova, Karin Dom and Charlotte Heyley, ZOV DRINKS – BULGARIAN BUFFET DINNER – MUSICAL ENTERTAINMENT Bulgarian dinner prepared this year by Chef Asen Ibrov";

Map<String, dynamic> getOrderParams(
    {required String itemName,
    quantity,
    itemPrice,
    currency,
    totalPrice,
    description,
    title,
    userName,
    location}) {
  // checkout invoice details

  Map<String, dynamic> temp = {
    "intent": "sale",
    "payer": {"payment_method": "paypal"},
    "transactions": [
      {
        "amount": {
          "total": totalPrice,
          "currency": currency,
          "details": {
            "subtotal": "30.00",
            "tax": "0.00",
            "shipping": "0.00",
            "handling_fee": "0.00",
            "shipping_discount": "-1.00",
            "insurance": "0.01"
          }
        },
        "description": "The payment transaction description.",
        "custom": "EBAY_EMS_90048630024435",
        "invoice_number": "48787589673",
        "payment_options": {"allowed_payment_method": "INSTANT_FUNDING_SOURCE"},
        "soft_descriptor": "ECHI5786786",
        "item_list": {
          "items": [
            {
              "name": title,
              "description": description,
              "quantity": quantity,
              "price": itemPrice,
              "tax": "0.00",
              "sku": "1",
              "currency": currency
            },
          ],
          "shipping_address": {
            "recipient_name": userName,
            "line1": location,
            "line2": "Unit #34",
            "city": "San Jose",
            "country_code": "UK",
            "postal_code": "95131",
            "phone": "011862212345678",
            "state": "CA"
          }
        }
      }
    ],
    "note_to_payer": "Contact us for any questions on your order.",
    "redirect_urls": {
      "return_url": "https://example.com/return",
      "cancel_url": "https://example.com/cancel"
    }
  };
  return temp;
}

List months = [
  'jan',
  'feb',
  'mar',
  'apr',
  'may',
  'jun',
  'jul',
  'aug',
  'sep',
  'oct',
  'nov',
  'dec'
];

List<Map<String, dynamic>> data = [
  {
    "image": "assets/images/1.png",
    "title": "Keep the children smiling",
    "desc":
        "Your presence is very much appreciated in keeping our children happy"
  },
  {
    "image": "assets/images/2.png",
    "title": "Pay for your event tickets",
    "desc":
        "Use our PayPal checkout to send buy your event tickets without any hassle"
  },
  {
    "image": "assets/images/3.png",
    "title": "Get event notifications",
    "desc": "Stay on top of all our events as and when they happen"
  },
];

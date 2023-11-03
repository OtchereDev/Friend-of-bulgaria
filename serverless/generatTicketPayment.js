import axios from "axios";
import * as qs from "qs";

const { PAYPAL_CLIENT_ID, PAYPAL_CLIENT_SECRET, PAYPAL_API } = process.env;
const base = PAYPAL_API;

async function generateAccessToken() {
  try {
    if (!PAYPAL_CLIENT_ID || !PAYPAL_CLIENT_SECRET) {
      throw new Error("MISSING_API_CREDENTIALS");
    }
    const auth = Buffer.from(
      PAYPAL_CLIENT_ID + ":" + PAYPAL_CLIENT_SECRET
    ).toString("base64");

    console.log(qs);
    const response = await axios.post(
      `${base}/v1/oauth2/token`,
      // { body: 'grant_type=client_credentials' },
      qs.stringify({ grant_type: "client_credentials" }),
      {
        headers: {
          Authorization: `Basic ${auth}`,
          "Content-Type": "application/x-www-form-urlencoded",
        },
      }
    );

    const data = await response.data;
    console.log(data);
    return data.access_token;
  } catch (error) {
    console.error("Failed to generate Access Token:", error);
  }
}

export const handler = async (event) => {
  const payment = JSON.parse(event.body);
  console.log("my paymet:", payment, typeof payment);

  const accessToken = await generateAccessToken();
  const url = `${base}/v2/checkout/orders`;
  const payload = {
    intent: "CAPTURE",
    purchase_units: [
      {
        amount: {
          currency_code: "GBP",
          value: (payment.ticketQuantity * payment.ticketPrice).toString(),
        },
      },
    ],
    payment_source: {
      paypal: {
        experience_context: {
          payment_method_preference: "IMMEDIATE_PAYMENT_REQUIRED",
          brand_name: "FRIENDS OF BULGARIA",
          locale: "en-GB",
          landing_page: "NO_PREFERENCE",
          shipping_preference: "NO_SHIPPING",
          user_action: "PAY_NOW",
          return_url: "https://example.com/returnUrl/?status=success",
          cancel_url: "https://example.com/cancelUrl",
        },
        email_address: payment.email,
        // address: {
        //   address_line_1: payment.address,
        // },
        phone: {
          phone_type: "MOBILE",
          phone_number: {
            national_number: payment.phone,
          },
        },
        name: {
          given_name: payment?.name?.split(" ")[0] ?? "",
          surname: payment?.name?.split(" ", 2)[1] ?? "",
        },
      },
    },
  };

  try {
    const response = await axios.post(url, payload, {
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${accessToken}`,
      },
    });

    const data = await response.data;

    return {
      body: JSON.stringify(data),
      statusCode: response.status,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "*",
      },
    };
  } catch (error) {
    return {
      body: error.response.data || error.message,
      statusCode: 500,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "*",
      },
    };
  }
};


var publicKey = 'pk_live_YOUR_PUBLIC_KEY';

var stripe = Stripe(publicKey);

var paymentRequest = stripe.paymentRequest({
 country: 'ES',
 currency: 'eur',
 total: {
   label: 'test',
   amount: 1000,
 },
 requestPayerName: true,
 requestPayerEmail: true,
});

paymentRequest.canMakePayment().then(function (result) {
 if (result) {
    var modal = {
        'possible': 'true',
    }
    window.parent.postMessage(modal,"*");
 } else {
   console.log('Google Pay support not found', result);
 }
});

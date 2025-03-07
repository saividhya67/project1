<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="payment.css" />
    <title>All gifts-Payment</title>
    <script>
        function validateForm() {
            var cardNumber = document.getElementById('card-number').value.trim();
            var expiryDate = document.getElementById('expiry-date').value.trim();
            var cvv = document.getElementById('cvv').value.trim();
            var cardHolder = document.getElementById('card-holder').value.trim();

            if (cardNumber === '' || !isValidCardNumber(cardNumber)) {
                alert('Please enter a valid card number');
                return false;
            }
            if (expiryDate === '' || !isValidExpiryDate(expiryDate)) {
                alert('Please enter a valid expiry date (DD-MM-YY)');
                return false;
            }
            if (cvv === '' || !isValidCVV(cvv)) {
                alert('Please enter a valid CVV number (3 digits)');
                return false;
            }
            if (cardHolder === '') {
                alert('Please enter the card holder name');
                return false;
            }

            alert('Your order has been placed');
            return true;
        }

        function isValidCardNumber(cardNumber) {
            return /^\d{3}-\d{3}-\d{3}$/.test(cardNumber);
        }

        function isValidExpiryDate(expiryDate) {
            return /^\d{2}-\d{2}-\d{2}$/.test(expiryDate);
        }

        function isValidCVV(cvv) {
            return /^\d{3}$/.test(cvv);
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="main-content">
            <p class="text">Gifting</p>
        </div>

        <div class="centre-content">
            <h1 class="price">Payment<span>/-</span></h1>
            <p class="course">Products with reasonable prices and excellent quality</p>
        </div>

        <div class="last-content">
            <button type="button" class="pay-now-btn">Apply Coupons</button>
            <br><br>
            <button type="button" class="pay-now-btn">
                <img src="https://telugu.economictimes.com/thumb/msid-94681942,width-540,height-405,resizemode-75/paytm-logo-94681942.jpg" width="60" height="80" alt="Paytm Logo" />
            </button>
            <button type="button" class="pay-now-btn">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-gCS2hj5_Yn3m5KNYp09JXfHcuTWjrstpCg&s" width="60" height="80" alt="Google Pay Logo" />
            </button>
            <button type="button" class="pay-now-btn">
                <img src="https://pbs.twimg.com/profile_images/1615271089705463811/v-emhrqu_400x400.png" width="60" height="80" alt="PhonePe Logo" />
            </button>
        </div>

        <div class="card-details">
            <p>Pay using Credit or Debit card</p>

            <form action="PaymentServlet" method="post" onsubmit="return validateForm()">
                <div class="input-field">
                    <label for="card-number">Card Number</label>
                    <input type="text" id="card-number" name="cardNumber" class="card-number-field" placeholder="###-###-###" />
                </div>
                <div class="input-field">
                    <label for="expiry-date">Expiry Date</label>
                    <input type="text" id="expiry-date" name="expiryDate" class="date-number-field" placeholder="DD-MM-YY" />
                </div>
                <div class="input-field">
                    <label for="cvv">CVV Number</label>
                    <input type="text" id="cvv" name="cvv" class="cvv-number-field" placeholder="xxx" />
                </div>
                <div class="input-field">
                    <label for="card-holder">Card Holder Name</label>
                    <input type="text" id="card-holder" name="cardHolder" class="card-name-field" placeholder="Enter your Name" />
                </div>
                <button type="submit" class="submit-now-btn">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>

<div class="cartSummaryItem">{{itemCount}} item(s), Total {{currencyFormat}}{{totalAmount}}</div>
<div><a class="cartSummaryLink" href="{{cartUrl}}">View Cart</a></div>
<hr>
<div id="cart">
  <ul>
    {% for item in items %}
    <li>{{item | JSON}}</li>
    {% endfor %} 
  </ul>
</div>
<hr>
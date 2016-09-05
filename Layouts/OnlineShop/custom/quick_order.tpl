<div class="srSmallImage">
  {tag_smallimage}
</div>
<div class="srName">
  {tag_name}<span>{tag_productcode}</span>
</div>
<div id="catProdAttributes2_{{id}}" class="productAttributes">
{% for attribute in attributes -%}
  {% assign attributeName = attribute[0] -%}
  {% assign attributeOptions = attribute[1] -%}
  {% assign attributeType = attributeOptions[0].displayType -%}  
  {% case attributeType -%}
    {% when 5 -%}
      {%comment-%} ### Handle Dropdown Lists ###{%endcomment-%}
        <div class="catProductAttributeGroup" id="attribute-{{attributeName | strip | replace: ' ', '-' | downcase}}">
          <div class="catProdAttributeTitle">{{attributeName}}</div>
          <div class="catProdAttributeItem">
          <select mandatory="1" class="productAttribute">
            <option value="">-- Please Select --</option>
            {% for opt in attributeOptions -%}
            <option value="{{opt.id}}"{% if opt.price > 0 -%} data-price="{{opt.price}}"{% endif -%}{% if attributeName == "Wearing Length" and opt.name contains "Average" -%} selected{% endif -%}{% if attributeName == "Wearing Style" and forloop.index == 1 -%} selected{% endif -%}>{{opt.name}}{% if opt.price > 0 -%} +${{opt.price}}{% endif -%}</option>
            {% endfor -%}             
          </select>
          </div>
        </div>   
    {% when 6 -%}
      {%comment-%}### Handle Checkbox Lists ###{%endcomment-%}
      <div class="catProductAttributeGroup" id="attribute-{{attributeName | strip | replace: ' ', '-' | downcase}}">
        <div class="catProdAttributeTitle">{{attributeName}}</div>
        {% for opt in attributeOptions -%}
        <div class="catProdAttributeItem"><input class="productAttribute" type="checkbox" id="{{opt.id}}" name="{{attributeName | strip | replace: ' ', '-' | downcase}}"{% if opt.price > 0 -%} data-price="{{opt.price}}"{% endif -%} mandatory="1" /><span>{{opt.name}}{% if opt.price > 0 -%} +${{opt.price}}{% endif -%}</span></div>
        {% endfor -%}
      </div>          
    {% when 7 -%}
      {%comment-%}### Handle Radio Lists ###{%endcomment-%}
      <div class="catProductAttributeGroup" id="attribute-{{attributeName | strip | replace: ' ', '-' | downcase}}">
        <div class="catProdAttributeTitle">{{attributeName}}</div>
        {% for opt in attributeOptions -%}
        <div class="catProdAttributeItem"><input class="productAttribute" type="radio" id="{{opt.id}}" name="{{attributeName | strip | replace: ' ', '-' | downcase}}"{% if opt.price > 0 -%} data-price="{{opt.price}}"{% endif -%} mandatory="1" /><span>{{opt.name}}{% if opt.price > 0 -%} +${{opt.price}}{% endif -%}</span></div>
        {% endfor -%}
      </div>                
  {% endcase -%}   
{% endfor -%}             
</div>
<div class="price-box">
  <h4>Price {% if unitType != '' -%}<span>(Per {{unitType}})</span> {% endif -%}</h4>
  <p class="min-order">Minimum Order: <span>{tag_minunits} {% if unitType != '' and minUnits &gt; 1 -%}{{unitType | append: 's' }}{% endif -%}</span></p>
  {% if this.globals.user.isLoggedIn -%}
  <p class="price" id="product-price" data-base-price="{{salePrice}}">{tag_saleprice}</p>
  {% endif -%}
  <p class="qty" id="product-qty">Qty {tag_addtocartinputfield} {% if unitType != '' and minUnits &gt; 1 -%}<span>{{unitType | append: 's' }}</span><br> {% endif -%}</p>
  {% if this.globals.user.isLoggedIn -%}
  {tag_addtocart}
  {% endif -%}
</div>

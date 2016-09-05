<tr id="catProdAttributes2_{{id}}">
    <td class="productName">{{name}}</td>
    <td class="productImage">{% if smallImageUrl != "" -%}<img src="{{smallImageUrl}}" width="50" height="50" alt="{{name}}">{% endif -%}</td>                                
    <td class="productCode">{{productCode}}</td>
    <td class="productAttributes">
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
    </td>
    <td class="productMinOrder">{{minUnits}} {% if unitType != '' and minUnits &gt; 1 -%}{{unitType | append: 's' }}{% else -%}{{unitType}}{% endif -%}</td>
    <td class="productOrderQty">{tag_addtocartinputfield}</td>
    <td class="productPrice">{% if this.globals.user.isLoggedIn -%}{tag_saleprice}{% endif -%}</td>
    <td class="cartControls">{% if this.globals.user.isLoggedIn -%}{tag_addtocart}{% endif -%}</td>    
</tr>
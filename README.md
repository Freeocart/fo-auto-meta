# FO Auto meta

Create custom meta title/description with templates!

### How to template

Module uses just a simple interpolation for **product** and **category** pages - use `{{ name }}`, module will replace these tokens to `product_info` or `category_info` value.

**Product related variables:**

|variable|description|
|:---:|:---:|
|name|Product name|
|description|Product description (html)|
|meta_title|Meta title|
|meta_description|Meta description|
|meta_keyword|Meta keyword|
|tag|Product tags|
|model, sku, upc, ean, jan, isbn, mpn|Relevant product fields|
|location|Location field value|
|quantity|Quantity|
|stock_status|Stock status|
|manufacturer|Manufacturer|
|price|Product price|
|special|Product special price (if not set - empty)|
|weight, length, width, height|Relevant product fields|
|rating|Product rating|
|reviews|Product reviews count|
|viewed|Product views count|

**Category related variables:**

|variable|description|
|:---:|:---:|
|name|Category name|
|description|Category description|
|meta_title|Category meta title|
|meta_description|Category meta description|
|meta_keyword|Category meta keywords|


### Force replace all meta

By default, module do not replace meta fields, if they were filled before, but every template has an option to force replace meta value. So if you want to use only templated meta - use these checkboxes.

### Customize page title/description on default pages

With this module you also can change title/description of some default opencart pages, such as contacts, voucher, sitemap, shop rating, product special.

Also module can change title/description for faq pages, produced by [FAQ module](https://opencart2x.ru/moduli/vid/faq-accordion)
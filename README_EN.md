# FO Auto meta

Create custom meta title/description with templates!

### How to template

Module uses just a simple interpolation - use `{{ name }}`, module will replace these tokens to `product_info` or `category_info` value. For more info about these variables, check opencart models - `product` and `category`.

### Force replace all meta

By default, module do not replace meta fields, if they were filled before, but every template has an option to force replace meta value. So if you want to use only templated meta - use these checkboxes.
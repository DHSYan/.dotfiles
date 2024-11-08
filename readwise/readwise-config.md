# filename 
```md
readwise-{{category}}-{{title|replace(" ", "-")|lower()}}
```

# Page Title
```md
# {{ title }}
```

# Page Meta Data
```md
{% if image_url -%}
![rw-book-cover]({{image_url}})

{% endif -%}
## Metadata
- Author: {% if author %}[[{{author|replace(".", "")|replace(" ", "-")|lower()}}]]{% endif %}
- Full Title: {{full_title}}
- Category: #{{category}} #readwise-import
{% if document_note -%}
- Document Note: {{document_note}}
{% endif -%}
{% if document_tags -%}
- Document Tags: {% for tag in document_tags %}#books/{{tag}} {% endfor %}
{% endif -%}
{% if summary -%}
- Summary: {{summary}}
{% endif -%}
{% if url -%}
- URL: {{url}}
{% endif -%}
```

# Highlight Header
```md
{% if is_new_page %}
## Highlights [[{{date|date('Y-m-d')}}]] at {{time}}
{% elif has_new_highlights -%}
## New highlights added [[{{date|date('Y-m-d')}}]] at {{time}}
{% endif -%}
```

# Highlight 
```md

> {{ highlight_text }}{% if highlight_tags %}
  - Tags: {% for tag in highlight_tags %}#readwise/{{tag|replace(" ", "-")}} {% endfor %}{% endif %}{% if highlight_note %}
  - {{ highlight_note }}{% endif %} {%  if highlight_date %}
  - [[{{ highlight_date|date("Y-m-d")}}]]{% endif %}

<BR>
```



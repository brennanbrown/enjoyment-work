---
layout: page
permalink: /archive
---

{% for collection in site.collections %}
{% if collection.label != "pages" %}

  <h2>Items from {{ collection.label }}</h2>
  <ul>
    {% for item in site[collection.label] %}
      <li><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
  </ul>
  {% endif %}
{% endfor %}

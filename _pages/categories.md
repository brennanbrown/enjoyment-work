---
layout: page
title: Organized by Category
permalink: /categories/
content-type: eg
---

<style>
.category-content a {
    text-decoration: none;
    color: #0645ad;
}

.category-content a:hover {
    text-decoration: underline;
    color: #063e9b;
}
</style>

<main>
    {% for category in site.categories %}
        <h3 id="{{ category | first }}">{{ category | first | capitalize }}</h3>
        {% for post in category.last %}
            <li class="category-content" style="padding-bottom: 0.6em; list-style: none;"><a href="{{post.url}}">{{ post.title }}</a></li>
        {% endfor %}
    {% endfor %}
    <br>
    <br>
</main>

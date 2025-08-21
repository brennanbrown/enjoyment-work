---
layout: page
title: Organized by Tags
permalink: /tags/
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

<div class="row">
    {% for tag in site.tags %}
    <div class="col-xl-4 col-lg-6 col-12" >
        <h3 id="{{ tag | first }}">{{ tag | first | capitalize }}</h3>
        <ul class="overflow-auto tag-grid">
        {% for post in tag.last %}
            <li class="category-content"><a href="{{post.url}}">{{ post.title }}</a></li>
        {% endfor %}
        </ul>
    </div>
    {% endfor %}
    <br>
    <br>
</div>

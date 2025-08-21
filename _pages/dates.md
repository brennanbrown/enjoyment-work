---
layout: post
title: By Date
permalink: /dates/
content-type: eg
---

<style>
.date-content a {
    text-decoration: none;
    color: #0645ad;
}

.date-content a:hover {
    text-decoration: underline;
    color: #063e9b;
}
</style>

<main>
    {% assign postsByDay =
    site.posts | group_by_exp:"post", "post.date | date: '%d-%B-%Y'" %}

    {% for day in postsByDay %}
      <h3 id="{{ day.name }}">{{ day.name }}</h3>
          {% for post in day.items %}
            <li class="date-content" style="padding-bottom: 0.6em; list-style: none;"><a href="{{ post.url }}">{{ post.title }}</a></li>
          {% endfor %}
    {% endfor %}

        <br>
        <br>

</main>

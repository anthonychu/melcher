---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
{{dateFormat "2006" .Date}}: "{{dateFormat "01" .Date}}"
author: "Max Melcher"
draft: true
image:
    - /images/
categories:
  - Website
tags:
  - Wordpress
  - Hugo
  - Performance

featured: "featured.jpg" 
featuredalt : "Featured Image Alt" 
featuredpath : "images"
---
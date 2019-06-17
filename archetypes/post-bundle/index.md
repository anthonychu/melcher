---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
{{dateFormat "2006" .Date}}: "{{dateFormat "01" .Date}}"
author: "Max Melcher"
draft: true
categories:
  - Website
tags:
  - Wordpress
  - Hugo
  - Performance
featured: "images/featured.jpg"
featuredalt : ""
hashtags: 
  - "#azure"
---
---
title: Social media meta
date: 2014-01-11
tags: Snippets
intro: Make the most of people sharing your products, posts, pages or more simply by adding a few meta tags to the &lt;HEAD&gt; of your site.
---

With so many people using social media these days, it seems only logical to include the snippets below on all of our sites.

##Facebook Open Graph

These are probably the most commonly known and you've probably used these once or twice before.

~~~~
<!-- Facebook Open Graph tags -->
<meta property="og:image" content="" />
<meta property="og:site_name" content="" />
<meta property="og:type" content="" />
<meta property="og:url" content="" />
<meta property="og:title" content="" />
~~~~
{: .code--block}

More details of Facebook's OpenGraph tags/options can be found on [David Walsh's Blog](http://davidwalsh.name/facebook-meta-tags)

##Twitter Cards
These are a little newer and there is a LOT you can include (links to mobile apps, product details, etc) so make sure you check out the docs via the link below.

~~~~
<!-- Twitter Card -->
<meta name="twitter:card" content="summary" />
<meta name="twitter:creator" content="">
<meta name="twitter:url" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:description" content="" />
<meta name="twitter:image:src" content="" />
~~~~
{: .code--block}

More details of Twitter's Card tags/options can be found in their [development docs](https://dev.twitter.com/docs/cards)

##Rich Pins
Possibly the newest kid on the block launching in 2013, these can also include alot of content when somebody pins something from your site. They type property determines what additional meta data you can share so check out the link to the docs below.

~~~~
<!-- Pintrest Rich Pins -->
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="og:type" content="" />
<meta property="og:url" content="" />
<meta property="og:image" content="" />
<meta property="og:site_name" content="" />
~~~~
{: .code--block}

More details of Pinterest's Rich Pins tags/options can be found in their [development docs](http://developers.pinterest.com/rich_pins/)

##Putting it all together
An example site for a business selling shoes, with the page template based on a watered down version of the HTML5 boilerplate, could look something like this;

~~~~
<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8" />
    <title>Social Meta Tag Example</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/vendor/modernizr-2.7.1.min.js"></script>
    
    <!-- Facebook Open Graph tags -->
    <meta property="og:image" content="http://shop.example.com/images/store/SA-001.jpg" />
    <meta property="og:site_name" content="Example Store" />
    <meta property="og:type" content="product" />
    <meta property="og:url" content="http://shop.example.com/product/SA-001" />
    <meta property="og:title" content="Reebok Shaq Attaq" /> 
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="product" />
    <meta name="twitter:creator" content="@exampleStore">
    <meta name="twitter:url" content="http://shop.example.com/product/SA-001" />
    <meta name="twitter:title" content="Reebok Shaq Attaq" />
    <meta name="twitter:description" content="Limited edition Shaquille O'neil basketball shoes." />
    <meta name="twitter:image:src" content="http://shop.example.com/images/store/SA-001.jpg" /> 
    
    <!-- Pintrest Rich Pin -->
    <meta property="og:title" content="Reebok Shaq Attaq" />
    <meta property="og:description" content="Limited edition Shaquille O'neil basketball shoes." />
    <meta property="og:url" content="http://shop.example.com/product/SA-001" />
    <meta property="og:image" content="http://shop.example.com/images/store/SA-001.jpg" />
    <meta property="og:site_name" content="Example Store" />
    <meta property="og:price:amount" content="119.00" />
    <meta property="og:price:standard_amount" content="159.00" />
    <meta property="og:price:currency" content="USD" />
    <meta property="og:availability" content="instock" />
    <meta property="og:see_also" content="http://shop.example.com/product/SA-001" />
    <meta property="og:rating" content="4.5" />
    <meta property="og:rating_scale" content="5" />
    <meta property="og:rating_count" content="33" />
    <meta property="product:gender" content="Men" />
    <meta property="product:color" content="White and Blue" />
  </head>
  <body>
    
    <p>Hello world! This is HTML5 Boilerplate with social sharing meta tags.</p>

  </body>
</html>
~~~~
{: .code--block}


You can also download or copy the bare bones [Gist](https://gist.github.com/tgdev/8365308)

So get adding and start sharing!

T
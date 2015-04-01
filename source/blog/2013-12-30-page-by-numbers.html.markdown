---
title: Page by numbers
date: 2013-12-30
tags: setup, middleman
intro: Setting up pagination for my blog was easy enough however, trying to get it to work was a little less straight forward. So I'd like to share how I got pagnination setup on this here site.
---

##Configuration.

Inside the ```activate:blog do |blog|``` block of my ```config.rb``` file, I added the following pagination settings;

~~~~
blog.paginate = true
blog.page_link = "page:num"
blog.per_page = 5
~~~~
{: .code--block}

Although they're pretty straight forward, demos and explainations of the above settings can be found in the [Middleman docs](http://middlemanapp.com/basics/blogging/#toc_10).

##Template.

This is where I had a little difficulty.

In order for pagnination to work after setting up pagination in ```config.rb```, I needed to add in a little frontmatter tag to the top of the template I wanted to paginate. This is very important. Forget to include this and the rest of the code is useless.

~~~~
---
pageable: true
---
~~~~
{: .code--block}

Add this to the top of any template you want to use pagination on. The homepage of my site is the only place I require any pagination for the time being so I added this to top of the ```index.html.erb``` file in the root of my site.

This essentially tells middleman that we want to split up the contents of this site into manageable pages. Middleman then uses the settings in your ```config.rb``` file to figure out how many items per page.

### Show me the pages
So after configuring and enabling pagination on my site I needed to output the markup. I opted for a fairly simple pagination pattern that shows "Articles X to Y of Z" with next (newer) and previous (older) navigation. To do this I needed to use some of Middleman's built-in pagination variables;

- page_start
- page_end
- prev_page
- prev_page.url
- next_page
- next_page.url

The final code snippet looks like this;

~~~~
<div class="article pagination">
  <p class="pagination__summary">Articles <%= page_start %> to <%= page_end %> of <%= articles.length %></p>
  <ul class="list--clean list--pagination">
    <% if prev_page %>
      <li class="prev">
        <a href="<%= prev_page.url %>">Older articles</a>
      </li>
    <% end %>
    <% if next_page %>
      <li class="next">
        <a href="<%= next_page.url %>">Newer articles</a>
      </li>
    <% end %>
  </ul>
</div>
~~~~
{: .code--block}

So there you have it, pagination on a static site thanks to Middleman. Hopefully that helps clear things up for some people looking to achieve the same or a similar result.

T
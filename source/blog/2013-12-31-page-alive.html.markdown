---
title: Page Alive!
date: 2013-12-31
tags: middleman, tutorial
intro: Middleman can generate dynamic pages with a data file, a template and a little configuration. Let me show you how.
---

I first stumbled across [Middleman's dynamic pages](http://middlemanapp.com/basics/dynamic-pages/) feature on a freelance project I was working on for a friend of mine. The site was for a local event manager who wanted to showcase several (I think it was about 10) of their most recent events.

Now I'm not a huge fan of manual coding and always look for ways to automate or reuse code so I really didn't want to have to manually create all those pages.

Unfortunately the Middleman demo is a little basic for what I needed but luckily for me with a bit of digging and some communication back and forth with one of Middleman's contributors, [Ben Hollis](http://benhollis.net/about/), I discovered the true power of dynamic pages.

Like I mentioned in the intro, all you need is 3 key ingredients; a data file, a template and a couple of lines in your ```config.rb``` file.

Here's how I have implemented it.

##1. Data file
On the same level as my source (and eventually build) directories I created a ```data``` directory. Within my newly created data directory I created a new YAML file called ```projects.yml``` (Middleman also supports JSON data).

This YAML file contained all the data properties of a project and was to be used for looping through and outputting each project's details into a template.

Let's say each project has a client, title, description and list of event manager's responsibilities.

Our ```projects.yml``` file looks something like this;

~~~~
  - client: client1
    title: "First project"
    description: "This is a description of the 1st project."
    responsibilities:
      "<li>catering</li>
      <li>venue management</li>
      <li>event staffing</li>"
  
  - client: client2
    title: "Second project"
    description: "This is a description of the 2nd project."
    responsibilities:
      "<li>catering</li>"
~~~~
{: .code--block}

##2. Template
In my project (within the source directory) I created a new directory called ```projects``` (as this is what I was going to be displaying). Inside the projects directory I created ```template.html.erb```. This file is to be referenced in ```config.rb``` as the template to use for generating the individual project pages.

The template looks like this;

~~~~
<% p = locals[:project] %>
<div class="l-wrapper">
  <div class="l-content">
    <h2><%= p[:title] %></h2>
    <%= p[:description] %>
    <p class="highlight">Key responsibilities:</p>
    <ul class="itemised-list">
	    <%= p[:responsibilities] %>
    </ul>
  </div>
</div>
~~~~
{: .code--block}

Don't worry about the ```<% p = locals[:project] %>``` at the top of the file, locals[:project] is defined in ```config.rb``` and will be explained in the next section. 

'p' stores the project data object and is then used to access each property of the project such as title, description and the list of responsibilities.

##3. Configuration
The final piece of the puzzle lies in the ```config.rb``` file with this block;

~~~~
data.projects.each do |pd|
  proxy "/projects/#{pd[:client]}.html", "/projects/template.html", :layout => :popup, :locals => { :project => pd }, :ignore => true
end
~~~~
{: .code--block}

What this block is doing is as follows;

<strong>data.projects.each do &#124;pd&#124;</strong> is looping through each project item in ```projects.yml```

**proxy** is creating a dummy url using the client property of the project item within ```projects.yml``` and is being passed the template file in the projects directory. eg: "www.site.com/projects/client1.html"

**layout** is pointing to a custom layout which resides in the ```layouts``` directory and is different from the standard site layout. 

*You can also set layout to false if your template has all the html in it (rather than using partial includes)*

**locals** is what passes the data in ```project.yml``` to the template (remember p = locals[:projects])

**ignore** tells middleman not to create a html file for template.html.erb as we only want html files for each of the projects.

So once that's all setup all you need to do is fire up middleman server and test it out by going to; http://localhost:4567/projects/client1.html

This really is a handy feature and you can get pretty creative with what you store in your data files and how you render that data in the template. Also, remember if you're not too keen on YAML, Middleman also supports JSON.

So go nuts and start adding dynamic pages to your not-so-static Middleman site!

T
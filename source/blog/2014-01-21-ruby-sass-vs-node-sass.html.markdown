---
title: Battle of the Sasses
date: 2014-01-21
tags: workflow, experiments
intro: Ruby Sass can be a little slow when compiling your Sass project but Libsass claims to compile up to 5x faster. Let's see shall we with a good ol' fashioned Sass off! 
---

[Libsass](http://libsass.org/) is a C port of the original Sass engine to offer the power of Sass without being tied to Ruby.

Now I work in Windows and Ruby can be a bit of a pain so I'm more than keen to give the new kid on the block a go.

What I'm going to do is create two test projects using the [inuit css framework](http://inuitcss.com) with their own gruntfile but each gruntfile will be different.

Project 1 will have the ruby Sass grunt task while Project 2 will use the newer, faster Libsass with Node-sass and Grunt-Sass.

Ben Frain has a great article on [getting up and running with libsass, node-sass and grunt-sass](http://benfrain.com/lightning-fast-sass-compiling-with-libsass-node-sass-and-grunt-sass/).

## The setup

Let's take a look at each project's `package.json` file to compare.

<div class="row">
<div class="half">
<p><strong>Project 1</strong></p>
<pre class="code--block">
<code>{
  "name": "project-1",
  "version": "0.5.0",
  "dependencies": {},
  "devDependencies": {
    "grunt": "~0.4.1",
    "load-grunt-tasks": "~0.2.0",
    "time-grunt": "~0.1.1",
    "grunt-contrib-watch": "~0.4.3",
    "grunt-contrib-sass": "latest"
  },
  "engines": {
    "node": ">=0.8.0"
  }
}
</code>
</pre>
</div>
<div class="half">
<p><strong>Project 2</strong></p>
<pre class="code--block">
<code>{
  "name": "project-1",
  "version": "0.5.0",
  "dependencies": {},
  "devDependencies": {
    "grunt": "~0.4.1",
    "load-grunt-tasks": "~0.2.0",
    "time-grunt": "~0.1.1",
    "grunt-contrib-watch": "~0.4.3",
    "grunt-sass": "0.6.1"
  },
  "engines": {
    "node": ">=0.8.0"
  }
}
</code>
</pre>
</div>
</div>

There's only one main difference between the two projects and that is the grunt package for Sass.

##The test
After running `npm install` so as to install all our grunt packages from our `package.json` file, we'll run the `grunt` command which looks like this in `gruntfile.js`.

~~~~
grunt.registerTask('default', ['sass', 'watch']);
~~~~
{: .code--block}

This simply compiles our Sass partial files from inuit into style.css and then watches said Sass files for any changes.

Making a quick little change to one of our Sass files (like changing the background colour on the body) and saving that change triggers the grunt watch task to kick in and...

##The results
As we can see from the image below, the Node Sass task, which uses libsass, is indeed much faster than the native Ruby based Sass task.

<figure>
	<img src="/img/posts/2014/sass-test.png" alt="Test results: Ruby Sass - 2.645 seconds. Libsass - 1 second." />
	<figcaption>
		<small>Top: Ruby Sass completion time. Bottom: Libsass completion time</small>
	</figcaption>
</figure>

##Soooooo...

I know this is a pretty light on example but imagine you're working on a large scale site with multiple Sass modules and even styles for various plugins, not to mention running multiple grunt tasks - you're gonna love the extra time savings.

Plus, with support for sourcemaps being added to Libsass in the last month, there's not much of a reason to continue waiting around for the native Ruby Sass grunt task to drag it's knuckles into CSS pre-compilation. 

We're all far too busy for that right?

T

<small>*NOTE: If you use Compass, which Libsass still does not support, checkout the [autoprefixer grunt task](https://github.com/nDmitry/grunt-autoprefixer) that uses the [Can I Use](http://caniuse.com/) database.*</small>
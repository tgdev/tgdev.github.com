---
title: You're doing it Peter!
date: 2013-09-08
tags: responsive, setup
intro: So here it is; my very own blog site. This debut post is dedicated to discussing a few new techniques I tried during the development process.
---

##My, what big words you have.

I've been an advocate for [responsive web design](http://alistapart.com/article/responsive-web-design) in the last few projects I've worked on and one thing I really have trouble with is typography. I agree with [Harry Roberts](http://csswizardry.com/2012/02/pragmatic-practical-font-sizing-in-css/) and find it helpful to preset your font sizes, testing them out in a digital styleguide or standard content page. As well as this I wanted to take it a step further and try out something that I read on [Trent Walton's blog](http://trentwalton.com/2012/06/19/fluid-type/) where the font size for the entire site is scaled based on a variety of breakpoints.

I was able to achieve this by applying a percentage (%) based value to the body element within a bunch of predetermined breakpoints (these are written using Sass using variables and mixins, so I've just included the outputted css below).

~~~~
body {
  font-size: 100%;
  line-height: 1.4;
}
@media screen and (min-width: 600px) {
  body {
    font-size: 112.5%;
    line-height: 1.6;
  }
}
@media screen and (min-width: 800px) {
  body {
    font-size: 125%;
    line-height: 1.6;
  }
}
@media screen and (min-width: 1200px) {
  body {
    font-size: 150%;
  }
}
~~~~
{: .code--block}

## Loosey Goosey
The other major thing I wanted to try was breaking out of the 960 grid and make things more fluid. I've tinkered with a variety of grid frameworks such as; [Foundation](http://foundation.zurb.com/), [Bootstrap](http://getbootstrap.com/) and [inuit](http://inuitcss.com/), with my most preferred being [Susy](http://susy.oddbird.net/). When starting development on this blog, I began using Susy but found that I was too constricted to it's rules and soon ran into issues when it came to fluid breakpoints.

Realising the design only really calls for a single column with the exception of the little profile image in the footer, I threw it all out and simply set varying container widths at each breakpoint (If I find that I need to split the content into more than one column, I'll create those styles as I need them).

~~~~
.container {
  @extend %cf;
  position: relative;
  width: 90%;
  margin: 0 auto;

  @include respond-to($desk) { // 800px / 16px
    width: 86%;
  }
}

.article {
  @include respond-to($desk) {
    width: 70%;
    margin-left: auto;
    margin-right: auto;
  }
}
~~~~
{: .code--block}

And voila! A nice little fluid blog that scales quite nicely.

T
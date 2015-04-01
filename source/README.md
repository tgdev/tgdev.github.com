#www.tomgillard.com
This is the web blog of Melbourne Front End Developer, Tom Gillard.

This blog is built using the [Middleman](http://middlemanapp.com) static site generator with Sass.

Despite being on github, all code and content remain copyright of Tom Gillard.

## Working on the site

During development it's important to remember that the files added to / modified within the local source folder get pushed to origin/develop.

````
git add .
git commit -m "commit message"
git push origin develop
````

## Deployments

Uses the middleman-deploy gem to push the local build folder to origin/master

`bundle exec middleman-deploy`
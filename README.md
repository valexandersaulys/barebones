# Custom Theming in Ghost

The documetation is bit impractical so I'm rewriting it here.

``zip -r barebones.zip barebones/*``


## Layout of file

[Ghost CSS's docs on
structure](https://ghost.org/docs/themes/structure/). 

```
.
├── /assets
    ├── /css
        ├── screen.css
    ├── /fonts
    ├── /images
    ├── /js
├── /partials
    ├── loop.hbs
├── default.hbs
├── index.hbs [required]
└── post.hbs [required]
└── package.json [required]
```

partials are rendered with `{{> "name_of_partial" }}` with hbs
appended.

We extend out from a partial with `{{!< default }}`.

We pull data for a post using tags like `{{#post}}` such that
everything mentioned under it is a loop value, e.g. `{{{title}}}`
references the title of the post.

Special versions include `{{{ body }}}` found in the `default.hbs`.


### Default `package.json`

```
{
    "name": "your-theme-name",
    "description": "A brief explanation of your theme",
    "version": "0.5.0",
    "engines": {
        "ghost-api": "v3"
    },
    "license": "MIT",
    "author": {
        "email": "your@email.here"
    },
    "config": {
        "posts_per_page": 5,
        "image_sizes": {}
    }
}
```


## Basic CSS Layout

```css
body { /* encompasses all the content */}

/* * * * * Index * * * * */
.header { /* navigation head */ }
.head > h3 {/* name of blog */ }
ul.nav { /* navigation list of pages */ }
ul.nav > li { /* navigation items */ }

.content { /* everything under the navigation */ }

.content > header > .site-heading > h1 { /* 'Vincent's Blog' */ }
.content > header > .site-heading > span.subheading { /* 'Thoughts, stories, and idea' */ }

/* pagination uptop */
.extra-pagination { /* redundant with the nav */ }
nav.pagination { /* cluster of 'page 1 of 2' */ }
span.page-number { /* 'page 1 of 2' */ }
a.older-posts { /* 'Older Posts' */ }

/* loops over and creates */
article.post { /* note: also affects the post page */ }
/* optional: 'article.tag-kebab-cased-name' */
article > header.post-header {}
article > section.post-excerpt {}
article > section.post-excerpt > p { /* actual text being printer */ }

/* bottom of page */
nav.pagination {}



/* * * * * Post Page * * * * */
section.post-content {}
section.post-content > h1.post-title {}
/* content follows, not container */
section.post-content > figure { /* image holder */ }
section.post-content > figure > img { /* image */ }
section.post-content > blockquote { }

footer.post-footer { }
footer.post-footer > section.author > h2 { /* written by */ }
footer.post-footer > section.author > h4 { /* author name ? */ }
```


## Custom Pages

Follows convention of `custom-{{template-name}}.hbs`.

The `template-name` will be rendered in kebab-case, i.e. `Template
Name`.



## Snippets

#### Page Header

```css
{{! Page Header}}
<header>
<div class="site-heading">
  <h1>{{ @blog.title }}</h1>
  <span class="subheading">{{ @blog.description }}</span>
</div>
</header>
```

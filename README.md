# Rails Boilerplate

[Rails Boilerplate](https//github.com/khelben/rails-boilerplate) is a Rails (>= 3.1.0) gem which helps you to use the [html 5 boilerplate](http://html5boilerplate.com).

## Install & usage

You'll need at least Rails 3.1. Then put this in your `Gemfile`:

```ruby
gem "rails-boilerplate"
```
This gives you a rake task `boilerplate:install` which does the following things:

* updates `app/views/layouts/application.html.erb` to include all the elements used in the [H5BP:index.html](https://github.com/h5bp/html5-boilerplate/blob/master/index.html) converted to a Rails compatible ERB file, complete with the necessary rails helper calls.

* adds `style.css`(renamed to reset.css), `modernizr.js` and `plugins.js` as assets

* copies over some static file (like favicons, touch icons, robots.txt, humans.txt) to the `public/` folder.

## Development

If you want to checkout the code, be sure to do:

```bash
git submodule init
git submodule update
bundle
```

## Todo

* add option to strip comments from the `application.html.erb`
* add option to exclude google analytics script
* check whether prototype instead of jquery is used, if so adapt the generated files

## Changelog

* 0.1.5: 21/nov/2011: updated to html5-boilerplate version
* 0.1.0: initial version.

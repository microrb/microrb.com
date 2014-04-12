# microrb.com

micro.rb website

## Project Submission Policy

  * We don't accept ActiveSupport as a dependency because:
    * monkey-patching is bad m'kay
    * implicit dependencies inside activesupport via requires is also bad
    * it's a huge dependency that is often used without any good reasons (ie "oh I need Hash#symbolize_keys!")
  * A project must be focused on solving just one problem
  * At the same time a project must not be anemic
  * A project must follow [semantic versioning](http://semver.org)
  
## How to submit your project

Submit an issue with:

* URL to your project
* Description of what it does if you didn't do it already in the project's README
* Indicate if it's beeing already used in production environments (even if it's below 1.0)

## How to preview your project locally

1. Clone this repository
2. Add your project's Github path and tags to `data/projects.json`
3. Update project data with `ruby bin/update.rb`
4. Generate the site `make`
5. Open public/index.html

Generate HTML
-------------

Make sure you have [mote][mote] and [virtus](https://github.com/solnic/virtus) installed, then:

```terminal
$ make
```

It will create `public/index.html`.

[mote]: https://github.com/soveran/mote/

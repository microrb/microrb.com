# microrb.com

micro.rb website

## Project Submission Policy

  * We don't accept ActiveSupport as a dependency because:
    * monkey-patching is bad m'kay
    * implicit dependencies inside activesupport via requires is also bad
    * it's a huge dependency that is often used without any good reasons (ie "oh I need Hash#symbolize_keys!")
  * A project must be focused on solving just one problem
  * At the same time a project must not be anemic

## How to contribute

1. Clone this repository
2. Add your project's Github path and tags to `data/projects.json`
3. Update project data with `ruby bin/update.rb`
4. Commit to a branch and push the changes
5. Go to https://github.com/microrb and create a Pull Request for your branch.

Generate HTML
-------------

Make sure you have [mote][mote] and [virtus](https://github.com/solnic/virtus) installed, then:

```terminal
$ make
```

It will create `public/index.html`.

[mote]: https://github.com/soveran/mote/

microrb.com
===========

micro.rb website

How to contribute
-----------------

1. Clone this repository
2. Add your project's Github path and tags to `data/projects.json`
3. Update project data with `ruby bin/update.rb`
4. Commit to a branch and push the changes
5. Go to https://github.com/microrb and create a Pull Request for your branch.

Generate HTML
-------------

Make sure you have [mote][mote] installed, then:

```terminal
$ make
```

It will create `public/index.html`.

[mote]: https://github.com/soveran/mote/

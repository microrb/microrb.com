# miCops.com

[![Join the chat at https://gitter.im/microrb/microrb.com](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/microrb/microrb.com?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

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

You will need a Github API access token first, [register an application](https://github.com/settings/applications/new), then do a

```
curl -u"username" -d '{"scopes":["public_repo"],"client_id":"...","client_secret":"...","note":"update microrb"}' https://api.github.com/authorizations
```

filling in your username, `client_id` and `client_secret`. Note down the token in the response.


1. Clone this repository
2. Run `bundle` to install the dependencies
3. Add your project's Github path and tags to `data/projects.json`
4. Update project data with `OAUTH_TOKEN=... ruby bin/update.rb` using the token acquired above
5. Generate the site with `make`
6. Open public/index.html

Generate HTML
-------------

Make sure you have [mote][mote] and [virtus](https://github.com/solnic/virtus) installed, then:

```terminal
$ make
```

It will create `public/index.html`.

[mote]: https://github.com/soveran/mote/

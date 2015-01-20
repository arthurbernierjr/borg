# Borg

Combines and simplifies several popular automated devops, server orchestration, provisioning, and deployment tools into one.

**Documentation**:  
http://mikesmullin.github.io/borg-docs/

**Third-party Resources**:  
https://github.com/borg-scripts/


## What makes Borg different?

Popular features that grew out of frustration with [Chef](http://www.getchef.com/chef/) are now the foundation of Borg, with improvements:

* Client and command-line driven management similar to [knife-solo](https://github.com/matschaffer/knife-solo)
* Interactive debugging of both Borg and your scripts
* Test-driven development similar to [test-kitchen](https://github.com/test-kitchen/test-kitchen) with [Vagrant](http://vagrantup.com) and [VirtualBox](https://www.virtualbox.org/)
* Define machines, datacenters, and environments in a _single_ [DRY](http://en.wikipedia.org/wiki/Don't_repeat_yourself) [CSON](https://github.com/bevry/cson) format that is always in-scope
* [Ruby](http://www.ruby.org)-inspired scripting simplicity of [CoffeeScript](http://www.coffeescript.org)
* Speed and asynchronous I/O of [Node.JS](http://www.nodejs.org)
* Simple yet more powerful flow control
* Designed to operate on several machines at once in *parallel*.
* Code execution happens client-side. Remote machine *only needs SSH* w/ SFTP enabled.
* No remote bootstrap step necessary; experience faster, less frustrating dev-test cycles.
* Organize and `require()` equivalent of roles, recipes, attributes, et cetera like any other [CommonJS module](http://dailyjs.com/2010/10/18/modules/).
* Manage dependencies with [npm](https://npmjs.org/) and [git](http://git-scm.com/) submodules.

### Clever analogous parlance:

Since Chef debuted in 2009, community contributions have saturated the culinary namespace. Before we take over Google for anything [Star Trek](http://en.wikipedia.org/wiki/Star_Trek:_The_Next_Generation) related, let's agree not to glorify or obfuscate otherwise simple and well-known definitions of things:

* "**Chef**" inspired "**Borg**"
* "**cookbook**" or "**recipe**" now simply "**script**"; organize directories how you like
* "**site-cookbooks/**" now "**scripts/**". likewise "**cookbooks/**" is now "**scripts/vendor/**"
* "**node** or **role**" now just "**server**"; with logic to define conditions.
* "**Berkshelf**" currently simply "**git submodule**"

## Installation

```bash
npm install borg -g
borg help
```

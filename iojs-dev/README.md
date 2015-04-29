# io.js in docker

io.js in docker is basically the same as the apiaryio/base-dev-nodejs
but uses io.js instead.

## Caveat
io.js and node.js are almost compatible but one important difference using
io.js is that `npm install` may fail if you are using C/C++ modules
i.e. `hiredis` or `protagonist` as
the [node-gyp tool](https://github.com/TooTallNate/node-gyp)  is not
io.js aware and fails. To get around it use
[pangyp](https://github.com/rvagg/pangyp).

```
npm -g install pangyp
npm --node-gyp=path_to_modules/pangyp/bin/node-gyp.js install
```
Or in Dockerfile

```
RUN . ~/.nvm/nvm.sh; npm install pangyp && \
    npm --node-gyp=~/app/node_modules/pangyp/bin/node-gyp.js install
```


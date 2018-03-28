# sample-haskell-static

A sample web application written in Haskell.

It builds statically to a single executable and can be deployed easily as a docker container.

## How to run
```
curl -sSL https://get.haskellstack.org/ | sh # Install stack if needed
stack build
stack exec --docker-env APP_ENV=development sample-haskell-static
```

### How to generate a docker container
```
stack docker pull                            # Download base image if needed
stack image container
```

### Optional:

You can install `intero` to integrate with your IDE (provided you have a compatible plugin)
```
stack install intero
```

You can install `hfmt` to beautify your code.
```
stack install hfmt
stack exec hfmt -- -w
```
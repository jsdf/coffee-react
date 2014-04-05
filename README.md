# Coffee-React

Wrapper for the Coffeescript compiler executable using [coffee-react-transform](https://github.com/jsdf/coffee-react-transform) to support Coffeescript files including React JSX style markup (CSX).

If you just want to transform CSX code into valid Coffeescript as part of your existing build process see [coffee-react-transform](https://github.com/jsdf/coffee-react-transform), which is the main parser/tranformer package.

### Installation
```bash
npm install -g coffee-react
```

### Usage

**Note: standard coffee compiler options not yet implemented. For now, if you need those, use the [csx-transform](https://github.com/jsdf/coffee-react-transform) executable and then pipe the output into `coffee -cs`**

```bash
csx-coffee [input file]
```
Outputs compiled JS to stdout. You probably want to redirect it to a file, eg.
```bash
csx-coffee example/car.csx > car.js
```

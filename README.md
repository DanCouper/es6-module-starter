ES6 Module Starter

Boilerplate for ES6 modules, using Babel.

[![Build Status](https://semaphoreci.com/api/v1/projects/03a7edf4-865a-4df0-9244-3a6aa12f2cea/533329/badge.svg)](https://semaphoreci.com/dancouper/es6-module-starter)

## Prior Art

Based on https://github.com/vinniegarcia/es6-module-starter; I use [Semaphore](https://semaphoreci.com) for continuous integration (so no `.travis.yml`/similar).

## Usage

0. Install node and npm.
1. Clone this repo: `git clone https://github.com/DanCouper/es6-module-starter`
2. Install dependencies: `npm i`
3. Hack away.
4. Add the repo to your Semaphore & Coveralls accounts.

## Modules used/included

- *babel* - compiles ES6 source to ES5. The `--experimental` flag is also enabled so you can use ES7 features.
- [*tape*](https://github.com/substack/tape) and [*argg*](https://github.com/isao/argg) for simple, effective testing. A couple of good articles on tape: [Why I use Tape instead of Mocha & so should you](https://medium.com/javascript-scene/why-i-use-tape-instead-of-mocha-so-should-you-6aa105d8eaf4) by Eric Elliott, and [Buckle up with Tape](https://medium.com/@MarcFly1103/buckle-up-with-tape-1bd5e9e828) by Marco Romero.
- [*eslint*](http://eslint.org/) and *babel-eslint* to analyze your code for stylistic issues.
- [*plato*](https://github.com/es-analysis/plato) to analyze the complexity of your source code.

These are just defaults. Feel free to swap out eslint for jshint, or tape for mocha, or whatever you use for CI instead of coveralls.

## Layout

- `src/` - Your ES6 source code goes here.
- `src/tests/` - Your ES6 tests go here.
- `src/.eslintrc` - ESLint configuration
- `coverage/` - Code coverage reports are output here.
- `dist/` - Your generated ES5 source is output here. This directory is under gitignore.
- `.gitignore` - a sensible .gitignore file to prevent you from checking in generated source.
- `package.json` - Customize this to publish your own module.
- `.coveralls.yml` - Customize this if you use [coveralls](https://coveralls.io/) for code coverage.
- `README.md` - Delete all this and write your own.

## npm scripts

These scripts are the main way to interact with your module as you develop it.

- `compile` - run [babel](https://babeljs.io/) to compile your ES6 source to ES5. Output goes to the `dist/` directory.
- `lint` - run [ESLint](http://eslint.org/) on your ES6 source and reports any style errors.
- `tape` - test your code.
- `coverage` - run [Istanbul](https://gotwarlost.github.io/istanbul/) on your code to report coverage. Reports output in HTML to the `coverage/istanbul` directory.
- `istanbul` - run Istanbul, but output only lcov files for coveralls to read.
- `coveralls` - run coveralls, using Istanbul's lcov report as input.
- `plato` - run [plato](https://github.com/es-analysis/plato), a code analysis tool, on your generated source (plato doesn't support ES6 at the moment; as soon as it does I'll swap it to analyze ES6 source).
- `test` - run tape, Istanbul, and coveralls.

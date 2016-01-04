# ES6 Module Starter

Boilerplate for ES6 modules (*with support down to stage 0 features*), using Babel. Test framework is [AVA](https://github.com/sindresorhus/ava). Coverage via [NYC](https://github.com/bcoe/nyc). Linting via [ESLint](http://eslint.org/).

[![Build Status](https://semaphoreci.com/api/v1/projects/03a7edf4-865a-4df0-9244-3a6aa12f2cea/533329/badge.svg)](https://semaphoreci.com/dancouper/es6-module-starter)

[![Coverage Status](https://coveralls.io/repos/DanCouper/es6-module-starter/badge.svg?branch=master&service=github)](https://coveralls.io/github/DanCouper/es6-module-starter?branch=master)

## Notes/Todos

- This [natch] has breaking changes from the pre-v1.0.0 `es6-module-starter`: the test framework and coverage tool have been changed. The API is near-identical, but be aware of this.
- On OSx, I had permissions issues when trying to run AVA. Fixed by `sudo chown`ing the file AVA writes to in my user root `.config/` folder; not sure if this is just my setup or not, but be aware.
- The `coveralls.yml` file is not necessary: it is present purely for the benefit of CI service, but as it is gitignored, the Coveralls repo token has to be manually entered in the CI service admin as an environment variable (*eg*, for Semaphore: got to *project settings*, select *environment variables* and add it there). **Delete this.**
- ESLint has not been given many config options; this means it will throw up errors (for example, if Plato is run on the example code, 3 violations are shown, none of which are ctually violations). **Add sensible defaults.**


## Prior Art

Originally based on a clone of https://github.com/vinniegarcia/es6-module-starter; I use [Semaphore](https://semaphoreci.com) for continuous integration (so no `.travis.yml`/similar).

## Usage

0. Install node and npm.
1. Clone this repo: `git clone https://github.com/DanCouper/es6-module-starter`.
2. Install dependencies: `npm i`.
3. Edit info in `package.json`.
4. Reinitialize git, commit, then `hub create && git push origin master`.
5. Add the repo to your Coveralls account, then rename `coveralls.example.yml` to `coveralls.yml` and fill in the Coveralls repo key.
6. Add the repo to your Semaphore account: `coveralls.yml` file is .gitignored; you need to manually add the coveralls key to the settings for that repo.
7. Hack away!

## Modules used/included

- [**babel**](https://babeljs.io) - compiles ES6 source to ES5. The `es2015` and `stage-0` presets are included, as well as `babel-cli`.
- [**ava**](https://github.com/sindresorhus/ava) for simple, effective testing with built in ES2015 support. The interface is very similar to [tape](https://github.com/substack/tape), but tests are run concurrently and in seperate Node processes. **Note that AVA does not transpile modules automatically, so you *must* `import 'babel-core/register'` at the top of your test files before `import`ing whatever it is you're testing.**
- [**eslint**](http://eslint.org/) (with *babel-eslint* to cover ES2015+ features) to analyze your code for stylistic issues.
- [**nyc**](https://github.com/bcoe/nyc) for code coverage. AVA spawns the test files, so [istanbul](https://gotwarlost.github.io/istanbul/) cannot be used directly: however, NYC runs Istanbul under-the-hood.
- [**plato**](https://github.com/es-analysis/plato) to analyze the complexity of your source code. Note that a fork of Plato with native support for ES2015 is present to avoid having to compile to a build folder before generating reports.

These are just defaults. Feel free to swap out eslint for jshint, or ava for mocha, or whatever you use for CI instead of coveralls.

## Layout

- `src/` - Your ES6 source code goes here.
- `tests/` - Your ES6 tests go here.
- `coverage/` - Code coverage reports are output here.
- `dist/` - Your generated ES5 source is output here. This directory is under gitignore.
- `.gitignore` - a sensible .gitignore file to prevent you from checking in generated source.
- `package.json` - Customize this to publish your own module.
- `.coveralls.example.yml` - Rename this to `coveralls.yml` & add your Coveralls repo token this if you use [coveralls](https://coveralls.io/) for code coverage.
- `README.md` - Delete all this and write your own.

## npm scripts

These scripts are the main way to interact with your module as you develop it.

| Command | Description |
|---------|-------------|
| `npm run ava` | Test your code. Note that simply running `ava` also works, this alias is present for consistency. |
| `npm run clean` | Remove the `coverage` and `dist` directories. |
| `npm run compile` | Run [babel](https://babeljs.io/) to compile source to ES5. Files compiled to `dist/` with source maps. |
| `npn run coverage` | Run NYC on your code to report coverage. Reports output in HTML to `coverage/`. |
| `npm run coveralls` | Run coveralls, using NYC's lcov report as input. |
| `npm run lint` | Runs [ESLint](http://eslint.org/) on your ES6 source and reports any style errors. |
| `npm run plato` | Run plato on your source, generating a complexity report in `coverage/`.
| `npm test` | Run AVA, NYC, and coveralls, then delete `coverage/`. |

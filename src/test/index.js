import Example from '../index.js'
const test = require('tape')

test('The truth', (t) => {
  t.plan(1)
  t.equal(1, 1, '1 should equal 1.')
})

test('Example class', (t) => {
  t.plan(1)
  t.equal(Example.add(1,1), 2, 'Adding 1 and 1 should equal 2.')
})

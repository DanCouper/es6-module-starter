import test from 'ava'
import 'babel-core/register'

import Example from '../src/index.js'

test('The truth', (t) => {
  t.plan(1)
  t.is(1, 1, '1 should equal 1.')
})

test('Example class', (t) => {
  t.plan(1)
  t.is(Example.add(1,1), 2, 'Adding 1 and 1 should equal 2.')
})

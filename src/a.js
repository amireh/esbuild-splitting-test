import './core.js'

const container = typeof global === 'undefined' ? window : global
container.evaluations = container.evaluations || []
container.evaluations.push('a')

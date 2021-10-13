import './i18nObj'

const container = typeof global === 'undefined' ? window : global
container.evaluations = container.evaluations || []
container.evaluations.push('translations')

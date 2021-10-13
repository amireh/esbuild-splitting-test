import './i18nObj.js'

const container = typeof global === 'undefined' ? window : global
container.evaluations = container.evaluations || []
container.evaluations.push('i18nObjConsumer')

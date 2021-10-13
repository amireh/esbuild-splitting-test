import './a.js'
import './b.js'
import('./b.js')

if (typeof window !== 'undefined') {
  document.body.innerText = evaluations.join(' -> ')
}
else {
  console.log(evaluations)
}

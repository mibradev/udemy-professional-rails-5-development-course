import Typed from 'typed.js'

document.addEventListener('turbolinks:load', () => {
  typeMainParagraph()
})

function typeMainParagraph() {
  const $typed = $('#typed')
  const text = $typed.text()
  $typed.html('')
  new Typed("#typed", { strings: text.split(/[,.]/), typeSpeed: 40, autoInsertCss: false })
}

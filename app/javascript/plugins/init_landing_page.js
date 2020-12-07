
const initLandingPage = () => {
  "$(function() {\n$('a[href*":"#]').on('click', function(e) {\ne.preventDefault();\n$('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 500, 'linear');\n});\n});"
}

export { initLandingPage };

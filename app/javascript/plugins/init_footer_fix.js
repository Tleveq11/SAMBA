const initFooterFix = () => {
  const footer = document.getElementById('footer');
  if (footer) {
    if (footer.offsetTop <= window.innerHeight) {
        footer.classList.add('fixed-bottom');
      } else {
        footer.classList.remove('fixed-bottom');
    }
  }
}

export { initFooterFix };
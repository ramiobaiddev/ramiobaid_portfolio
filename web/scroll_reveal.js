/**
 * Scroll Reveal Engine
 * Uses the browser's native IntersectionObserver for maximum 60fps performance.
 * Automatically discovers all sections and elements to reveal as you scroll down.
 */
(() => {
  const initScrollReveal = () => {
    // Select all targets to reveal automatically
    const defaultSelectors = [
      '.projects-section',
      '.project-card',
      '.about-me',
      '.about-me-content',
      '.about-me__image',
      '.lets-ship-it',
      '.lsi-main-container',
      '.lsi-actions'
    ];

    const elementsToReveal = document.querySelectorAll(defaultSelectors.join(', '));

    if (!elementsToReveal.length) return;

    // Apply base reveal class if not present
    elementsToReveal.forEach((el) => {
      if (el.classList.contains('about-me__image')) {
        el.classList.add('reveal-scale');
      } else if (!el.classList.contains('project-card')) {
        el.classList.add('reveal');
      }
    });

    const observerOptions = {
      root: null,
      rootMargin: '0px 0px -10% 0px', // Triggers slightly before element reaches bottom of viewport
      threshold: 0.12
    };

    const observer = new IntersectionObserver((entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-revealed');
          // Once revealed, unobserve to free up memory
          obs.unobserve(entry.target);
        }
      });
    }, observerOptions);

    elementsToReveal.forEach((el) => observer.observe(el));
  };

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initScrollReveal);
  } else {
    initScrollReveal();
  }
})();


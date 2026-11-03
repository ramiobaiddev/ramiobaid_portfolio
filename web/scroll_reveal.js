/**
 * Scroll Reveal Engine
 * Uses the browser's native IntersectionObserver for buttery smooth 60-120fps performance.
 * Eliminates nested transform collisions and heavy GPU filter re-rasterization.
 */
(() => {
  const initScrollReveal = () => {
    // Reveal targets: sections and cards (no nested double-transforms)
    const targets = [
      '.about-me',
      '.projects-heading',
      '.projects-eyebrow',
      '.project-card',
      '.lets-ship-it'
    ];

    const elementsToReveal = document.querySelectorAll(targets.join(', '));
    if (!elementsToReveal.length) return;

    elementsToReveal.forEach((el) => {
      // Add standard reveal class only to headings/eyebrows;
      // .about-me, .project-card, and .lets-ship-it have dedicated section rules
      if (el.classList.contains('projects-heading') || el.classList.contains('projects-eyebrow')) {
        el.classList.add('reveal');
      }
    });

    const observerOptions = {
      root: null,
      rootMargin: '0px 0px -8% 0px',
      threshold: 0.1
    };

    const observer = new IntersectionObserver((entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-revealed');
          // Once revealed, unobserve to free up observer memory
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


/**
 * Global Scroll Progress Engine
 * Calculates scroll progress using requestAnimationFrame for 120fps smoothness.
 */
(() => {
  const initProgressBar = () => {
    let bar = document.getElementById('scroll-progress-bar');
    if (!bar) {
      bar = document.createElement('div');
      bar.id = 'scroll-progress-bar';
      document.body.appendChild(bar);
    }

    let ticking = false;

    const updateProgress = () => {
      const scrollTop = window.scrollY || window.pageYOffset || document.documentElement.scrollTop || 0;
      const docHeight = document.documentElement.scrollHeight - window.innerHeight;

      if (docHeight > 0) {
        const progress = Math.min(1, Math.max(0, scrollTop / docHeight));
        bar.style.transform = `scaleX(${progress})`;
      }

      ticking = false;
    };

    window.addEventListener(
      'scroll',
      () => {
        if (!ticking) {
          requestAnimationFrame(updateProgress);
          ticking = true;
        }
      },
      { passive: true }
    );

    // Initial calculation
    updateProgress();
  };

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initProgressBar);
  } else {
    initProgressBar();
  }
})();


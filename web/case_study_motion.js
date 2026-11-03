/**
 * Case Study Motion Engine
 * Powered by pure JavaScript & IntersectionObserver
 * - Smooth Number Counting on Metrics & Performance Challenges (0 -> 100+, 0.0 -> 5.0, 0 -> 60 FPS)
 * - Automatic Section Reveal triggering
 * - Mockup focal zoom & Wireframe inspection tilt
 */
(() => {
  const initCaseStudyMotion = () => {
    // Only run when case study elements are present on the page
    if (!document.querySelector('.case-study-hero, .cs-stripe-num, .cs-challenge-metric, .cs-wireframe-card')) {
      return;
    }

    // 1. Animated Number Counter Engine
    const counterElements = document.querySelectorAll(
      '.cs-stripe-num, .cs-challenge-metric'
    );

    if (counterElements.length) {
      const parseValue = (text) => {
        const cleaned = text.trim();
        // Check for float (e.g. 5.0 ★)
        const floatMatch = cleaned.match(/^([0-9]+\.[0-9]+)(.*)$/);
        if (floatMatch) {
          return { target: parseFloat(floatMatch[1]), suffix: floatMatch[2], isFloat: true };
        }
        // Check for integer with prefix/suffix (e.g. 100+, 60 FPS, -45%, 0 MB)
        const intMatch = cleaned.match(/^([+-]?[0-9]+)(.*)$/);
        if (intMatch) {
          return { target: parseInt(intMatch[1], 10), suffix: intMatch[2], isFloat: false };
        }
        return null;
      };

      const animateCounter = (el) => {
        const originalText = el.dataset.targetValue || el.innerText;
        el.dataset.targetValue = originalText;

        const parsed = parseValue(originalText);
        if (!parsed) return;

        const duration = 1600; // ms
        const startTime = performance.now();
        const startVal = 0;

        const updateNumber = (now) => {
          const elapsed = now - startTime;
          const progress = Math.min(1, elapsed / duration);
          // Ease Out Quart curve
          const easeOut = 1 - Math.pow(1 - progress, 4);

          const current = startVal + (parsed.target - startVal) * easeOut;

          if (parsed.isFloat) {
            el.innerText = `${current.toFixed(1)}${parsed.suffix}`;
          } else {
            const rounded = Math.round(current);
            const prefix = parsed.target < 0 && rounded > 0 ? '-' : '';
            el.innerText = `${prefix}${rounded}${parsed.suffix}`;
          }

          if (progress < 1) {
            requestAnimationFrame(updateNumber);
          } else {
            el.innerText = originalText;
          }
        };

        requestAnimationFrame(updateNumber);
      };

      const counterObserver = new IntersectionObserver(
        (entries, observer) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              animateCounter(entry.target);
              observer.unobserve(entry.target);
            }
          });
        },
        { threshold: 0.25 }
      );

      counterElements.forEach((el) => {
        el.dataset.targetValue = el.innerText;
        counterObserver.observe(el);
      });
    }

    // 2. Case Study Wireframes & Gallery Zoom Micro-Interactions
    const interactiveScreens = document.querySelectorAll(
      '.cs-wireframe-item img, .cs-gallery__track img, .cs-visual__screen img'
    );

    interactiveScreens.forEach((img) => {
      img.style.transition = 'transform 0.4s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.4s ease';
      img.addEventListener('mouseenter', () => {
        img.style.transform = 'scale(1.04) translateY(-6px)';
        img.style.boxShadow = '0 20px 35px rgba(0, 0, 0, 0.2)';
      });
      img.addEventListener('mouseleave', () => {
        img.style.transform = '';
        img.style.boxShadow = '';
      });
    });
  };

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initCaseStudyMotion);
  } else {
    initCaseStudyMotion();
  }
})();


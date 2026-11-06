/**
 * Upgraded Concept 2: High-Performance 3D Glowing Constellation Engine
 * Features:
 * - Dynamic Responsive Resize with ResizeObserver & coordinate scaling
 * - Multi-layer Depth-of-Field (Z-axis parallax)
 * - Luminous Glowing Halos
 * - Elastic Mouse Ripple Force
 * - Organic Breathing nodes
 * - Automatic Retina display HiDPI scaling
 */
(() => {
  const initParticles = () => {
    // Respect accessibility motion preferences
    if (window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      return;
    }

    const isMobile = window.innerWidth < 768 || (window.matchMedia && window.matchMedia('(pointer: coarse)').matches);

    const hero = document.querySelector('.hero');
    if (!hero) return;

    let canvas = document.getElementById('hero-particles-canvas');
    if (!canvas) {
      canvas = document.createElement('canvas');
      canvas.id = 'hero-particles-canvas';
      canvas.style.position = 'absolute';
      canvas.style.top = '0';
      canvas.style.left = '0';
      canvas.style.width = '100%';
      canvas.style.height = '100%';
      canvas.style.pointerEvents = 'none';
      canvas.style.zIndex = '0';
      hero.insertBefore(canvas, hero.firstChild);
    }

    const ctx = canvas.getContext('2d');
    let dpr = isMobile ? Math.min(window.devicePixelRatio || 1, 1.5) : Math.min(window.devicePixelRatio || 1, 2);

    let width = hero.offsetWidth;
    let height = hero.offsetHeight;

    const mouse = {
      x: -1000,
      y: -1000,
      targetX: -1000,
      targetY: -1000,
      radius: 170
    };

    if (!isMobile) {
      hero.addEventListener('mousemove', (e) => {
        const rect = hero.getBoundingClientRect();
        mouse.targetX = e.clientX - rect.left;
        mouse.targetY = e.clientY - rect.top;
      }, { passive: true });

      hero.addEventListener('mouseleave', () => {
        mouse.targetX = -1000;
        mouse.targetY = -1000;
      });
    }

    // Brand Palette: Royal Blue and Warm Amber
    const palette = [
      { fill: 'rgba(1, 86, 255, 0.75)', glow: 'rgba(1, 86, 255, 0.65)' },
      { fill: 'rgba(52, 120, 255, 0.70)', glow: 'rgba(52, 120, 255, 0.55)' },
      { fill: 'rgba(255, 170, 1, 0.85)', glow: 'rgba(255, 170, 1, 0.75)' },
      { fill: 'rgba(103, 154, 255, 0.65)', glow: 'rgba(103, 154, 255, 0.45)' }
    ];

    class Particle {
      constructor() {
        this.reset(true);
      }

      reset(initial = false) {
        this.x = initial ? Math.random() * width : (Math.random() > 0.5 ? 0 : width);
        this.y = Math.random() * height;

        // Depth-of-Field (Z-axis): 0.4 (far away) to 1.0 (close up)
        this.z = Math.random() * 0.6 + 0.4;

        this.baseRadius = (Math.random() * 2 + 1.2) * this.z;
        this.pulseSpeed = Math.random() * 0.03 + 0.015;
        this.pulseOffset = Math.random() * Math.PI * 2;

        const speed = (Math.random() * 0.5 + 0.25) * this.z;
        const angle = Math.random() * Math.PI * 2;
        this.vx = Math.cos(angle) * speed;
        this.vy = Math.sin(angle) * speed;

        this.colorData = palette[Math.floor(Math.random() * palette.length)];
      }

      update(time) {
        this.x += this.vx;
        this.y += this.vy;

        // Wrap around current boundaries smoothly
        if (this.x < -20) this.x = width + 20;
        if (this.x > width + 20) this.x = -20;
        if (this.y < -20) this.y = height + 20;
        if (this.y > height + 20) this.y = -20;

        // Elastic Mouse Ripple Wave Force (only on mouse devices)
        if (!isMobile && mouse.x > 0 && mouse.y > 0) {
          const dx = mouse.x - this.x;
          const dy = mouse.y - this.y;
          const dist = Math.sqrt(dx * dx + dy * dy);

          if (dist < mouse.radius) {
            const force = (mouse.radius - dist) / mouse.radius;
            const pushAngle = Math.atan2(dy, dx);
            this.x -= Math.cos(pushAngle) * force * 3.5 * this.z;
            this.y -= Math.sin(pushAngle) * force * 3.5 * this.z;
          }
        }

        // Organic Breathing size
        this.currentRadius = this.baseRadius + Math.sin(time * this.pulseSpeed + this.pulseOffset) * 0.45;
      }

      draw() {
        // High-performance dual-layer halo without CPU shadowBlur
        ctx.beginPath();
        ctx.arc(this.x, this.y, Math.max(1.2, this.currentRadius * 1.7), 0, Math.PI * 2);
        ctx.fillStyle = this.colorData.glow;
        ctx.fill();

        ctx.beginPath();
        ctx.arc(this.x, this.y, Math.max(0.6, this.currentRadius), 0, Math.PI * 2);
        ctx.fillStyle = this.colorData.fill;
        ctx.fill();
      }
    }

    let particles = [];

    const syncParticles = (oldW, oldH) => {
      // Mobile-optimized particle density: keeps frame rates locked at 60-120fps
      const isMobile = width < 768;
      const targetCount = isMobile ? 14 : Math.floor(Math.min(width, 1400) / 19);

      // If dimensions changed, redistribute particles proportionally across new canvas area
      if (oldW > 0 && oldH > 0 && (oldW !== width || oldH !== height)) {
        const scaleX = width / oldW;
        const scaleY = height / oldH;
        particles.forEach((p) => {
          p.x = Math.max(0, Math.min(width, p.x * scaleX));
          p.y = Math.max(0, Math.min(height, p.y * scaleY));
        });
      }

      // Add or trim particles to match current screen size
      while (particles.length < targetCount) {
        particles.push(new Particle());
      }
      if (particles.length > targetCount) {
        particles.length = targetCount;
      }
      particles.sort((a, b) => a.z - b.z);
    };

    const resize = () => {
      const oldW = width;
      const oldH = height;

      dpr = Math.min(window.devicePixelRatio || 1, 2);
      width = hero.offsetWidth;
      height = hero.offsetHeight;

      canvas.width = width * dpr;
      canvas.height = height * dpr;

      // Reset transform before re-scaling for HiDPI
      ctx.setTransform(1, 0, 0, 1, 0, 0);
      ctx.scale(dpr, dpr);

      syncParticles(oldW, oldH);
    };

    resize();

    // Use ResizeObserver for instant, accurate element dimension updates
    if (window.ResizeObserver) {
      const ro = new ResizeObserver(() => resize());
      ro.observe(hero);
    } else {
      window.addEventListener('resize', resize);
    }

    let time = 0;
    let isVisible = true;
    let animId = null;

    const animate = () => {
      if (!isVisible) {
        animId = null;
        return;
      }

      time += 1;
      ctx.clearRect(0, 0, width, height);

      // Smooth mouse damping
      mouse.x += (mouse.targetX - mouse.x) * 0.12;
      mouse.y += (mouse.targetY - mouse.y) * 0.12;

      // 1. Constellation Connection Lines
      const maxDistance = 135;
      for (let i = 0; i < particles.length; i++) {
        for (let j = i + 1; j < particles.length; j++) {
          const p1 = particles[i];
          const p2 = particles[j];

          if (Math.abs(p1.z - p2.z) > 0.4) continue;

          const dx = p1.x - p2.x;
          const dy = p1.y - p2.y;
          const dist = Math.sqrt(dx * dx + dy * dy);

          if (dist < maxDistance) {
            const alpha = (1 - dist / maxDistance) * 0.18 * ((p1.z + p2.z) / 2);
            ctx.beginPath();
            ctx.strokeStyle = `rgba(1, 86, 255, ${alpha})`;
            ctx.lineWidth = 1 * ((p1.z + p2.z) / 2);
            ctx.moveTo(p1.x, p1.y);
            ctx.lineTo(p2.x, p2.y);
            ctx.stroke();
          }
        }
      }

      // 2. Glowing Laser Connections to Cursor (desktop only)
      if (!isMobile && mouse.x > 0 && mouse.y > 0) {
        for (let i = 0; i < particles.length; i++) {
          const p = particles[i];
          const dx = mouse.x - p.x;
          const dy = mouse.y - p.y;
          const dist = Math.sqrt(dx * dx + dy * dy);

          if (dist < mouse.radius) {
            const alpha = (1 - dist / mouse.radius) * 0.4 * p.z;
            ctx.beginPath();
            ctx.strokeStyle = `rgba(255, 170, 1, ${alpha})`;
            ctx.lineWidth = 1.3 * p.z;
            ctx.moveTo(p.x, p.y);
            ctx.lineTo(mouse.x, mouse.y);
            ctx.stroke();
          }
        }
      }

      // 3. Render all particles
      for (let i = 0; i < particles.length; i++) {
        particles[i].update(time);
        particles[i].draw();
      }

      animId = requestAnimationFrame(animate);
    };

    // Auto-pause particle animation when Hero section is scrolled out of viewport
    if ('IntersectionObserver' in window) {
      const heroObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          isVisible = entry.isIntersecting;
          if (isVisible && !animId) {
            animId = requestAnimationFrame(animate);
          }
        });
      }, { threshold: 0.05 });
      heroObserver.observe(hero);
    } else {
      animate();
    }
  };

    const startEngine = () => {
      if ('requestIdleCallback' in window) {
        requestIdleCallback(() => initParticles(), { timeout: 1200 });
      } else {
        setTimeout(initParticles, 150);
      }
    };

    if (document.readyState === 'complete') {
      startEngine();
    } else {
      window.addEventListener('load', startEngine, { once: true });
    }
  }) ();

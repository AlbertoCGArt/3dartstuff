// Shared nav + footer injected into every page
document.addEventListener('DOMContentLoaded', () => {

  // NAV
  const navHTML = `
  <nav id="nav">
    <a href="/index.html" class="nav-logo">3D<span>Art</span>Stuff</a>
    <ul class="nav-links">
      <li><a href="/portfolio.html">Portfolio</a></li>
      <li><a href="/tutorials.html">Tutorials</a></li>
      <li><a href="https://www.youtube.com/@AlbertoCGArt" target="_blank">YouTube</a></li>
      <li><a href="/index.html#about">About</a></li>
      <li><a href="/index.html#contact">Contact</a></li>
    </ul>
    <a href="https://albertocgart.gumroad.com" target="_blank" class="nav-cta">Shop Tutorials ↗</a>
  </nav>`;
  document.body.insertAdjacentHTML('afterbegin', navHTML);

  // FOOTER
  const footerHTML = `
  <footer>
    <span class="footer-brand">3D<span>Art</span>Stuff</span>
    <span class="footer-copy">© 2026 3DArtStuff · Alberto CGArt</span>
    <div class="footer-socials">
      <a href="https://www.youtube.com/@AlbertoCGArt" target="_blank" class="footer-social">YouTube</a>
      <a href="https://x.com/AlbertoCGArt" target="_blank" class="footer-social">X / Twitter</a>
      <a href="https://albertocgart.gumroad.com" target="_blank" class="footer-social">Gumroad</a>
    </div>
  </footer>`;
  document.body.insertAdjacentHTML('beforeend', footerHTML);

  // Nav scroll
  const nav = document.getElementById('nav');
  window.addEventListener('scroll', () => {
    nav.classList.toggle('scrolled', window.scrollY > 50);
  });

  // Cursor
  const cursor = document.getElementById('cursor');
  const ring = document.getElementById('cursorRing');
  if (cursor && ring) {
    document.addEventListener('mousemove', e => {
      cursor.style.left = e.clientX + 'px';
      cursor.style.top = e.clientY + 'px';
      ring.style.left = e.clientX + 'px';
      ring.style.top = e.clientY + 'px';
    });
  }

  // Scroll reveal
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => entry.target.classList.add('visible'), i * 100);
      }
    });
  }, { threshold: 0.08 });
  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
});

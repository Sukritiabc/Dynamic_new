//  document.addEventListener("DOMContentLoaded", function () {
//     function fixLinks() {
//         const links = document.querySelectorAll('a[data-original-href]');
//         const currentHost = window.location.hostname;

//         links.forEach(link => {
//             const original = link.getAttribute('data-original-href');
//             const current = link.getAttribute('href');
//             if (!original || !current) return;

//             // If link is external and not the same domain → use original underscore version
//             try {
//                 const url = new URL(current, window.location.origin);
//                 if (url.hostname !== currentHost) {
//                     link.setAttribute('href', original);
//                     link.dataset.fixedByJs = "true";
//                 }
//             } catch (e) {
//                 // If href isn't a valid URL, just skip it
//             }
//         });
//     }

//     // Run once at page load
//     fixLinks();

//     // Watch DOM changes for dynamically added links
//     const observer = new MutationObserver(fixLinks);
//     observer.observe(document.body, { childList: true, subtree: true });
// });
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('a[data-original-href]').forEach(function (a) {
    const originalHref = a.getAttribute('data-original-href');
    const cleanHref = a.getAttribute('href');

    // Skip anchors
    if (!originalHref || originalHref.startsWith('#')) return;

    const isExternal = !originalHref.startsWith(window.location.origin);
    const hasQuery = originalHref.includes('?');

    // Restore original underscore link for external or query-string URLs
    if (isExternal || hasQuery) {
      a.setAttribute('href', originalHref);
    }
  });
});

// Typewriter effect for logo
function initTypewriter() {
  const functions = [
    'update_beliefs()',
    'model_performance()',
    'simulate_outcomes()',
    'quantify_risk()',
    'evaluate_evidence()'
  ];

  let functionIndex = 0;
  let charIndex = 0;
  let isDeleting = false;
  let isPaused = false;

  const typeSpeed = 100;        // milliseconds per character when typing
  const deleteSpeed = 50;       // milliseconds per character when deleting (faster)
  const pauseAfterComplete = 2000;  // pause for 2 seconds when complete
  const pauseAfterDelete = 500;     // brief pause after deleting before next word

  // Find the logo element
  const logoElement = document.querySelector('.logo__text');

  if (!logoElement) {
    console.warn('Logo element not found');
    return;
  }

  // The theme already provides the '>', we just need a space before the function name
  const promptSymbol = ' ';

  function type() {
    const currentFunction = functions[functionIndex];

    if (isPaused) {
      // During pause, just wait
      isPaused = false;
      if (isDeleting) {
        setTimeout(type, pauseAfterDelete);
      } else {
        setTimeout(type, pauseAfterComplete);
      }
      return;
    }

    if (!isDeleting) {
      // Typing forward
      charIndex++;
      logoElement.textContent = promptSymbol + currentFunction.substring(0, charIndex);

      if (charIndex === currentFunction.length) {
        // Finished typing, pause then start deleting
        isPaused = true;
        isDeleting = true;
        setTimeout(type, pauseAfterComplete);
        return;
      }

      setTimeout(type, typeSpeed);
    } else {
      // Deleting
      charIndex--;
      logoElement.textContent = promptSymbol + currentFunction.substring(0, charIndex);

      if (charIndex === 0) {
        // Finished deleting, move to next function
        isDeleting = false;
        isPaused = true;
        functionIndex = (functionIndex + 1) % functions.length;
        setTimeout(type, pauseAfterDelete);
        return;
      }

      setTimeout(type, deleteSpeed);
    }
  }

  // Start the typewriter effect
  type();
}

// Run on initial load
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initTypewriter);
} else {
  // DOM already loaded
  initTypewriter();
}

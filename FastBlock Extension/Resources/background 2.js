// FastBlock - Background Service Worker
console.log('FastBlock: Initializing...');

// Initialize when extension is installed or updated
browser.runtime.onInstalled.addListener((details) => {
    console.log('FastBlock: Installed', details);
    
    // Set default settings
    browser.storage.local.set({
        enabled: true,
        blockCount: 0,
        installDate: new Date().toISOString()
    });
    
    console.log('FastBlock: Ready to block ads!');
});

// Keep service worker alive
self.addEventListener('activate', event => {
    console.log('FastBlock: Service worker activated');
});

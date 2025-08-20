(function(){
  function getSystemPrefersDark(){
    return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
  }
  function applyTheme(theme){
    if(theme === 'dark') document.documentElement.setAttribute('data-theme','dark');
    else if(theme === 'light') document.documentElement.setAttribute('data-theme','light');
    else document.documentElement.removeAttribute('data-theme');
  }
  function currentTheme(){
    try { return localStorage.getItem('theme'); } catch(e){ return null; }
  }
  function saveTheme(theme){
    try { if(theme) localStorage.setItem('theme', theme); else localStorage.removeItem('theme'); } catch(e){}
  }
  function toggle(){
    var t = currentTheme();
    if(!t){ t = getSystemPrefersDark() ? 'dark' : 'light'; }
    var next = (t === 'dark') ? 'light' : 'dark';
    saveTheme(next);
    applyTheme(next);
  }
  document.addEventListener('DOMContentLoaded', function(){
    var btn = document.getElementById('theme-toggle');
    if(btn){ btn.addEventListener('click', toggle); }
  });
})();

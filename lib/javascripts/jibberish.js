var Jibberish = {

  locales: {},
  currentLanguage: 'en',
  cookieKey: 'locale',
  
  initialize: function(){
    var lang = this.getLocaleFromCookie();
    if (lang) { this.currentLanguage = lang; }
  },

  get: function(key, lang){
    if (!lang) { lang = this.currentLanguage; }
    return this.locales[lang] && this.locales[lang][key];
  },

  getLocaleFromCookie: function(){
    var cookies = document.cookie.split(/\s*;\s*/),
        i, pair, locale;
    for (i = 0; i < cookies.length; i++) {
      pair = cookies[i].split('=');
      if (pair[0] === this.cookieKey) { locale = pair[1]; break; }
    }
    return locale;
  }

};

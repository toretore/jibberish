String.prototype.t = function(key){
  if (!key){ key = this.toLowerCase().replace(/ /g, '_'); }
  return Jibberish.get(key) || this.toString();
};

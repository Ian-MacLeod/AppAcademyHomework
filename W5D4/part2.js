function titleize(words, callback) {
  words.forEach((word) => {
    word = word.toLowerCase();
    word = word.slice(0, 1).toUpperCase() + word.slice(1);
    callback(word);
  });
}

titleize(["hello", "how", "u", "doin"], (word) => {
  console.log(word);
});

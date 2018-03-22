document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const restaurantsUl = document.getElementById("restaurants");
  const favoritesForm = document.getElementById("favorite-form");
  const favoritesInput = document
    .querySelectorAll("#favorite-form input.favorite-input")[0];

  const addFavoritePlace = (e) => {
    e.preventDefault();
    const li = document.createElement("li");
    li.textContent = favoritesInput.value;
    favoritesInput.value = "";
    restaurantsUl.appendChild(li);
  };

  favoritesForm.addEventListener("submit", addFavoritePlace);




  // adding new photos

  // --- your code here!

  const toggleFormButton = document
    .querySelectorAll("button.photo-show-button")[0];
  const imageForm = document.getElementById("image-form");
  const formContainer = document
    .querySelectorAll("div.photo-form-container")[0];
  const imageInput = document
    .querySelectorAll('input.photo-url-input')[0];
  const photoUl = document
    .querySelectorAll('ul.dog-photos')[0];

  toggleFormButton.addEventListener("click", (e) => {
    if (Array.from(formContainer.classList).includes("hidden")) {
      console.log("hi");
      formContainer.className = "photo-form-container";
    } else {
      formContainer.className = "photo-form-container hidden";
    }
  });

  imageForm.addEventListener("submit", (e) => {
    e.preventDefault();
    const img = document.createElement("img");
    img.src = imageInput.value;
    const li = document.createElement('li').appendChild(img);
    photoUl.appendChild(li);
    imageInput.value = "";
  });

});

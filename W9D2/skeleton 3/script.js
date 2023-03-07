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
  const placesButton = document.getElementsByClassName("favorite-submit")[0]

  placesButton.addEventListener('click', event => {
    event.preventDefault();

    const favPlacesInput = document.getElementsByClassName("favorite-input")[0]
    const favPlace = favPlacesInput.value;
    favPlacesInput.value = '';
    const placesList = document.getElementById("sf-places")
    const li = document.createElement('li');
    li.textContent = favPlace;
    placesList.appendChild(li);
  })




  // adding new photos

  // --- your code here!

  const toggleButton = document.getElementsByClassName("photo-show-button")[0];

  toggleButton.addEventListener('click', event => {
    const photoForm = document.getElementsByClassName("photo-form-container")[0];
    photoForm.classList.toggle("hidden");
  })

  const photoUrlSubmitButton = document.getElementsByClassName('photo-url-submit')[0];
  photoUrlSubmitButton.addEventListener('click', event => {
    event.preventDefault();

    const photoUrlInput = document.getElementsByClassName("photo-url-input")[0]
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = '';
    // debugger

    const dogPhotosList = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = photoUrl;
    li.appendChild(img);
    dogPhotosList.append(li);
  })


});

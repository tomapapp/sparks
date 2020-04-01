const initToggleMap = () => {
  const mapIcon = document.getElementById("map-icon-container");
  const mapElement = document.getElementById("map")
  const nonMapContent = document.getElementById("recommendation-index")
  mapIcon.addEventListener("click", (event) => {
    mapElement.classList.toggle("toggled");
    nonMapContent.classList.toggle("hidden");
  })
}

export { initToggleMap };

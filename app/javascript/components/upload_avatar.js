const avatarRemoved = (titleContainer, inputLabel, e) => {
  inputLabel.insertAdjacentHTML("beforeend", '<i class="fas fa-times labelIcon red pl-2"></i>')
  titleContainer.innerHTML = ""
}
const avatarUploaded = (titleContainer, inputLabel, e) => {
  inputLabel.insertAdjacentHTML("beforeend", '<i class="fas fa-check labelIcon red pl-2"></i>')
  //titleContainer.innerHTML = e.srcElement.files[0].name
}

const avatarUpload = () => {
  const uploadButton = document.querySelector(".js-avatar")
  if (uploadButton) {
    uploadButton.addEventListener("change", (e) =>{
      const titleContainer = document.querySelector(".file-title")
      const inputLabel = document.querySelector('.avatar-label')
      const labelIcon =document.querySelector(".labelIcon")
      if (labelIcon) {
        inputLabel.removeChild(labelIcon)
      }
      if (e.srcElement.files[0]) {
        avatarUploaded(titleContainer, inputLabel, e)
      } else {
        avatarRemoved(titleContainer, inputLabel, e)
      }

    })
  }
}

export { avatarUpload }

// function profileTabs(evt, tabName) {
//   var i, tabcontent, tablinks;
//   tabcontent = document.getElementsByClassName("tabcontent");
//   for (i = 0; i < tabcontent.length; i++) {
//     tabcontent[i].style.display = "none";
//   }
//   tablinks = document.getElementsByClassName("tablinks");
//   for (i = 0; i < tablinks.length; i++) {
//     tablinks[i].className = tablinks[i].className.replace(" active", "");
//   }
//   document.getElementById(tabName).style.display = "block";
//   evt.currentTarget.className += " active";
// }

// export { profileTabs };

const profileTabs = () => {
  // document.querySelectorAll('#nav-tab a').forEach((link) => {
  //   link.addEventListener("click", (e) => {
  //     e.preventDefault()
  //     link.classList.remove("active")
  //   })
  // })
  $('#nav-tab a').on('click', function (e) {
  e.preventDefault()
  $('#nav-tab a').removeClass("active hilite")
  $(this).tab('show')
})
}

export { profileTabs };

let btn= document.querySelector('button');
btn.addEventListener('click',showMsg);

function showMsg(){
    alert("This button is clicked.")

    btn.textContent("Hello Ashis.")
}
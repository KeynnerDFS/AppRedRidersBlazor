const btnActiveLists = document.querySelector("#btn-active-lists")
const ulList = document.querySelector("#menu-lists")

ulList.style.display = 'none'

btnActiveLists.addEventListener("click", () => {
    if (ulList.style.display === 'flex') {
        return ulList.style.display = 'none'
    }
    ulList.style.display = 'flex'
})
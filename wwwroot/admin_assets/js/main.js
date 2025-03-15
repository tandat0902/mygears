document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".menu-dropdown").forEach(menu => {
        menu.addEventListener("click", function () {
            let childMenu = this.querySelector(".child-menu");
            document.querySelectorAll(".child-menu").forEach(child => {
                if (child !== this.querySelector(".child-menu")) {
                    child.classList.remove("show");
                }
            });
            if (childMenu) {
                childMenu.classList.toggle("show");
            }
        });
    });
});

document.querySelectorAll(".child-menu").forEach(child => {
    child.addEventListener("click", function (event) {
        event.stopPropagation(); 
    });
});

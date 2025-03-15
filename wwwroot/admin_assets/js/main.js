document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".menu-dropdown").forEach(menu => {
        menu.addEventListener("click", function () {
            
            document.querySelectorAll(".child-menu").forEach(child => {
                if (child !== this.querySelector(".child-menu")) {
                    child.classList.remove("show");
                }
            });
            document.querySelectorAll(".icon-dropdown").forEach(icon => {
                if (icon !== this.querySelector(".icon-dropdown")) {
                    icon.classList.remove("rotate");
                }
            });

            let childMenu = this.querySelector(".child-menu");
            let icon = this.querySelector(".icon-dropdown");
            if (childMenu) {
                childMenu.classList.toggle("show");
            }
            if (icon) {
                icon.classList.toggle("rotate");
            }
        });
    });
});

document.querySelectorAll(".child-menu").forEach(child => {
    child.addEventListener("click", function (event) {
        event.stopPropagation(); 
    });
});

function assemble(data, first = false) {
    let container = document.createElement("ul");
    if (!first)
        container.classList.add("nested")
    for (let x of data) {
        let node = document.createElement("li");
        let name = document.createElement("h4");
        name.innerText = x.name;
        name.classList.add("caret");
        if (x.new)
            name.classList.add("new");
        node.appendChild(name);

        if (x.contents[0] != undefined) {
            node.appendChild(assemble(x.contents));
        } else {
            let list = document.createElement("ul");
            list.classList.add("file-list");
            list.classList.add("nested");
            for (let key of Object.keys(x.contents)) {
                let item = document.createElement("li");
                item.classList.add("file");
                // item.classList.add("tcum");
                let button = document.createElement("button");
                button.innerText = "preview";
                button.addEventListener("click", (e) => {
                    e.target.disabled = !e.target.disabled;
                    if (e.target.disabled) {
                        let viewer = document.createElement("embed");
                        viewer.src = x.contents[key];
                        viewer.type = "application/pdf";
                        viewer.width = "100%";
                        viewer.height = "100%";
                        viewer.id = x.contents[key];
                        e.target.parentElement.appendChild(viewer);
                    } else {
                        let viewer = 
                        document.getElementById(x.contents[key]);
                        viewer.parentElement.removeChild(viewer);
                    }
                    e.target.removeEventListener("click", null);
                })
                let link = document.createElement("a");
                link.href = x.contents[key];
                link.innerText = "open externally";
                item.append(key, " - ", link, " ", button);
                list.appendChild(item);
            }
            node.appendChild(list);
        }

        container.appendChild(node);
    }
    return container
}

function layout(data) {
    toc.appendChild(assemble(data.data, true));
}

(function() {
    starIcon.src = "home/" + (Math.random() > 0.3 ? "star.svg" : "star.png")

    fetch("data.json")
        .then(response => response.json())
        .then(data => {
            layout(data);

            updateDate.innerText = data["update-date"];

            var toggler = document.getElementsByClassName("caret");
            var i;

            for (i = 0; i < toggler.length; i++) {
                toggler[i].addEventListener("click", function() {
                    this.parentElement.querySelector(".nested").classList.toggle("active");
                    this.classList.toggle("caret-down");
                });
            }
        });


})();


// Tree view

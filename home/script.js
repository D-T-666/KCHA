function createButton(name, data) {
    let item = document.createElement("li");
    item.classList.add("file");
    let button = document.createElement("button");
    button.innerText = "preview";
    button.addEventListener("click", (e) => {
        e.target.disabled = !e.target.disabled;
        if (e.target.disabled) {
            let viewer = document.createElement("embed");
            viewer.src = data;
            viewer.type = "application/pdf";
            viewer.width = "100%";
            viewer.height = "100%";
            viewer.id = data;
            e.target.parentElement.appendChild(viewer);
        } else {
            let viewer = 
            document.getElementById(data);
            viewer.parentElement.removeChild(viewer);
        }
        e.target.removeEventListener("click", null);
    })
    let link = document.createElement("a");
    link.href = data;
    link.innerText = "open externally";
    item.append(name, " - ", link, " ", button);
    return item;
}

function assemble(data, first = false) {
    let container = document.createElement("ul");
    if (!first)
        container.classList.add("nested")

    for (let x of Object.keys(data).sort()) {
        let node = document.createElement("li");
        
        if (typeof data[x] === 'string') {
            node.appendChild(createButton(x, data[x]));
        } else {
            let name = document.createElement("h4");
            name.innerText = x;
            node.appendChild(name);
            name.classList.add("caret");
            node.appendChild(assemble(data[x]));
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

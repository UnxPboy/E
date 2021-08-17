const navItems = document.querySelectorAll('.nav');

for (let i = 0; i < navItems.length; i++) {
    navItems[i].addEventListener('click', selectNav);
}

function selectNav(e) {
    document.querySelector('#searchBox').value = '';

    let id = this.id;

    let allItems = document.querySelectorAll(`[data-kind]`);
    let itemsKind = document.querySelectorAll(`[data-kind="${id}"]`);

    for (let i = 0; i < allItems.length; i++) {
        
        if (id == 'all') {
            allItems[i].style.display = 'flex';
        } else {
            allItems[i].style.display = 'none';
        }

    }

    if (id == 'all') return;

    for (let i = 0; i < itemsKind.length; i++) {
        itemsKind[i].style.display = 'flex';
    }
}
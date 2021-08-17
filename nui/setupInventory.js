function setupPlayerInventory(items) {
    makeSlotItems(items);
    makeDragAndDrop(items);
}

function setupOtherInventory(itemList) {
    makeOtherSlotItems(itemList);
    makeOtherDragAndDrop();
}

function makeSlotItems(items, maxWeight) {

    maxWeight = maxWeight || 0;

    let currentWeightOrSlot = 0;

    // Reset Slot
    document.querySelector('#playerInventory').innerHTML = '';

    // Load items
    for (let item of items) {
        let kind = 'normal';

        if (CONFIG.FoodItems.includes(item.name)) {
            kind = 'food';
        } else if (CONFIG.AccessoryItems.includes(item.name)) {
            kind = 'accessory';
        } else if (item.type == 'item_weapon') {
            kind = 'weapon';
        } else if (item.type == 'item_key') {
            kind = 'key';
        }

        if (!itemLabel[item.name] && !CONFIG.DisableRename.includes(item.type)) {
            itemLabel[item.name] = item.label;
        }

        let element = document.createElement('div');
        element.className = 'slot';
        element.dataset.itemdata = JSON.stringify(item);
        element.dataset.kind = kind;
        element.innerHTML = `
            <div class="item-count">${setItemCount(item)}</div>
            <div class="item-name">${itemLabel[item.name] || item.label}</div>
            <img src="${CONFIG.ImagePath}${item.name}.png">
        `
        element.addEventListener('contextmenu', e => {
            e.preventDefault();
            contextMenu.dataset.itemdata = JSON.stringify(item);
            contextMenu.style.top = `${e.clientY}px`;
            contextMenu.style.left = `${e.clientX}px`;
            contextMenu.style.visibility = 'visible';
        });

        document.querySelector('#playerInventory').appendChild(element);
    }
}

function makeDragAndDrop(items) {
    $('.slot').draggable({
        drag: function (event, ui) {
            
        },
        helper: function (e) {
            let original = $(e.currentTarget.querySelector('img'))
            return original.clone().css({
                width: original.width(),
                // height: original.height(),
            });
        },
        stop: function () {
        }
    });

    $('.quick-slot').droppable({
        drop: function (event, ui) {
            let element = ui.draggable[0];

            if (!JSON.parse(element.dataset.itemdata).usable) return;

            this.innerHTML = element.querySelector('img').outerHTML;
            this.dataset.itemdata = element.dataset.itemdata;
        }
    });

    // Clear
    for (let i = 0; i < quickSlots.length; i++) {
        let item = items.find(itemData => {
            if (!quickSlots[i].dataset.itemdata) return;

            return itemData.name == JSON.parse(quickSlots[i].dataset.itemdata).name
        });

        if (!item) {
            quickSlots[i].innerHTML = i + 1;
            delete quickSlots[i].dataset.itemdata;
        }
    }
}

function makeOtherSlotItems(items) {

    document.querySelector('#otherInventory').innerHTML = '';

    if (Boolean(Object.keys(items).length > 0)) {
        for (let item of items) {
            // if (item.count > 0) {
                // item.type = 'item_standard'

                item.count = item.count || ' '

                if (!itemLabel[item.name] && !CONFIG.DisableRename.includes(item.type)) {
                    itemLabel[item.name] = item.label;
                }
    
                let element = document.createElement('div');
                element.className = 'otherSlot';
                element.dataset.itemdata = JSON.stringify(item);
                element.innerHTML = `
                    <div class="item-count">${item.count}</div>
                    <div class="item-name">${itemLabel[item.name] || item.label}</div>
                    <img src="${CONFIG.ImagePath}${item.name}.png">
                `
                document.querySelector('#otherInventory').appendChild(element);
            // }
        }
    }

}

function makeOtherDragAndDrop() {
    $('.otherSlot').draggable({
        drag: function (event, ui) {
            
        },
        helper: function (e) {
            let original = $(e.currentTarget.querySelector('img'))
            return original.clone().css({
                width: original.width(),
                // height: original.height(),
            });
        },
        stop: function () {
        }
    });

    $('#playerInventory').droppable({
        drop: function (event, ui) {
            let element = ui.draggable[0];
            if (element.className.startsWith('slot')) return;

            itemData = JSON.parse(element.dataset.itemdata);
            openInputPopup('takeFrom')
        }
    });

    $('#otherInventory').droppable({
        drop: function (event, ui) {
            let element = ui.draggable[0];
            
            if (element.className.startsWith('otherSlot')) return;
            if (!CONFIG.CanPutIntoOtherPlayer && displayType === 'otherPlayer') return;

            itemData = JSON.parse(element.dataset.itemdata);
            openInputPopup('putInto');
        }
    });
}

function setNumber(x) {
    if (x == 0 ) return '';

    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function setItemCount(item) {
    if (item.weight) return item.count;

    let itemCount = setNumber(item.count) || '';
    let itemLimit = item.limit == -1 && itemCount || !item.limit ? '' : `/${item.limit}`;

    return `${itemCount}${itemLimit}`;
}
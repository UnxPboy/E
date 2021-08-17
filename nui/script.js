const body = document.querySelector('body');
const contextMenu = document.querySelector('#contextMenu');
let quickSlots = document.querySelectorAll('.quick-slot');

let displayType = null;
let otherPlayerId = null;

let itemData = null;
let popupAction = null;
let giveCount = null;

let itemLabel = {};

body.addEventListener('mousedown', e => {
    if (e.target.offsetParent != contextMenu) {
        contextMenu.style.visibility = 'hidden';
    }
});

window.addEventListener('DOMContentLoaded', e => {
    document.querySelector('.container').style.visibility = 'hidden';
});

window.addEventListener('message', e => {
    if (e.data.action === 'loadInventory') {
        document.querySelector('#searchBox').value = '';

        if (e.data.type === 'player') {
            setupPlayerInventory(e.data.items)
        }
    } else if (e.data.action === 'setSecondInventoryItems') {
        if (e.data.type === 'otherPlayer') {
            otherPlayerId = e.data.info;
        }

        setupOtherInventory(e.data.itemList)
        
    } else if (e.data.action === 'openDisplay') { // Main Inventory (TAKZOBYE)
        openDisplay(e.data.type)
    } else if (e.data.action === 'display') { // Other location want to send message to nui
        openDisplay(e.data.type) 
    } else if (e.data.action == 'closeDisplay') {

        document.querySelector('.search-box').style.transition = 'none';
        document.querySelector('.container').style.visibility = 'hidden';
        document.querySelector('.max-container').style.visibility = 'hidden';
        document.querySelector('.input-popup').style.visibility = 'hidden';

    } else if (e.data.action === 'useQuickSlot') {
        useQuickSlot(e.data.key)
    } else if (e.data.action === 'setInfoText') {
        if (e.data.type === 'player') {

            if (e.data.text == 'limit') {
                document.querySelector('.player-weight').style.visibility = 'hidden'
            } else {
                document.querySelector('#playerWeightStatusText').innerText = `${e.data.weight}/${e.data.max} (${(e.data.weight * 100 / e.data.max).toFixed(2)}%)`;
                document.querySelector('#playerWeightStatusBar').style.width = `${e.data.weight * 100 / e.data.max}%`
            }

            return;
        }

        if (e.data.type === 'vault') {
            document.querySelector('#otherWeightStatusText').innerText = e.data.text;
            return;
        }

        document.querySelector('#otherWeightStatusText').innerText = e.data.text;
        document.querySelector('#otherWeightStatusBar').style.width = `${e.data.weight * 100 / e.data.max}%`
    }
});

window.addEventListener('keydown' , e => {
    if (e.key === 'Escape') {
        closeDisplay();
    }

    contextMenu.style.visibility = 'hidden';
});

// Reset .quick-slot
for (let i = 0; i < quickSlots.length; i++) {
    quickSlots[i].addEventListener('mousedown', function(e) {
        if (e.button === 2) {
            if (this.dataset.itemdata.includes('WEAPON')) {
                navigator.sendBeacon("https://takzobye_mini-inventory/cancleWeapon", JSON.stringify({}));
            }

            this.innerHTML = i + 1;
            delete this.dataset.itemdata;
        }
    });
}

function useQuickSlot(key) {
    let element = quickSlots[key - 1];
    if (!element.dataset.itemdata) return;
    let itemData = JSON.parse(element.dataset.itemdata);

    navigator.sendBeacon("https://takzobye_mini-inventory/useItem", JSON.stringify({
        item: itemData
    }));
}

function openDisplay(type) {
    document.querySelector('.search-box').style.transition = '.75s';
    document.querySelector('#searchBox').value = '';

    displayType = type;

    if (type === 'player') {
        document.getElementById("container").style.maxWidth = "750px";
        document.querySelector('.topic').style.display = 'block'
        document.querySelector('.other-weight').style.display = 'none'
        document.querySelector('#otherInventory').style.display = 'none';
        document.querySelector('.fastSlot').style.display = 'flex';
    } else {
        document.getElementById("container").style.maxWidth = "1100px";
        document.querySelector('.topic').style.display = 'none';
        document.querySelector('.other-weight').style.display = 'block'
        document.querySelector('#otherInventory').style.display = 'grid';
        document.querySelector('.fastSlot').style.display = 'none';
    }

    document.querySelector('.container').style.visibility = 'visible';
}

function closeDisplay() {
    navigator.sendBeacon('https://takzobye_mini-inventory/closeDisplay', JSON.stringify({}));
    navigator.sendBeacon('https://takzobye_mini-inventory/NUIFocusOff', JSON.stringify({}));
}

document.querySelector('#searchBox').addEventListener('keyup', e => {
    let text = e.target.value;

    let slots = document.querySelectorAll('.slot');
    for (let i = 0; i < slots.length; i++) {
        let label = slots[i].querySelector('.item-name').innerText;

        if (!label.startsWith(text)) {
            slots[i].style.display = 'none';
        } else {
            slots[i].style.display = 'flex';
        }
    }

});
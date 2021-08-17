document.querySelector('#useAction').addEventListener('click', function(e) {
    if (displayType !== 'player') return;

    itemData = JSON.parse(e.target.parentNode.dataset.itemdata);

    navigator.sendBeacon("https://takzobye_mini-inventory/useItem", JSON.stringify({
        item: itemData,
    }));

    if (CONFIG.UseWillClose.includes(itemData.name)) {
        closeDisplay();
    }

    contextMenu.style.visibility = 'hidden';
});

document.querySelector('#giveAction').addEventListener('click', function(e) {
    if (displayType !== 'player') return;

    itemData = JSON.parse(e.target.parentNode.dataset.itemdata);

    if (CONFIG.DisableGive.includes(itemData.name)) return;

    openInputPopup('give')
});

document.querySelector('#dropAction').addEventListener('click', function(e) {
    if (displayType !== 'player') return;

    itemData = JSON.parse(e.target.parentNode.dataset.itemdata);

    if (CONFIG.DisableDrop.includes(itemData.name)) return;

    openInputPopup('drop')
});

document.querySelector('#renameAction').addEventListener('click', e => {
    if (displayType !== 'player') return;

    itemData = JSON.parse(e.target.parentNode.dataset.itemdata);

    if (CONFIG.DisableRename.includes(itemData.type)) return;

    openInputPopup('rename')
});

document.querySelector('#getMaxCount').addEventListener('click', e => {
    if (!itemData) return; // when itemData = false (null, undefined)

    document.querySelector('#inputBox').value = itemData.count;
});

document.querySelector('#confirmAction').addEventListener('click', e => {
    let count = +document.querySelector('#inputBox').value;
    if (!itemData || count <= 0) return; // when itemData = false (null, undefined)

    if (popupAction === 'getPlayer') {
        if (itemData.type === 'item_key') {
            closeDisplay();
        }

        navigator.sendBeacon("https://takzobye_mini-inventory/giveItem", JSON.stringify({
            item: itemData,
            number: giveCount,
            player: count
        }));
    } else if (popupAction === 'give') {
        giveCount = count;
        document.querySelector('#inputBox').placeholder = 'Enter Player ID';
        openInputPopup('getPlayer')
        return;
    } else if (popupAction === 'drop') {
        navigator.sendBeacon("https://takzobye_mini-inventory/dropItem", JSON.stringify({
            item: itemData,
            number: count
        }));
    } else if (popupAction === 'rename') {
        let input = document.querySelector('#inputBox').value;
        itemLabel[itemData.name] = input;

        navigator.sendBeacon("https://takzobye_mini-inventory/refreshInventory", JSON.stringify({}));
    }

    if (displayType === 'trunk') {

        if (popupAction === 'putInto') {
            navigator.sendBeacon("https://takzobye_mini-inventory/PutIntoTrunk", JSON.stringify({
                item: itemData,
                number: count
            }));
        } else if (popupAction === 'takeFrom') {
            navigator.sendBeacon("https://takzobye_mini-inventory/TakeFromTrunk", JSON.stringify({
                item: itemData,
                number: count
            }));
        }

    } else if (displayType === 'vault') {

        if (popupAction === 'putInto') {
            navigator.sendBeacon("https://takzobye_mini-inventory/PutIntoVault", JSON.stringify({
                item: itemData,
                number: count
            }));
        } else if (popupAction === 'takeFrom') {
            navigator.sendBeacon("https://takzobye_mini-inventory/TakeFromVault", JSON.stringify({
                item: itemData,
                number: count
            }));
        }
         
    } else if (displayType === 'otherPlayer') {
        navigator.sendBeacon("https://takzobye_mini-inventory/otherPlayerEvent", JSON.stringify({
            item: itemData,
            number: count,
            player: otherPlayerId,
            type: popupAction
        }));
    }

    closeInputPopup();
});

document.querySelector('#cancelAction').addEventListener('click', e => {
    closeInputPopup();
});

function openInputPopup(type) {
    popupAction = type;
    contextMenu.style.visibility = 'hidden';

    document.querySelector('#inputBox').value = '';
    document.querySelector('.input-popup').style.visibility = 'visible';

    let maxContainer = document.querySelector('.max-container');

    if (type == 'rename') {
        document.querySelector('#inputBox').placeholder = 'Enter new name';
        maxContainer.style.visibility = 'hidden';
    } else {
        maxContainer.style.visibility = 'visible';
    }
}

function closeInputPopup(type) {
    itemData = null;
    popupAction = null;
    giveCount = null;

    document.querySelector('#inputBox').placeholder = 'Enter count';
    document.querySelector('.max-container').style.visibility = 'hidden';
    document.querySelector('.input-popup').style.visibility = 'hidden';
}
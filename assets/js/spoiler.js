addEventListener('load', main);

function main() {
    if (location.toString().endsWith('?')) {
        for (element of document.getElementsByClassName('excerpt')) element.style.display = 'none';
        for (element of document.getElementsByClassName('spoiler')) element.style.display = '';
    }
}

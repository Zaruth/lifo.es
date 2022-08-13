var runes = document.getElementById('runes');
var base = document.getElementById('enchant_Base');
var spell = document.getElementById('spell');
var item = document.getElementById('item');
var effect = document.getElementById('effect');
var audio = document.getElementById("enchant_Audio");
audio.volume = 0.4;
var grades = 0;
var subGrades = 0.5;
var ms = 25;
var interval;

stopEffect();

function rotation(){
    runes.style.transform = 'rotate('+grades+'deg)';
    grades-=subGrades;
    if (grades==-360) grades=0;
}

function startRotation(){
    stopRotation();
    interval = setInterval(rotation, ms);
}

function stopRotation(){
    clearInterval(interval);
}

function startEffect(){
    effect.style.opacity = 1;
}

function stopEffect(){
    effect.style.opacity = 0;
}

function animate(){
    startEffect();
    effect.classList.add("animated_Effect");
    var clearScreen = document.createElement("div");
    clearScreen.classList.add("enchant_ClearScreen");
    clearScreen.classList.add("enchant_ClearScreen_Anim");
    runes.classList.add("enchant_move_base");
    base.classList.add("enchant_move_base");
    item.classList.add("enchant_move_item");

    document.body.append(clearScreen);
}

function enchant(){
	if (confirm('¿Está seguro?')) {
		var hidden = document.createElement("input");
		hidden.type = "hidden";
		hidden.name = "encantar";
		document.getElementById("enchant_form").append(hidden);
		stopRotation();
		subGrades = 3;
		startRotation();
		animate();
		audio.play();
		setTimeout(function(){
			document.getElementById("enchant_form").submit();
		}, 5440);
	}
}

function selectSpellImg(){
    var selectedValue = document.getElementById("s_spell").value;
    if(selectedValue!=0){
        var img = selectedValue.split("#")[1];
        spell.src = imgroot+img+".gif";
    } else {
        spell.src = "";
    }
    checkEnchant();
    //changeEsenceImg(selectedValue);
}
function selectItemType(selected = null){
    var selectedType = document.getElementById("s_item_type").value;
    var s_item = document.getElementById("s_item");
    cleanNode(s_item);
    var option = document.createElement("option");
    option.value = 0;
    option.innerHTML = "-- Seleccionar --";
    s_item.append(option);
    stopRotation();
    if(selectedType!=0){
        s_item.disabled = false;
        getItemsByType(selectedType, s_item, selected);
    } else {
        s_item.disabled = true;
    }
    item.src = "";
    checkEnchant();
}
function selectItemImg(){
    var selectedValue = document.getElementById("s_item").value;
    if(selectedValue!=0){
        var img = selectedValue.split("#")[2];
        item.src = imgroot+img+".gif";
        startRotation();
    } else {
        item.src = "";
        stopRotation();
    }
    checkEnchant();
}
function changePorc(value){
    var number = document.getElementById('numeroEsencias');
    if(value > number.max){
        number.value = number.max;
        value = number.max;
    }
    document.getElementById('porcEsencia').innerHTML = '(+'+value+'%)';
}
function changeEsenceImg(selectedValue){
    var checkbox = document.getElementById('checkEsencia');
    var number = document.getElementById('numeroEsencias');
    var esence = document.getElementById('imgEsencia');
    var nombre = document.getElementById('nombEsencia');
    var hidden = document.getElementById('essenceName');
    if(selectedValue!=0){
        var img = selectedValue.split("#")[1];
        checkbox.disabled = true;
        number.disabled = true;
        nombre.innerHTML = 'Esencia de hechizo';
        esence.src = imgsrc+'polest'+'.gif';
        hidden.value = 0;
        for(var i=0;i<esencias.length;i++){
            var esencia = esencias[i].split('#');
            tiene.nombreobj, objetos.img, tiene.cantidad, encantamientos.id, encantamientos.img
            console.log(img+' '+esencia[4]);
            if(img==esencia[4]){
                checkbox.disabled = false;
                number.disabled = false;
                number.max = (esencia[2]>80 ? 80 : esencia[2]);
                esence.src = imgsrc+esencia[1]+'.gif';
                nombre.innerHTML = esencia[0];
                hidden.value = esencia[0]+'#'+esencia[1];
                break;
            }
        }
    } else {
        checkbox.disabled = true;
        number.disabled = true;
        nombre.innerHTML = 'Esencia de hechizo';
        esence.src = imgsrc+'polest'+'.gif';
        hidden.value = 0;
    }
    number.value = 1;
    changePorc(1);
}

function getItemsByType(Type, node, selected = null){
    items.forEach(it => {
        var item = it.split("#");
        if(Type == item[1]){
            var option = document.createElement("option");
            option.value = it;
			if(selected!=null && option.value.includes(selected)){
				option.selected = true;
			}
            option.innerHTML = item[0]+" x"+item[3];
            node.append(option);
        }
    });
}

function cleanNode(myNode){
    while (myNode.firstChild) {
        myNode.removeChild(myNode.lastChild);
    }
}

function checkEnchant(){
    if(document.getElementById("s_spell").value!=0 && document.getElementById("s_item").value!=0)
        document.getElementById("btn_enchant").disabled = false;
    else
        document.getElementById("btn_enchant").disabled = true;
}

document.getElementById("script").remove();
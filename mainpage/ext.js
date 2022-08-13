function runonLoad() {
 if (!document.getElementsByTagName) return;
 var anchors = document.getElementsByTagName("a");
 for (var i=0; i<anchors.length; i++) {
   var anchor = anchors[i];
   if (anchor.getAttribute("href") &&
       anchor.getAttribute("rel") == "external")
     anchor.target = "_blank";
 }
}
window.onload = runonLoad;


var horas = 01 //establece las horas
var minutos = 10 //establece los minutos
var segundos = 05 //establece los segundos
var horas2,minutos2,segundos2
function cuentaAtras(){
  if(segundos > 0){
    segundos--
  }
  else{
    if(minutos > 0){
      segundos = 59;
      minutos--
    }
    else{
      if(horas > 0){
        segundos = 59;
        minutos = 59;
        horas--
      }
    }
  }
  ceros()
  document.getElementById('ca').firstChild.nodeValue = horas2 + ":" + minutos2 + ":" + segundos2
  if(horas > 0 || minutos > 0 || segundos > 0){
    tiempo = setTimeout('cuentaAtras()',1000)
  }
}
function ceros(){
  segundos.toString().length < 2 ? segundos2="0" + segundos : segundos2 = segundos
  minutos.toString().length < 2 ? minutos2="0" + minutos : minutos2 = minutos
  horas.toString().length < 2 ? horas2="0" + horas : horas2 = horas
}
function inicia(tiempo) {
  horas = parseInt(tiempo/3600);
  tiempo = tiempo%3600;
  minutos = parseInt(tiempo/60);
  segundos = tiempo%60;
  setTimeout('cuentaAtras()',2000);
}
var enviado = 0
function c(e) {
  if (typeof e=="undefined")
    e = ''
  if (enviado == 0) {
    if (confirm('¿Está seguro? '+e)) {
      enviado = 1;
      setTimeout('enviado = 0',10000);
      return true
    }
    else {
      return false
    }
  }
  else {
    return false
  }
}






// antiHOYGAN
// Script URI: http://www.nopuedocreer.com/quelohayaninventado/?page_id=203
// Description: "Filtro antiHOYGAN"
// Author: Dani "Troy" Gonzalez
// Version: 1.0
// Author URI: http://www.hevistocosas.com 

function filterHOYGAN (texto)
{
	swHOYGAN=false;
	msgError="";

	numLetras=texto.length;
	numMayusculas=0;
	for (i=0;i<numLetras;i++)
		if (texto.charAt(i)>='A' && texto.charAt(i)<='Z' && texto.charAt(i)!='D')
			numMayusculas++;
        if (numLetras>15 && numMayusculas>numLetras/2)			
        {
		swHOYGAN=true;
		msgError="Error: Aprenda a escribir. Está usando demasiadas mayúsculas.\n\nRevise su mensaje y vuelva a intentarlo, por favor.";
	}
	else
	{
		textoLower=texto.toLowerCase();
		textoLower=" "+textoLower+" ";
		textoLower=textoLower.replace("\n"," ");
		textoLower=textoLower.replace("."," ");
		textoLower=textoLower.replace(","," ");
		textoLower=textoLower.replace(":"," ");
		textoLower=textoLower.replace("?"," ");
		textoLower=textoLower.replace("!"," ");
		textoLower=textoLower.replace("¿"," ");
		textoLower=textoLower.replace("¡"," ");
		textoLower=textoLower.replace(";"," ");
		HOYGANseed = new Array("fabor","kiero","nesecito","nesesito","plis","pliss","grasias","antebraso","con migo","ke","k","q","pq","xq","x","puta","pendejo","polla","poya","coño","selestial","hoygan","hogos","heches","acer","keremos","demaciado","eces","escremento","dspues","ablar","sto","funsiona","voi","nabegador","ave","aver","ha ber","haver","hai","zi","io","ermano","yes","please","thanks","thank","kien","pormelo","eleseta","jabe","boi","musho","qu","qe","n","m","dja","ns","vmos","bmos","vems","bems","grasia","insignea","asin","haci","soi","bendo","vusco","trueke","canvio","aseitunas","menues","corasa","grimonio","gurmet","gerra","premiun","experiensia","algien","weno","alluda","haser","posiones","posimas","hechiso","monge","jolla","ovserbador","bhuo","aseptar","cienpre","ciempre","dimencion","tanbien","tamvien","peliar","mienbro","convense","muxo","aki","baniado","rovado","apollo","salvage","mensage","amenasa","porfavor","porfabor","escogo","cogo","cojer","exigo","ekibocado","escrivir","avlar","havlar","i","olle","porke","yeba","yeva","lleba","livro","erohe","bale");
		for (i=0;i<HOYGANseed.length;i++)
		{
			if (textoLower.indexOf(" "+HOYGANseed[i]+" ")!=-1)
			{
				swHOYGAN=true;
                                msgError="Error: Aprenda a escribir. \""+HOYGANseed[i]+"\" no es una palabra válida.\n\nRevise su mensaje y vuelva a intentarlo, por favor."
				break;
			}	
		}
	}
	if (swHOYGAN)
	{	
		alert (msgError);
		return false;
    }
    return true;
}

function countDown()
{
	toYear=2017;
	toMonth=6;
	toDay=30;
	toHour=14;
	toMinute=00;
	toSecond=00;
	
	new_year=0;
	new_month=0;
	new_day=0;
	new_hour=0;
	new_minute=0;
	new_second=0;
	actual_date=new Date();
	if(actual_date.getFullYear()>toYear)
	{
		//si ya nos hemos pasado del año, mostramos los valores a 0
		form.second.value=0;
		form.minute.value=0;
		form.hour.value=0;
		form.day.value=0;
		form.month.value=0;
		form.year.value=0;
	}else{
		new_second=new_second+toSecond-actual_date.getSeconds();
		if(new_second<0)
		{
			new_second=60+new_second;
			new_minute=-1;
		}
		form.second.value=new_second;
		new_minute=new_minute+toMinute-actual_date.getMinutes();
		if(new_minute<0)
		{
			new_minute=60+new_minute;
			new_hour=-1;
		}
		form.minute.value=new_minute;
		new_hour=new_hour+toHour-actual_date.getHours();
		if(new_hour<0)
		{
			new_hour=24+new_hour;
			new_day=-1;
		}
		form.hour.value=new_hour;
		new_day=new_day+toDay-actual_date.getDate();
		if(new_day<0)
		{
			x=actual_date.getMonth();
			if(x==0||x==2||x==4||x==6||x==7||x==9||x==11){new_day=31+new_day;}
			if(x==3||x==5||x==8||x==10){new_day=30+new_day;}
			if(x==1)
			{
				//comprobamos si es un año bisiesto...
				if(actual_date.getYear()/4-Math.floor(actual_date.getYear()/4)==0)
				{
					actual_date=29+actual_date;
				}else{
					actual_date=28+actual_date;
				}
			}
		}
		form.day.value=new_day;
		new_month=-1;
		new_month=new_month+toMonth-actual_date.getMonth();
		if(new_month<0)
		{
			new_month=11+new_month;
			new_year=-1;
		}
		form.month.value=new_month;
		new_year=new_year+toYear-actual_date.getFullYear();
		if(new_year<0)
		{
			form.year.value=0;
		}else{
			form.year.value=new_year;
			//vuelve a ejecutar la funcion dentro de 1000 milisegundos = 1 segundo
			setTimeout("countDown()",1000);
		}
	}
}
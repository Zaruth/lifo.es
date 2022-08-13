<?php
require_once('w_config.php');

function encryptXor($string){
	global $xorPass;
	$inputtype=16;
	$inputtext=strToHex($string);
	$keytype=16;
	$keytext=strToHex($xorPass);
	$xor1 = gmp_init($inputtext, $inputtype);
	$xor2 = gmp_init($keytext, $keytype);
	$xor3 = gmp_xor($xor1, $xor2);
	$salida = gmp_strval($xor3,16);
	return $salida;
}

function desencryptXor($string){
	global $xorPass;
	$inputtype=16;
	$inputtext=$string;
	$keytype=16;
	$keytext=strToHex($xorPass);
	$xor1 = gmp_init($inputtext, $inputtype);
	$xor2 = gmp_init($keytext, $keytype);
	$xor3 = gmp_xor($xor1, $xor2);
	$salida = hexToStr(gmp_strval($xor3,16));
	return $salida;
}

/*
echo '
<p>Calculadora XOR</p>
<form action="xor.php" method="post">
	<label>INPUT:</label>
	<select name="inputtype">
		<option value="2">Binary (base 2)</option>
		<option value="10">Decimal (base 10)</option>
		<option value="16">Hexadecimal (base 16)</option>
		<option value="256">ASCII (base 256)</option>
	</select>
	<input type="text" name="inputtext" value="0">
	<br>
	<label>PRIVATE-KEY: </label>
	<select name="keytype">
		<option value="2">Binary (base 2)</option>
		<option value="10">Decimal (base 10)</option>
		<option value="16">Hexadecimal (base 16)</option>
		<option value="256" selected="selected">ASCII (base 256)</option>
	</select>
	<input type="text" name="keytext" value="abc">
	<br>
	<input type="submit" title="Calcular" name="calculate">
	<br><br><br>
	<label>OUTPUT:</label>
	<select name="outputtype">
		<option value="2">Binary (base 2)</option>
		<option value="10">Decimal (base 10)</option>
		<option value="16">Hexadecimal (base 16)</option>
		<option value="256">ASCII (base 256)</option>
	</select>
</form>
<br>
';
$salida='';
if(isset($_POST['calculate'])){
	$inputtype=$_POST['inputtype'];
	$inputtext=$_POST['inputtext'];
	$keytype=$_POST['keytype'];
	$keytext=$_POST['keytext'];
	$outputtype=$_POST['outputtype'];
	
	if($inputtype == 256){
		$inputtype=16;
		$inputtext=strToHex($inputtext);
	}
	if($keytype == 256){
		$keytype=16;
		$keytext=strToHex($keytext);
	}
	$xor1 = gmp_init($inputtext, $inputtype);
	$xor2 = gmp_init($keytext, $keytype);
	$xor3 = gmp_xor($xor1, $xor2);
	
	if ($outputtype==256) {
		$salida = hexToStr(gmp_strval($xor3,16));
	} else {
		$salida = gmp_strval($xor3,$outputtype);
	}
}
echo "Salida -> {$salida}";
*/

function strToHex($string){
    $hex = '';
    for ($i=0; $i<strlen($string); $i++){
        $ord = ord($string[$i]);
        $hexCode = dechex($ord);
        $hex .= substr('0'.$hexCode, -2);
    }
    return strToUpper($hex);
}
function hexToStr($hex){
    $string='';
    for ($i=0; $i < strlen($hex)-1; $i+=2){
        $string .= chr(hexdec($hex[$i].$hex[$i+1]));
    }
    return $string;
}

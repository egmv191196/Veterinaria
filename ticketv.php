<?php
require('./fpdf/fpdf.php');

$pdf = new FPDF('P','mm',array(80,150)); // Tamaño tickt 80mm x 150 mm (largo aprox)
$pdf->AddPage();
$pdf->SetMargins(2, 5, 5);
// CABECERA
$pdf->Image('img/BALBI-sin-fondo.png',2,8,15);
$pdf->SetFont('Helvetica','',11);
$pdf->Cell(65,4,'Farmacia Veterinaria Balbi',0,1,'C');
$pdf->SetFont('Helvetica','',8);
$pdf->Cell(75,4,'RFC:MEML740112FM9',0,1,'C');
$pdf->Cell(75,4,'16 de Septiembre #1512 Int, 2',0,1,'C');
$pdf->Cell(75,4,'C.P.: 74325 Chipilo Pue',0,1,'C');
$pdf->Cell(75,4,'2222830571',0,1,'C');
$pdf->Cell(75,4,'vetbalbi@hotmail.com',0,1,'C');
 
// DATOS FACTURA        
$pdf->Ln(2);
$pdf->Cell(60,3,'Fecha: ',-5,1,'');
$pdf->Cell(10,3,'No Nota: ',0,1,'');
$pdf->Cell(10,3,'Vendedor: ',0,1,'');
$pdf->Cell(10,3,'Cliente: ',0,1,'');
// COLUMNAS
$pdf->SetFont('Helvetica', 'B', 7);
$pdf->Cell(10, 10, 'Codigo', 0);
$pdf->Cell(10, 10, 'Cant.',0,0,'R');
$pdf->Cell(35, 10, 'Articulo', 0);
$pdf->Cell(10, 10, 'Prec. Unit',0,0,'R');
$pdf->Cell(10, 10, 'Total',0,0,'R');
$pdf->Ln(8);
$pdf->Cell(75,0,'','T');
$pdf->Ln(0);
 
// PRODUCTOS

// SUMATORIO DE LOS PRODUCTOS Y EL IVA
$pdf->Ln(1);
$pdf->Cell(75,0,'','T');
$pdf->Ln(1);        
$pdf->Cell(25, 10, 'TOTAL', 0);    
$pdf->Cell(20, 10, '', 0);
$pdf->Cell(15, 10,0,0,'R');
 
// PIE DE PAGINA
$pdf->Ln(10);
$pdf->Cell(60,0,'Gracias por su compra ',0,1,'C');

$pdf->Output('ticket.pdf','i');
?>

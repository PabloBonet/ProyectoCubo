SELECT R.fecha, STRTRAN(STR(YEAR(R.fecha),4)," ","0")+STRTRAN(STR(MONTH(R.fecha),2)," ","0") as grupo,  r.idrecibo, D.importe ;
	FROM Detpagosprov D LEFT JOIN Recibosprov R ON R.idrecibo = D.idrecibo ;
	INTO TABLE c:\temp\cheques1 WHERE tipopago = 2 AND detercero = 2 AND !DELETED()


SELECT grupo, sum(importe) as total FROM cheques1 INTO TABLE c:\temp\cheques2 ORDER BY grupo GROUP BY grupo 

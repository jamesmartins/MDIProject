USE [Producao_teste]
GO
/****** Object:  View [dbo].[vw_op_andamento]    Script Date: 03/04/2013 10:09:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vw_op_andamento]
AS
SELECT     TOP (100) PERCENT dbo.DEPTOS.DESCRICAO, 
					dbo.ORDPROD.NRO_ORDPROD, 
					dbo.PRODUTOS.COD_PRODUTO, 
					dbo.PRODUTOS.DESCRICAO AS titulo, 
                    dbo.ORDPROD.TIRAGEM, 
					dbo.HorasOP.HorasPrevistas, 
					dbo.vw_horas_op_real.total_horas, 
					dbo.OPPROGMA.DT_ENT_REAL, 
					dbo.OPPROGMA.DT_SAI_PROG, 
                    CASE WHEN DATEDIFF(dd, dbo.OPPROGMA.DT_SAI_PROG, GETDATE()) > 0 THEN DATEDIFF(dd, dbo.OPPROGMA.DT_SAI_PROG, GETDATE()) ELSE 0 END AS atraso,
                          (SELECT     Descricao
                            FROM      dbo.TMovInt
                            WHERE    (Codigo IN
                                                       (SELECT     Cod_MovInt
                                                         FROM      dbo.OPHIST
                                                         WHERE     (Sequencia IN
                                                                                    (SELECT     MAX(Sequencia) AS expr1
                                                                                      FROM          dbo.OPHIST AS ophist_1
                                                                                      WHERE      (dbo.ORDPROD.NRO_ORDPROD = NRO_ORDPROD) AND (dbo.ORDPROD.Depto_Atual = COD_DEPTO)))))) AS movimento, 
                    dbo.ORDPROD.Depto_Atual AS depto, 
					dbo.ORDPROD.OP_Projeto, 
					dbo.PRODUTOS.DescricaoProjeto, 
					dbo.ORDPROD.COD_CLIENTE, 
					dbo.CLIENTE.Cod_EMS, 
                    dbo.PRODUTOS.COD_ESPECIF AS cod_ref, 
					dbo.ESPECIF.DESCRICAO AS referencia, 
					dbo.PRODUTOS.COD_GPESTOQ, 
                    dbo.GRPESTOQ.DESCRGPEST AS grupo_estoque, 
					dbo.PRODUTOS.TOTALPAGINAS, 
					dbo.ORDPROD.OP_Reporte, 
					dbo.PRODUTOS.Cod_Tema, 
                    dbo.ORDPROD.statusISBN, 
					dbo.ORDPROD.statusFichaCatalografica,
					dbo.ORDPROD.qtdeTotalEntrega
FROM				dbo.PRODUTOS (nolock)
					LEFT OUTER JOIN
                    dbo.GRPESTOQ  ON dbo.PRODUTOS.COD_GPESTOQ = dbo.GRPESTOQ.COD_GPESTOQ LEFT OUTER JOIN
                    dbo.ESPECIF ON dbo.PRODUTOS.COD_ESPECIF = dbo.ESPECIF.COD_ESPECIF RIGHT OUTER JOIN
                    dbo.ORDPROD (nolock) INNER JOIN
                    dbo.DEPTOS ON dbo.ORDPROD.Depto_Atual = dbo.DEPTOS.COD_DEPTO ON dbo.PRODUTOS.COD_PRODUTO = dbo.ORDPROD.COD_PRODUTO LEFT OUTER JOIN
                    dbo.CLIENTE ON dbo.ORDPROD.COD_CLIENTE = dbo.CLIENTE.COD_CLIENTE AND dbo.PRODUTOS.Cod_Cliente = dbo.CLIENTE.COD_CLIENTE LEFT OUTER JOIN
                    dbo.OPPROGMA ON dbo.ORDPROD.NRO_ORDPROD = dbo.OPPROGMA.NRO_ORDPROD AND 
                    dbo.ORDPROD.Depto_Atual = dbo.OPPROGMA.COD_DEPTO LEFT OUTER JOIN
                    dbo.vw_horas_op_real ON dbo.ORDPROD.NRO_ORDPROD = dbo.vw_horas_op_real.Nro_OrdProd AND 
                    dbo.ORDPROD.Depto_Atual = dbo.vw_horas_op_real.Cod_Depto LEFT OUTER JOIN
                    dbo.HorasOP ON dbo.ORDPROD.NRO_ORDPROD = dbo.HorasOP.OP AND dbo.ORDPROD.Depto_Atual = dbo.HorasOP.COD_DEPTO
WHERE     (ISNULL(dbo.ORDPROD.OP_Reporte, 0) = 0) AND (dbo.ORDPROD.NRO_ORDPROD IN
                          (SELECT     NRO_ORDPROD
                            FROM          dbo.OPPROGMA AS OPPROGMA_1
                            WHERE      (NRO_ORDPROD = dbo.ORDPROD.NRO_ORDPROD) AND (ISNULL(DT_ENT_REAL, 0) = 0 OR
                                                   ISNULL(DT_ENT_REAL, 0) <> 0 AND ISNULL(DT_SAI_REAL, 0) = 0)))
ORDER BY depto, titulo

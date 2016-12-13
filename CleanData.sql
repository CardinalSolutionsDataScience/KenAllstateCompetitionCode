USE Marketing;
--SELECT * FROM Ken.TrainSet
SELECT  id
, cat1
, cat2
, cat3
, cat4
, cat5
, cat6
, cat7
, cat8
, cat9
, cat10
, cat11
, cat12
, cat13
, cat14
--, cat15 --nearly constant, remove
, cat16
, cat17
, cat18
, cat19
, cat20
, cat21
--, cat22 --nearly constant, remove
, cat23
, cat24
, cat25
, cat26
, cat27
, cat28
, cat29
, cat30
, cat31
, cat32
, cat33
, cat34
, cat35
, cat36
, cat37
, cat38
, cat39
, cat40
, cat41
, cat42
, cat43
, cat44
, cat45
, cat46
, cat47
, cat48
, cat49
, cat50
, cat51
, cat52
, cat53
, cat54
, cat55
, cat56
, cat57
, cat58
, cat59
, cat60
, cat61
--, cat62 --nearly constant, remove
--, cat63 --nearly constant, remove
--, cat64 --nearly constant, remove
, cat65
, cat66
, cat67
, cat68
, cat69
--, cat70 --nearly constant, remove
, cat71
, cat72
, CASE WHEN cat73 = 'C' THEN 'A' ELSE cat73 END cat73
, CASE WHEN cat74 = 'C' THEN 'A' ELSE cat74 END cat74
, CASE WHEN cat75 = 'C' THEN 'A' ELSE cat75 END cat75
, cat76
, cat77
, cat78
, cat79
, cat80
, cat81
, cat82
, cat83
, cat84
, cat85
, cat86
, cat87
, CASE WHEN cat88 NOT IN ('A', 'D') THEN 'other' ELSE cat88 END cat88
, CASE WHEN cat89 NOT IN ('A','B') THEN 'other' ELSE cat89 END cat89
, CASE WHEN cat90 NOT IN ('A', 'B', 'C') THEN 'other' ELSE cat90 END cat90
, CASE WHEN cat91 NOT IN ('A', 'B', 'C', 'D', 'G') THEN 'other' ELSE cat91 END cat91
, CASE WHEN cat92 NOT IN ('A', 'H', 'B') THEN 'other' ELSE cat92 END cat92
, CASE WHEN cat93 NOT IN ('A', 'B', 'C', 'D') THEN 'E' ELSE cat93 END cat93
, CASE WHEN cat94 not in ('A', 'B', 'C', 'D', 'F') THEN 'other' ELSE cat94 END cat94
, CASE WHEN cat95 NOT IN ('A', 'C', 'D', 'E') THEN 'other' ELSE cat95 END cat95
, CASE WHEN cat96 NOT IN ('E', 'D', 'B', 'G') THEN 'other' ELSE cat96 END cat96
, CASE WHEN cat97 NOT IN ('A', 'C', 'D', 'E', 'G') THEN 'other' ELSE cat97 END cat97
, CASE WHEN Cat98 NOT IN ('A', 'C', 'D', 'E') THEN 'other' ELSE cat98 END cat98
, CASE WHEN cat99 NOT IN ('D', 'E', 'F', 'K', 'N', 'P', 'R', 'S', 'T') THEN 'other' ELSE cat99 END cat99
, CASE WHEN Cat100 NOT IN ('A', 'B', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'N', 'M', 'O') THEN 'other' ELSE cat100 END cat100
, CASE WHEN Cat101 NOT IN ('A', 'C', 'D', 'F', 'G', 'I', 'J', 'L', 'M', 'O', 'Q') THEN 'other' ELSE cat101 END cat101
, CASE WHEN cat102 NOT IN ('A', 'B', 'C') THEN 'other' ELSE cat102 END cat102
, CASE WHEN Cat103 NOT IN ('A', 'B', 'C', 'D', 'E', 'F') THEN 'other' ELSE cat103 END cat103
, CASE WHEN cat104 NOT IN ('C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M') THEN 'other' ELSE cat104 END cat104
, CASE WHEN cat105 NOT IN ('D', 'E', 'F', 'G', 'H', 'I') THEN 'other' ELSE cat105 END cat105
, CASE WHEN cat106 NOT IN ('D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M') THEN 'other' ELSE cat106 END cat106
, CASE WHEN cat107 NOT IN ('D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M') THEN 'other' ELSE cat107 END cat107
, CASE WHEN cat108 NOT IN ('A', 'B', 'D', 'E', 'F', 'G', 'H', 'I', 'K') THEN 'other' ELSE cat108 END cat108
, CASE WHEN cat109 NOT IN ('AB', 'BI', 'BQ', 'BU', 'G', 'K') THEN 'other' ELSE cat109 END cat109
, CASE WHEN Cat110 NOT IN ('A', 'C', 'AI', 'BC', 'BP', 'BS', 'BT', 'C', 'CI'
				, 'CL', 'CM', 'CO', 'CQ', 'CS', 'DK', 'DM', 'DW', 'DX'
				, 'EB', 'EE', 'EF', 'EG', 'EL', 'V', 'W') THEN 'other' ELSE cat110 END cat110
, CASE WHEN cat111 NOT IN ('A', 'C', 'E', 'G', 'I', 'K', 'M', 'O') THEN 'other' ELSE cat111 END cat111
, CASE WHEN cat112 NOT IN ('A', 'AA', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI'
							, 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AR', 'AS', 'AT', 'AV', 'AW', 'AX', 'AY'
							, 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'N', 'O', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y') 
							THEN 'other' ELSE cat112 END cat112
, CASE WHEN cat113 NOT IN ('A', 'AD', 'AE', 'AF', 'AG', 'AJ', 'AK', 'AM'
							, 'AN', 'AO', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'BC', 'BG', 'BH', 'BJ'
							, 'BK', 'BM', 'BN', 'BO', 'F', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Q', 'S'
							, 'X', 'Y') THEN 'other' ELSE cat113 END cat113
, CASE WHEN cat114 NOT IN ('A', 'C', 'E', 'F', 'I', 'J', 'L', 'N', 'R') THEN 'other' ELSE cat114 END cat114
, CASE WHEN cat115 NOT IN ('H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R') THEN 'other' ELSE cat115 END cat115
, CASE WHEN cat116 NOT IN ('BY', 'CB', 'CI', 'CK', 'CR', 'CS', 'CW', 'DC', 'DF'
							, 'DJ', 'DK', 'DP', 'DS', 'EC', 'EK', 'FB', 'FC', 'FR'
							, 'GC', 'GE', 'GI', 'GK', 'GN', 'GS', 'GU', 'GX', 'HA'
							, 'HB', 'HC', 'HG', 'HH', 'HJ', 'HK', 'HL', 'HM', 'HN'
							, 'HQ', 'HV', 'HX', 'IC', 'IE', 'IF', 'IG', 'IH', 'JR'
							, 'KA', 'KC', 'KR', 'KW', 'LB', 'LF', 'LM', 'LN', 'LO'
							, 'LQ', 'LW', 'LY', 'MD', 'MJ') THEN 'other' ELSE cat116 END cat116
, cont1
, cont2
, cont3
, cont4
, cont5
, cont6
, cont7
, cont8
, cont9
, cont10
, cont11
, cont12
, cont13
, cont14
, loss
--SELECT cat100, COUNT(*)
FROM Ken.TrainSet



SELECT  id
, cat1
, cat2
, cat3
, cat4
, cat5
, cat6
, cat7
, cat8
, cat9
, cat10
, cat11
, cat12
, cat13
, cat14
--, cat15 --nearly constant, remove
, cat16
, cat17
, cat18
, cat19
, cat20
, cat21
--, cat22 --nearly constant, remove
, cat23
, cat24
, cat25
, cat26
, cat27
, cat28
, cat29
, cat30
, cat31
, cat32
, cat33
, cat34
, cat35
, cat36
, cat37
, cat38
, cat39
, cat40
, cat41
, cat42
, cat43
, cat44
, cat45
, cat46
, cat47
, cat48
, cat49
, cat50
, cat51
, cat52
, cat53
, cat54
, cat55
, cat56
, cat57
, cat58
, cat59
, cat60
, cat61
--, cat62 --nearly constant, remove
--, cat63 --nearly constant, remove
--, cat64 --nearly constant, remove
, cat65
, cat66
, cat67
, cat68
, cat69
--, cat70 --nearly constant, remove
, cat71
, cat72
, CASE WHEN cat73 = 'C' THEN 'A' ELSE cat73 END cat73
, CASE WHEN cat74 = 'C' THEN 'A' ELSE cat74 END cat74
, CASE WHEN cat75 = 'C' THEN 'A' ELSE cat75 END cat75
, cat76
, cat77
, cat78
, cat79
, cat80
, cat81
, cat82
, cat83
, cat84
, cat85
, cat86
, cat87
, CASE WHEN cat88 NOT IN ('A', 'D') THEN 'other' ELSE cat88 END cat88
, CASE WHEN cat89 NOT IN ('A','B') THEN 'other' ELSE cat89 END cat89
, CASE WHEN cat90 NOT IN ('A', 'B', 'C') THEN 'other' ELSE cat90 END cat90
, CASE WHEN cat91 NOT IN ('A', 'B', 'C', 'D', 'G') THEN 'other' ELSE cat91 END cat91
, CASE WHEN cat92 NOT IN ('A', 'H', 'B') THEN 'other' ELSE cat92 END cat92
, CASE WHEN cat93 NOT IN ('A', 'B', 'C', 'D') THEN 'E' ELSE cat93 END cat93
, CASE WHEN cat94 not in ('A', 'B', 'C', 'D', 'F') THEN 'other' ELSE cat94 END cat94
, CASE WHEN cat95 NOT IN ('A', 'C', 'D', 'E') THEN 'other' ELSE cat95 END cat95
, CASE WHEN cat96 NOT IN ('E', 'D', 'B', 'G') THEN 'other' ELSE cat96 END cat96
, CASE WHEN cat97 NOT IN ('A', 'C', 'D', 'E', 'G') THEN 'other' ELSE cat97 END cat97
, CASE WHEN Cat98 NOT IN ('A', 'C', 'D', 'E') THEN 'other' ELSE cat98 END cat98
, CASE WHEN cat99 NOT IN ('D', 'E', 'F', 'K', 'N', 'P', 'R', 'S', 'T') THEN 'other' ELSE cat99 END cat99
, CASE WHEN Cat100 NOT IN ('A', 'B', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'N', 'M', 'O') THEN 'other' ELSE cat100 END cat100
, CASE WHEN Cat101 NOT IN ('A', 'C', 'D', 'F', 'G', 'I', 'J', 'L', 'M', 'O', 'Q') THEN 'other' ELSE cat101 END cat101
, CASE WHEN cat102 NOT IN ('A', 'B', 'C') THEN 'other' ELSE cat102 END cat102
, CASE WHEN Cat103 NOT IN ('A', 'B', 'C', 'D', 'E', 'F') THEN 'other' ELSE cat103 END cat103
, CASE WHEN cat104 NOT IN ('C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M') THEN 'other' ELSE cat104 END cat104
, CASE WHEN cat105 NOT IN ('D', 'E', 'F', 'G', 'H', 'I') THEN 'other' ELSE cat105 END cat105
, CASE WHEN cat106 NOT IN ('D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M') THEN 'other' ELSE cat106 END cat106
, CASE WHEN cat107 NOT IN ('D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M') THEN 'other' ELSE cat107 END cat107
, CASE WHEN cat108 NOT IN ('A', 'B', 'D', 'E', 'F', 'G', 'H', 'I', 'K') THEN 'other' ELSE cat108 END cat108
, CASE WHEN cat109 NOT IN ('AB', 'BI', 'BQ', 'BU', 'G', 'K') THEN 'other' ELSE cat109 END cat109
, CASE WHEN Cat110 NOT IN ('A', 'C', 'AI', 'BC', 'BP', 'BS', 'BT', 'C', 'CI'
				, 'CL', 'CM', 'CO', 'CQ', 'CS', 'DK', 'DM', 'DW', 'DX'
				, 'EB', 'EE', 'EF', 'EG', 'EL', 'V', 'W') THEN 'other' ELSE cat110 END cat110
, CASE WHEN cat111 NOT IN ('A', 'C', 'E', 'G', 'I', 'K', 'M', 'O') THEN 'other' ELSE cat111 END cat111
, CASE WHEN cat112 NOT IN ('A', 'AA', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI'
							, 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AR', 'AS', 'AT', 'AV', 'AW', 'AX', 'AY'
							, 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'N', 'O', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y') 
							THEN 'other' ELSE cat112 END cat112
, CASE WHEN cat113 NOT IN ('A', 'AD', 'AE', 'AF', 'AG', 'AJ', 'AK', 'AM'
							, 'AN', 'AO', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'BC', 'BG', 'BH', 'BJ'
							, 'BK', 'BM', 'BN', 'BO', 'F', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'Q', 'S'
							, 'X', 'Y') THEN 'other' ELSE cat113 END cat113
, CASE WHEN cat114 NOT IN ('A', 'C', 'E', 'F', 'I', 'J', 'L', 'N', 'R') THEN 'other' ELSE cat114 END cat114
, CASE WHEN cat115 NOT IN ('H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R') THEN 'other' ELSE cat115 END cat115
, CASE WHEN cat116 NOT IN ('BY', 'CB', 'CI', 'CK', 'CR', 'CS', 'CW', 'DC', 'DF'
							, 'DJ', 'DK', 'DP', 'DS', 'EC', 'EK', 'FB', 'FC', 'FR'
							, 'GC', 'GE', 'GI', 'GK', 'GN', 'GS', 'GU', 'GX', 'HA'
							, 'HB', 'HC', 'HG', 'HH', 'HJ', 'HK', 'HL', 'HM', 'HN'
							, 'HQ', 'HV', 'HX', 'IC', 'IE', 'IF', 'IG', 'IH', 'JR'
							, 'KA', 'KC', 'KR', 'KW', 'LB', 'LF', 'LM', 'LN', 'LO'
							, 'LQ', 'LW', 'LY', 'MD', 'MJ') THEN 'other' ELSE cat116 END cat116
, cont1
, cont2
, cont3
, cont4
, cont5
, cont6
, cont7
, cont8
, cont9
, cont10
, cont11
, cont12
, cont13
, cont14
--, loss
--SELECT cat100, COUNT(*)
FROM Ken.TestSet

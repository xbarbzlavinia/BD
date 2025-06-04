--No dia 11 de outubro de 2016, Corinthians e São Paulo jogaram pela 
--rodada 36. Informe o time, nome dos jogadores e também o minuto dos
--gols dessa partida!

select g.clube, g.atleta, g.minuto
from jogos as j
inner join gols g on j.rodada = g.rodada
where j.rodada = '36' and
j.data = '2016-10-11' and
g.clube in ('Corinthians', 'Sao Paulo')

--No ano de 2024, liste todos os jogos que o vasco ganhou em Estádio 
--São Januário, infonando o adversário e o placar do jogo 
--(Gols do Mandante X Gols do Visitante).

select j.data, "mandante", "arena", "visitante", "mandante_placar" || 'x' || "visitante_placar" as placar
from jogos j
where EXTRACT(YEAR FROM j.data) = 2024 and
"mandante" = 'Vasco' and
"arena" = 'Estádio São Januário'

--Liste o nome do clube, quantidade de chutes e chutes no gol realizados 
--pelos clubes mandantes nas rodadas 10, 11, 12, 13 e 15 do campeonato 
--de 2019.

select distinct j.data, e.clube, e.chutes, e.chutes_no_gol, e.rodada
from jogos j
join estatisticas e on j.rodada = e.rodada
where e.rodada in ('10', '11', '12', '13', '15') and
EXTRACT(YEAR FROM j.data) = 2019 and
e.clube = j.mandante

--Mostre o nome do atleta que fez o gol, o nome do clube e a arena em 
--que o gol foi marcado.

select distinct g.atleta, g.clube, j.arena
from gols g
inner join jogos j on g.clube = 
j.mandante

--Crie uma consulta que liste o nome do atleta, o clube, o minuto em que 
--recebeu o cartão e o nome do técnico do time naquele jogo.

select distinct c.atleta, c.clube,
c.minuto, j1.tecnico_mandante as tecnico_mandante, j2.tecnico_visitante as tecnico_visitante
from cartoes c
left join jogos j1 on c.rodada =
j1.rodada and c.clube = j1.mandante
left join jogos j2 on c.rodada = 
j2.rodada and c.clube = j2.visitante
where j1.tecnico_mandante is not null or j2.tecnico_visitante is not null

--Liste, para cada clube que jogou na rodada 5, o total de gols marcados, 
--a quantidade de chutes a gol e a média de precisão de passes. 
--Ordene os resultados do clube que mais marcou gols para o que menos 
--marcou.

--???????????



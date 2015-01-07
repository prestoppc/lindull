--[[ SOBRE OS DIAS QUE INICIARAM O SCRIPT

saquei bro. iniciando test script lua primeira vez no ubuntu

buzios, 28-12-2014, 15:24

buzios, 30-12, por volta das 10 da manha. meu aniversario e git criado, feito no ipad

sendo escrito na praia.

petropolis, 31-12, atualizando script no git

--]]


-- NECROMANCER / TINY NECROMANCER /
-- criado por Presto

--[[ INDICE
OVERVIEW
NAMES
ATRIBUTOS
MANA E PONTOS DE VIDA
MOVIMENTACAO
ATAQUE E DEFESA
EXTRAS
SKILLS PHYSICAL
SKILLS MENTAL
MAGIAS
MODS
VIDEO
CONTROLS
--]]

--[[ OVERVIEW

um jogo em que se joga com um necromante que vai evoluindo o personagem,

levantando zumbis, atacando territorios de outros necromantes e diversos

inimigos. O jogo vai de micro a macro management, podendo jogar com o

necromante onde pode procurar por corpos e fazer magias zumbi para

levantar suas criaturas; e macro quando quiser administrar suas tropas

zumbis, ordenando que ataquem certas regioes, dominar territorios

e evoluir suas tropas e estruturas. A passagem do micro pro macro

deveria correr na fluidez do scroll up/down, podendo aproximar jogando

diretamente com o personagem, ou afastar podendo coordenar movimentacao

e dar ordens ao seu exercito de mortos- vivos.

O lance é que esse jogo se trata de um bom necromante. Isso sera

apresentado ao final. Usa as tropas para poder proteger os bom humanos.

--]]


-- NAMES

charName = "Lin'Dull"

playerName = nil


-- ATRIBUTOS

st = 10 -- forca

dx = 10 -- destreza

iq = 10 -- inteligencia

ht = 10 -- vitalidade


-- MANA E PONTOS DE VIDA

manaMax = iq -- pontos de mana

manaCur = iq - mana -- pontos de mana atual

mana = 0 -- mana usado ao soltar magias. Zera ao dormir.

pvMax = ht -- pontos de vida

pvCur = ht - hurt -- pontos de vida com dano atual

hurt = 0 -- starts with zero. any damage taken, adds here


-- MOVIMENTACAO

move = (st + ht) / 2 -- isso existe?

run = move * 3 -- caso o jogador queira correr


-- ATAQUE E DEFESA

atMl = (dx + ht) / 2 - 10 -- attack meele light

atMh = (st + ht) / 2 - 10 -- attack meele heavy

atLo = (dx + st) / 2 - 10 -- attack long distance

dfEs = (dx + ht) / 4 -- defense esquiva

dfSb = (st + ht) / 4 -- defense shield block

dfWb = (st + dx) / 4 -- defense weapon block


-- EXTRAS
math.randomseed(os.time())

dmg = st - 10 -- bonus acrescido ao dano da arma

testRoll = math.random(3,18) -- rolagem de teste (3d6)

xp = 0 -- experiencia ganha durante o jogo

zombies = 0 -- número de zumbis sob comando do jogador em tempo real

zbsCreated = 0 -- zumbis criado pelo jogador através da magia zumbi

zbsDominated = 0 -- zumbis dominador pelo jogador através da magia controlar zumbi

kills = 0 -- todas as kills do jogador

money = 0 -- dinheiro adquirido pelo jogador durante o jogo

score = 0 -- pontos

inventory = nil

wp1 = nil

wp2 = nil

armor = nil

shield = nil

manaPot = 0 -- pocoes de mana

hitPot = 0 -- pocoes de cura


-- skills physical

sklphy = dx - 1 -- nadar

sklphy = dx - 2 -- arremessar

sklphy = dx - 3 -- esconder nas sombras

sklphy = nil -- cavalgar

sklphy = nil -- escalar

sklphy = nil -- abrir fechaduras


-- skills mental

sklmen = iq - 1 -- detectar

sklmen = iq - 2 -- desarmar armadilhas

sklmen = iq - 3 -- mensagem secretas

sklmen = nil -- curar ferimentos

sklmen = nil -- lábia / intimidação

sklmen = nil -- alquimia


-- magias; cada magia tem seu valor

magic1 = iq - 2 -- detectar espiritos

magic2 = iq - 3 -- falar com espiritos

magic3 = iq - 4 -- zumbi

magic4 = nil -- pestilencia

magic5 = nil -- controlar zumbis

magic6 = nil -- voodoo


-- Mods para ser usado em testes

stmod = {} --seria um valor bonus com referencia ao atributo ST

stmod[00] = -10

stmod[01] = -9

stmod[02] = -8

stmod[03] = -7

stmod[04] = -6

stmod[05] = -5

stmod[06] = -4

stmod[07] = -3

stmod[08] = -2

stmod[09] = -1

stmod[10] = 0

stmod[11] = +1

stmod[12] = +2

stmod[13] = +3

stmod[14] = +4

stmod[15] = +5

stmod[16] = +6

stmod[17] = +7

stmod[18] = +8

stmod[19] = +9

stmod[20] = +10


dxmod = {} --seria um valor bonus com referencia ao atributo DX

dxmod[00] = -10

dxmod[01] = -9

dxmod[02] = -8

dxmod[03] = -7

dxmod[04] = -6

dxmod[05] = -5

dxmod[06] = -4

dxmod[07] = -3

dxmod[08] = -2

dxmod[09] = -1

dxmod[10] = 0

dxmod[11] = +1

dxmod[12] = +2

dxmod[13] = +3

dxmod[14] = +4

dxmod[15] = +5

dxmod[16] = +6

dxmod[17] = +7

dxmod[18] = +8

dxmod[19] = +9

dxmod[20] = +10


iqmod = {} --seria um valor bonus com referencia ao atributo IQ

iqmod[00] = -10

iqmod[01] = -9

iqmod[02] = -8

iqmod[03] = -7

iqmod[04] = -6

iqmod[05] = -5

iqmod[06] = -4

iqmod[07] = -3

iqmod[08] = -2

iqmod[09] = -1

iqmod[10] = 0

iqmod[11] = +1

iqmod[12] = +2

iqmod[13] = +3

iqmod[14] = +4

iqmod[15] = +5

iqmod[16] = +6

iqmod[17] = +7

iqmod[18] = +8

iqmod[19] = +9

iqmod[20] = +10


htmod = {} --seria um valor bonus com referencia ao atributo HT

htmod[00] = -10

htmod[01] = -9

htmod[02] = -8

htmod[03] = -7

htmod[04] = -6

htmod[05] = -5

htmod[06] = -4

htmod[07] = -3

htmod[08] = -2

htmod[09] = -1

htmod[10] = 0

htmod[11] = +1

htmod[12] = +2

htmod[13] = +3

htmod[14] = +4

htmod[15] = +5

htmod[16] = +6

htmod[17] = +7

htmod[18] = +8

htmod[19] = +9

htmod[20] = +10


--VIDEO
--[[pesquisar como imprimir a tela do jogo. Jogo topdown, meio 8 bits.
verificar melhor forma de imprimir com numero muito alto de criaturas.
--]]


--CONTROLS

--[[pesquisar como fazer botoes e setar:

movimentacao ASWD = A esquerda, S baixo, W cima, D direita

movimentacao mouse = direcao que o personagem esta olhando e direcao

do ataque

left click = ataque

right click = ataque2

numeros = itens, pocao, skill, magia

enter = inventario e mapa

scrolldown up = micro management

scrolldown down = macro management

space = run

--]]

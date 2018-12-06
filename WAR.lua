-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
include('Mote-Include.lua')
end

-- //gs debugmode
-- //gs showswaps

function binds_on_load()
-- F9-F12
send_command('bind f9 gs c cycle OffenseMode')
send_command('bind f10 gs c cycle HybridMode')
send_command('bind f11 gs c cycle CastingMode')
send_command('bind f12 gs c update user')
-- CTRL F9-F12
send_command('bind ^q gs c mainweapon')
send_command('bind ^f9 gs c cycle WeaponskillMode')
-- ALT F9-12
send_command('bind !f9 gs c cycle IdleMode')
send_command('bind !f10 gs c cycle RangedMode')
send_command('bind !f12 gs c cycle Kiting')
end

function job_setup()
state.mainweapon = M{['description'] = 'Main Weapon'}
--state.mainweapon:options('Chango','Ragnarok','Reikiko')
state.mainweapon:options('Chango','Ragnarok','Reikiko')
end

function user_setup()
-- Options: Override default values
state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc')
state.WeaponskillMode:options('Normal', 'Acc')
state.HybridMode:options('Normal', 'PDT')
state.CastingMode:options('Normal', 'Resistant')
state.IdleMode:options('Normal','PDT')
state.PhysicalDefenseMode:options('PDT', 'MDT')

Chango_weapons = S{'Hepatizon Axe'}
Rag_weapons = S{'Montante +1'}
Shield_weapons = S{'Blurred Shield'}

update_combat_form()
select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
if binds_on_unload then
binds_on_unload()
end
end

sets.mainweapon = {}
sets.mainweapon.Chango = {
main="Hepatizon Axe",
sub="Utu Grip",
}
sets.mainweapon.Reikiko = {
main="Reikiko",
sub="Blurred Shield",
}
sets.mainweapon.Ragnarok = {
main="Montante +1",
sub="Utu Grip",
}

-- Define sets and vars used by this job file.
function init_gear_sets()
-- Precast sets
sets.precast.JA['Berserk'] = {
body="Pumm. Lorica +3",
feet={ name="Agoge Calligae +1", augments={'Enhances "Tomahawk" effect',}},
back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}
sets.precast.JA['Warcry'] = {	
head={ name="Agoge Mask +1", augments={'Enhances "Savagery" effect',}},}
sets.precast.JA['Aggressor'] = {
head="Pumm. Mask +1",
body={ name="Agoge Lorica +1", augments={'Enhances "Aggressive Aim" effect',}},}
sets.precast.JA['Blood Rage'] = {
body="Boii Lorica +1",}
sets.precast.JA['Retaliation'] = {
feet="Boii Calligae +1",
hands="Pummeler's Mufflers +1"}
sets.precast.JA['Restraint'] = {
hands="Boii Mufflers",}
sets.precast.JA['Mighty Strikes'] = {
hands="Agoge Mufflers +1"}
sets.precast.JA["Warrior's Charge"] = {
legs={ name="Agoge Cuisses +1", augments={'Enhances "Warrior\'s Charge" effect',}},}
sets.precast.JA['Provoke'] = {
ammo="Staunch Tathlum",
head="Pumm. Mask +1",
body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
hands="Macabre Gaunt. +1",
legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
neck="Diemer Gorget",
waist="Nierenschutz",
left_ear="Friomisi Earring",
right_ear="Thureous Earring",
left_ring="Apeile Ring",
right_ring="Apeile Ring +1",
back="Philidor Mantle",}

-- Fast cast sets for spells
sets.precast.FC = {
head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
body={ name="Odyss. Chestplate", augments={'Accuracy+7','"Fast Cast"+5',}},
legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
feet={ name="Odyssean Greaves", augments={'Accuracy+7 Attack+7','"Fast Cast"+3','Accuracy+12','Attack+11',}},
neck="Baetyl Pendant",
right_ear="Loquac. Earring",}

-- Midcast Sets
sets.midcast.FastRecast = {
body={ name="Odyss. Chestplate", augments={'Accuracy+7','"Fast Cast"+5',}},
legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
feet={ name="Odyssean Greaves", augments={'Accuracy+7 Attack+7','"Fast Cast"+3','Accuracy+12','Attack+11',}},
right_ear="Loquac. Earring",}

sets.midcast.Flash = {
ammo="Staunch Tathlum",
head="Pumm. Mask +1",
body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
hands="Macabre Gaunt. +1",
legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
neck="Diemer Gorget",
waist="Nierenschutz",
left_ear="Friomisi Earring",
right_ear="Loquacious Earring",
left_ring="Apeile Ring",
right_ring="Apeile Ring +1",
back="Philidor Mantle",}

-- Resting sets
sets.resting = {}

-- Idle sets
sets.idle = {
ammo="Staunch Tathlum",
head="Arke Zuchetto",
body="Arke Corazza",
hands="Arke Manopolas",
legs="Arke Cosciales",
feet="Arke Gambieras",
neck="Sanctity Necklace",
waist="Asklepian Belt",
left_ear="Infused Earring",
right_ear="Thureous Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back="Moonbeam Cape",}

sets.idle.PDT = {
ammo="Staunch Tathlum",
head="Arke Zuchetto",
body="Arke Corazza",
hands="Arke Manopolas",
legs="Arke Cosciales",
feet="Arke Gambieras",
neck="Sanctity Necklace",
waist="Asklepian Belt",
left_ear="Infused Earring",
right_ear="Thureous Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back="Moonbeam Cape",}

sets.idle.Town = {
ammo="Ginsen",
head="Flam. Zucchetto +1",
body={ name="Valorous Mail", augments={'Accuracy+30','"Dbl.Atk."+4','Attack+11',}},
hands="Sulev. Gauntlets +2",
legs="Pumm. Cuisses +3",
feet="Pumm. Calligae +3",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear="Brutal Earring",
right_ear="Cessance Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}

sets.idle.Weak = {
ammo="Staunch Tathlum",
head="Arke Zuchetto",
body="Arke Corazza",
hands="Arke Manopolas",
legs="Arke Cosciales",
feet="Arke Gambieras",
neck="Sanctity Necklace",
waist="Asklepian Belt",
left_ear="Infused Earring",
right_ear="Thureous Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back="Moonbeam Cape",}

--Engaged Chango
sets.engaged.Chango = {
	ammo="Ginsen",
	head="Flam. Zucchetto +2",
	body="Flamma korazin +2",
	hands="Sulevia's gauntlets +2",
	legs="Pumm. Cuisses +2",
	feet="Pumm. Calligae +2",
	neck="Lissome Necklace",
	waist="Ioskeha Belt",
	left_ear="Brutal Earring",
	right_ear="Cessance Earring",
	left_ring="Petrov Ring",
	right_ring="Flamma Ring",
	back={ name="Cichol's Mantle", augments={'STR+30','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken -5%'}}}

sets.engaged.Chango.PDT = {
ammo="Staunch Tathlum",
head="Arke Zuchetto",
body="Arke Corazza",
hands="Arke Manopolas",
legs="Arke Cosciales",
feet="Arke Gambieras",
neck="Lissome Necklace",
waist="Ioskeha Belt",
left_ear="Brutal Earring",
right_ear="Cessance Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}


sets.engaged.Chango.LowAcc = {}

sets.engaged.Chango.LowAcc.PDT = sets.engaged.Chango.PDT

sets.engaged.Chango.MidAcc = {}

sets.engaged.Chango.MidAcc.PDT = {}


sets.engaged.Chango.HighAcc = {}

sets.engaged.Chango.HighAcc.PDT = sets.engaged.Chango.MidAcc.PDT

--Engaged Ragnarok
sets.engaged.Ragnarok = {
	ammo="Ginsen",
	head="Flam. Zucchetto +2",
	body="Flamma korazin +2",
	hands="Sulevia's gauntlets +2",
	legs="Pumm. Cuisses +2",
	feet="Pumm. Calligae +2",
	neck="Lissome Necklace",
	waist="Ioskeha Belt",
	left_ear="Brutal Earring",
	right_ear="Cessance Earring",
	left_ring="Petrov Ring",
	right_ring="Flamma Ring",
	back={ name="Cichol's Mantle", augments={'STR+30','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken -5%'}}}

sets.engaged.Ragnarok.PDT = {
ammo="Staunch Tathlum",
head="Arke Zuchetto",
body="Arke Corazza",
hands="Arke Manopolas",
legs="Arke Cosciales",
feet="Arke Gambieras",
neck="Lissome Necklace",
waist="Ioskeha Belt",
left_ear="Brutal Earring",
right_ear="Cessance Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}


sets.engaged.Ragnarok.LowAcc = {}

sets.engaged.Ragnarok.LowAcc.PDT = sets.engaged.Ragnarok.PDT

sets.engaged.Ragnarok.MidAcc = {}

sets.engaged.Ragnarok.MidAcc.PDT = {}


sets.engaged.Ragnarok.HighAcc = {}

sets.engaged.Ragnarok.HighAcc.PDT = sets.engaged.Ragnarok.MidAcc.PDT

-- Sword and Board Sets
sets.engaged.Blurred = {
	ammo="Ginsen",
	head="Flam. Zucchetto +2",
	body="Flamma korazin +2",
	hands="Sulevia's gauntlets +2",
	legs="Pumm. Cuisses +2",
	feet="Pumm. Calligae +2",
	neck="Lissome Necklace",
	waist="Ioskeha Belt",
	left_ear="Brutal Earring",
	right_ear="Cessance Earring",
	left_ring="Petrov Ring",
	right_ring="Flamma Ring",
	back={ name="Cichol's Mantle", augments={'STR+30','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken -5%'}}}

sets.engaged.Blurred.PDT = {
ammo="Staunch Tathlum",
head="Arke Zuchetto",
body="Arke Corazza",
hands="Arke Manopolas",
legs="Arke Cosciales",
feet="Arke Gambieras",
neck="Lissome Necklace",
waist="Ioskeha Belt",
left_ear="Dedition Earring",
right_ear="Cessance Earring",
left_ring="Moonbeam Ring",
right_ring="Moonbeam Ring",
back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}

-- Weaponskill sets
sets.precast.WS = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS.Acc = set_combine(sets.precast.WS, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Fell Cleave'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Fell Cleave'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Ukkos Fury'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Ukkos Fury'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Upheaval'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Kings Justice'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Kings Justice'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Shockwave'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Shockwave'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Scourge'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Resolution'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
})
sets.precast.WS['Savage Blade'] = {
ammo="Seeth. Bomblet +1",
head="Flam. Zucchetto +2",
body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
feet="Flam. Gambieras +2",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
right_ear="Brutal Earring",
left_ring="Flamma Ring",
right_ring="Rajas Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',},}
}
sets.precast.WS['Savage Blade'].Acc = {
ammo="Knobkierrie",
head="Sulevia's Mask +1",
body="Pumm. Lorica +3",
hands={ name="Odyssean Gauntlets", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+5','Attack+5',}},
legs="Sulevi. Cuisses +1",
feet="Pumm. Calligae +3",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
right_ear="Ishvara Earring",
left_ring="Shukuyu Ring",
right_ring="Rufescent Ring",
back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}

-- Mighty Strikes WS Set --
sets.MS_WS = {ammo="Yetshila", feet="Boii Calligae +1"}
end

-- Job-specific hooks for standard casting events.
function job_midcast(spell, action, spellMap, eventArgs)

end

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)

end

function display_current_job_state(eventArgs)
local msg = 'Melee'
if state.HybridMode.value ~= 'Normal' then
msg = msg .. '/' .. state.HybridMode.value
end
end

function update_combat_form()
-- Check Weapontype
if Chango_weapons:contains(player.equipment.main) then
state.CombatForm:set('Chango')
elseif Rag_weapons:contains(player.equipment.main) then
state.CombatForm:set('Ragnarok')
elseif Shield_weapons:contains(player.equipment.sub) then
state.CombatForm:set('Blurred')
else
state.CombatForm:reset()
end
end


function job_self_command(cmdParams, eventArgs)
command = cmdParams[1]:lower()
if command=='mainweapon' then
enable('main','sub')
mainswap=1
send_command('gs c cycle mainweapon')
end
end

function job_update(cmdParams, eventArgs)
update_combat_form()
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
update_combat_form()
end

-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
moonshade_WS = S{"Resolution", "Torcleaver", "Savage Blade"}

function job_post_precast(spell, action, spellMap, eventArgs)
if spell.type == 'WeaponSkill' then
if world.time >= (17*60) or world.time <= (7*60) then
equip({ear1="Lugra Earring +1",ear2="Lugra Earring"})
end
if moonshade_WS:contains(spell.english) and player.tp<2950 then 
equip({ear1="Moonshade Earring"})
end
if buffactive['Mighty Strikes'] then 
if sets.precast.WS[spell] then
equipSet = sets.precast.WS[spell]
equipSet = set_combine(equipSet,sets.MS_WS)
equip(equipSet)
else
equipSet = sets.precast.WS
equipSet = set_combine(equipSet,sets.MS_WS)
equip(equipSet)
end
end
end
end

function customize_idle_set(idleSet)
if mainswap then
mainswap=0
enable('main','sub')
equip(sets.mainweapon[state.mainweapon.value])
disable('main','sub')
end
if player.mpp < 51 then
return set_combine(idleSet, sets.latent_refresh)
end
if state.Buff.Doom or state.Buff.Curse then
return set_combine(idleSet, sets.Doom)
else
return idleSet
end
end

function customize_melee_set(meleeSet)
if mainswap then
mainswap=0
enable('main','sub')
equip(sets.mainweapon[state.mainweapon.value])
disable('main','sub')
end
if state.Buff.Aftermath then
return set_combine(meleeSet, sets.Aftermath)
end
if state.Buff.Doom then
return set_combine(meleeSet, sets.Doom)
end
if state.Buff.Curse then
return set_combine(meleeSet, sets.Curse)
else
return meleeSet
end
end

-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'SAM' then
set_macro_page(1, 7)
elseif player.sub_job == 'NIN' then
set_macro_page(3, 7)
elseif player.sub_job == 'RDM' then
set_macro_page(4, 7)
elseif player.sub_job == 'THF' then
set_macro_page(2, 7)
else
set_macro_page(1, 7)
end
end

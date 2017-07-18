

version 7.0 – 13/07/2017 
Wrote & designed by : Aurel Firmware, Nore Fpv & Dom Wilk 
With the support of CHRONODRONE
Pre requisite

OpenTX 2.2 

Please follow some good video tutorial on the net : 
here’s one : https://www.wearefpv.fr/tutoriel-taranis-flash-opentx-script-lua-20170412/
LUA & LUAC activated /!\

The “Luac” option give the transmiter the ability to run different Lua script with a good memory optimization. 


Once done, let OpenTX companion download your custom tailored firmware. !


and flash your radio !!!!
 

receiver  – TELEMETRy or not ?

The script is base on 2.4ghz receiver signal strenght ( RSSI ) to detect your lap passing. It suppose of course that the radio could receive this information. FRSKY telemetry compatible receiver is now a common  capability. Only older V8 models and XM / XM+ don’t have it activated. XM / XM+ could be compatible but seems to be factory limited.

Even with the lack of telemetry on your receiver, you will be able to manually trigger the laptime. LH button seems to be the more appropriate to this function


Sensors discovery

Since a lot of drone pilots doesn’t use 10% of the TARANIS capabilities, discovering the sensor maybe new to you
Here’s the step by step turorial:   
From the “model list” menu
	- long click on “page button”
	- scroll to “telemetry” page
	- scroll down to “sensors discovery”
/!\Turn on your receiver ( usually already on your quadcopter ) /!\
- launch the discovery routine



script install : 

On your transmiter sd card :
   a. Drop "CHRace.lua" in  "\SCRIPTS\TELEMETRY\" folder
   b. "race.lua", "config.lua" & "tools.lua" will go to  "\SCRIPTS\CHRace\"
   c. "Cstart.wav", "Cfin.wav" ,"Cbest.wav", Cpilot.wav et "CtopCD.wav" goes to  "\SOUNDS\en"

 [Optionnal]  You can create a custom Cpilot.wav, so the radio can play a custom sound with your name at every lap triggering. There is many way to create Text to speech audio files, here ‘s some :
http://www.open-tx.org/2014/03/15/opentx-speaker
http://frskytaranis.forumactif.org/t2664-tutocreer-ses-annonces-vocales-avec-opentx-speaker-windows-only
http://cassoulet-soaring.blogspot.fr/2014/09/tuto-son-demarrage-taranis.html

First start

Your LUA files need to be compiled by the radio.

Go to  SD Card menu, from the model page :
Long push on  [Menu]
click  [Page]
Scroll down to  « SCRIPTS » then  [ENT]
Goto  « TELEMETRY » click  [ENT]
slect « CHRace.lua » then long push on  [ENT] reveal a contaxt menu , click on « Execute »
Click on  [Menu] to access configuration menu of « CHRace »

Switch off and on again the radio.



configuration
1. telemetry screen
link the “CHrace” script to a telemetry screen , from the model list page of your drone
Long Push on  [Page]
Scroll pages to the telemetry one 
Edit the screen you want to associate « CHRace »


2. Logical switches
The RSSI trigger is operated by a logical switch. it give the ability to trigger the lap detection at a certain threshold value.
Logical switch page is the page 10 of your selected model options.


  * Function : a>x
  * V1       : RSSI
  * V2       : 74db (Will be adjusted dynamicaly ) 
3. Switches configuration 

Once the logical Switch defined (L03 on previous screen ) launch the “CHrace” script and click on [menu] once to access the parameters screen. Scroll down to “CONFIG INTERS”
Fill Up the RSSI Logical switch number
Ajust the other values,  (will see it below )   



application
launching 
long push on  "Page" to call the telemetry screen
short click on  "Page"  and scroll down to CHRace if not already selected
 
PARAMETERS  (Detailed description below) 
From the screen  "Chronomètre ..."
Short click on "Menu" call the sound parameters
Short click on "Menu" for the race/training paramters  (Lap Number, minimum lap time , takeoff threshold , Start mode ) 
Short click on "Menu" for the internal radio setup (IArm Switch,  RSSI or manual lap trigger  ...)
Short click on "Exit" to go back to the timekeeping screen

TEST & tuning
Rssi lap validation are perfect in theory, but radio frequency are not. you will certainly need some adjustment based on your antenna placement, machine and environment 
2 Parameters are important in tuning your timekeeping. 
- the RSSI threshold triggering value
- The time threshold between 2 laps

The  TEST MODE make the radio bip until the [RSSI] is higher than the value.
The test mode will help you to ajust the value  (keys  [+] or [-] (X9D) or jog dial  (QX7) ).

IF and intermediary part of your racetrack is ringing, you will need to adjust the “Delay” behave from this “ false triggering
This parameter will ignore Rssi triggers within the delay.. 

- The test mode switch is configurable in the setting panel
- Time threshold delay can be adjusted in "Race" panel
- RSSI triggering value can be adjusted in the setting & test mode panel   (keys  [+] or [-] (X9D) or jog dial  (QX7) ).

before the Race / training
RSSI triggering value can be adjusted in the setting & test mode panel   (keys  [+] or [-] (X9D) or jog dial  (QX7) )

RACE
Arm , take off, and fly the track ! .

after the training - race
If you have set  lap number value superior to 4, once disarmed , your can browse your lap time result using the jog dial (QX7) or  "+" & "-" keys (X9D)
Use the configured switch to reset your laptime values
The RSSI threshold value can’t be set again until you reset your lap time result

Precaution of uses
Please, don’t be dumb, use your common sense before flooding forum’s or facebook page with some strange questions.
Of course, people asking for crazy stupid question don’t even read what i’m typing…. life is a bitch ;)

parameters
Our script use the Taranis / FRSKY way to explore the menu so : 
For editing a  value / menu click on  [ENT]
This script is only a script, it will run based on the values you gave to it : 

Available settings are displayed on 3 differents screen 

Sound Config

We have used basicaly many sound announcement, if you find them annoying please considers this modes :

Mode	 [ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
3 options : 

Solo
  Only start signal is played  (see  "standing start or rolling start")

Foursome
  > will announce pilot name at each trigger

Starter (the one giving the start signal)
  > plays the start signal sound sequence 
  > announce the name of the pilot at each lap
If you want the transmitter to announce your custom name, you need to create a "Cpilot.wav" compatible with the transmitter and place it in "SOUNDS/fr/".
The standard start sequence have been supplied by ChronoDrone , Thanks  to them !

Nickname	ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
Yes   No
In "Foursome " our"Starter", “NO” will mute your name at every lap

Lap Num.	ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
Yes   No
Will or not announce the lap number
Time	[ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
Yes   No
Will or not announce your lap time

Best	 [ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
Yes   No
Will or not announce “best lap” if your lap is the best one of your session 

RACE CONFIG

Total Lap	 [ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
Define how many laps you want to time…

DELAY (minium time between two laps)	 [ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
You should define this value with an “ impossible time to make on this track “ in reality it has to be a bit less than the minimum lap time you should be able to make. 

RSSI Thres	 [ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
this is the trigger value, where lap will be triggered
You will be able to adjust it within the menu and the Test Mode ( read the f**king manual ;) )
to deactivate the RSSI mode : set the threshold  value to  100 => "Off" Off will be displayed on the race display meaning the mode has been shut down.

GAS value ( or gas threshold)	[ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
The script need to know when you started to begin the measurement (see Start mode) 
"-500" seems to be a good value.

Start Mode	 [ENT] puis molette (QX7) ou touche +/- (X9D) puis [ENT]
Standing start or rolling start
* Standing = based on the gas value. 
* Rolling  = at the first rssi / manual lap trigger. 


Switch configuration

ARM (switch)	[ENT] then push your arm switch, it will be recognized automaticaly
this let you customize your machine arming switch

OFF (ARMEMENT)	 [ENT] then switch off your arm switch then [ENT]
the most common value is around "-1024" you may need to reconfigure with your own configuration. 

VALID TOUR (Switch)	 [ENT] then switch your choosen “manual lap” switch then [ENT]
Generaly “SH” switch since it’s a spring loaded one. RSSI is a better way to time, well a lazier one. 

RSSI (logical switch)	[ENT] than jog dial (QX7) or  +/- (X9D) then [ENT]
you normally already configured this one at “step 3” of this manual… if you need to change it, please go on.

RESET (time reset switch)	[ENT] then activate your reset switch, it will be automatically recognized 
At your convenience. it will reset your time table. 

ON (RESET) position RAZ	[ENT] put your switch in desired reset position then [ENT]
You may define the value of your reset switch 

TEST (Test mode switch)	[ENT]then activate your test switch, it will be automatically recognized
Define the switch that activate the test mode 

ON (TEST)  déclenchement du mode TEST	[ENT] put your switch in desired test mode position then [ENT]
You may define the value of your test mode switch 
BUGS & AMELIORATIONS

Double seuil RSSI
  Seuil haut = prise en compte lorsqu'on dépasse le seuil par le haut
  Seuil bas  = prise en compte lorsqu'on franchit le seuil par le bas
  Dire lequel valide le tour : celui qui ne valide pas doit être franchit en premier. 
Par exemple, je choisi le seuil bas comme seuil de validation
  - tant que le seuil haut n'est pas détecté, je ne peux valider le tour
  - une fois détecté, j'attends que le seuil bas soit franchit pour valider

HISTORIQUE

7.0 : Version Ok
Revisite ReadMe et diffusion
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.9 : Paramétres 
      "Top" devient "Mode" : Solo / A plusieurs / Starter
      "Pseudo"             : oui/non = annonce du pilote franchissant la ligne (Cpilot.wav)
      "Num Tour"           : oui/non = annonce du tour accompli
      "Temps"              : oui/non = annonce du temps effectué
      "Best"               : oui/non = annonce "meilleur tour" (Cbest.wav)
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.9b : Optimisation + petits bug
		Nom définitif du Script "CHRace", harmonisation des noms de fichiers 
		Pour ceux qui ont déjà installé les version précédentes :
		a/ Supprimer le répertoire "CHRONO" dans "SCRIPTS"
		b/ Supprimer le fichier "timer.lua" dans "SCRIPTS/TELEMETRY" 
		c/ Dans l'écran de "telemesure" associer le script "CHRace" et non plus "timer" 
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.9c : Bug affichage QX
	   bip d'attente validation seulement si Throttle up
	   temps vocal pouvant ne pas être identique à l'affichage (pb arrondi sur les centièmes)	
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.8 : Bug résolu : Reset ou Faux départ ne rejouaient plus le top départ (Faux départ = aucun tour n'a été chronométré au désarmement)
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.7 : Reprise "Top Départ" trois choix
      - "Off"   = fonctionnement en solo, le top départ n'est pas joué, le nom du pilot n'est pas édicté à la validation du tour
      - "mast"  = jouer le top départ + nom du pilote à la validation du tour
      - "elev"  = le nom du pilote à la validation du tour
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.5 : Validation RSSI Off : monter le seuil à 100 
                            indication visuelle "Off" sur écran race et sur écran config
      Top oui/non plutot que 1/0 + repositionnement des options
      Redessine les champs en sortie d'édtion
      Logo Chronodrone
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.4 : retouche QX7 par Dom
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.3 : splash-screen de reset : Petit bug résolu sur affichage
                               Remonté le laps d'affichage de 20 à 30 
      réactivation des textes d'info sur les pages de config
      recentrage de la ligne de titre (race.lua ligne 157 : "(i_IsX9D and 67 or 40)"" jouer sur le "40" pour centrer et me donner la valeur 
      pour que je la mette dans le source avant qu'on ne la perde ;) 
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.2 : Ecrans de Config : Petit bug résolu sur choix inter et attente position 
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.1 : Les pages sont désormais compilées elles aussi par la radio, on est maintenant full luac ! résultat, on passe de 28ko à 20ko en standby 
        sur la page du chrono
      Test divers et variés et petites retouches de code (encore un peu de mémoire à gratter sur les pics), on est stable, aucun leak
        et pics à 47Ko max sur la radio.  
      Suppression des textes d'aide sur les options de config pour grignoter un peu plus de mémoire
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
6.0 : Refonte complète pour optimisation de la gestion de la mémoire
      Le moteur ne fait que charger et décharger les modules en fonction du besoin 
      La charge mémoire est réduite au minimum lorsqu'on va sur un autre script
      Le probème est l'occupation mémoire des autres scripts qui ne laisseront plus la place au chrono
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
5.3 : Bug résolu : bascule d'un écran de config à l'autre un peu laborieux
      Vérification expansion mémoire = stable, varie entre 41 et 47 KB, 41 KB au "repos"
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
5.2 : Bug résolu sur absence du capteur RSSI, affiche "OFF" si pas de capteur 
      Parametre "Top Départ" : son à l'armement pour lancer une séquence de bip pour donner le départ aux copains
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
5.1 : Bug sur BetsLap : ne prenait que les 4 premiers tous
	  Affichage "RESET" en gros sur tout l'écran ... si pas "SH" trop béta de laisser l'inter en position "RESET"	
	  nommenclature des variables pour les fichiers sons revue "snd_xxxxxxx", "sfile" renommé en "snd_start" 
	  Son quand meilleur temps "snd_best"
	  pour éviter de reparamétrer les fichier sons à chaque nouvelle version, possibilité de les modifier dans "chrono.cfg" 
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
5.0 : Seuil RSSI : se règle désormais dans les paramètres "RACE"
				   MAIS s'ajuste aussi en dynamique 
				   - en mode TEST avec la molette (QX7) les touches "+" & "-" (X9D) + annonce vocale de la valeur de seuil
				   - avant la course, dans ce cas, ça fait juste bip plus ou moins aigu selon la valeur du seuil
				   - pendant la course, mais aller chercher les boutons vous fera certainement faire un temps minable, voire pas de temps du tout 
	  Affichage "Mode TEST" qaund l'inter est engagé
	  Consultation temps ([+][-] ou molette) : seulement quand 
	  	- désarmé
	  	- pas en mode test
	  	- qu'il y a au moins un temps dans le tableau
	  	le reste du temps, ces commandes sont dédièes au réglage du seuil

	BUG : Si on fait [EXIT] depuis un écran de config qui attend la manipuation d'un inter, alors on revient sur cet écran au retour sur la config
		 > sortir du mode Edit
		 Ok, comment je te l'ai mis kaput le bug !
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4.8 : Paramétrage de la valeur de l'inter de Reset
	  info tours consultés
	  bip quand premier ou dernier tour atteint en consultation
	  mise en forme temps au tour non bouclés (mise en évidence des tours non courus)
	  reprise des infos paramètres (viré les accents)
	  bug affichage sur quitte écran télémétrie en cours de course 
	  bug affichage "Mode départ"
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4.7 : rectif bug bornage "start_mode" ne peut plus prendre une valeur autre que 0 ou 1
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4.6 : rectif bug reconaissance molette QX7 / + et - X9D
	  paramètre de config, position "On" de l'inter de Test	
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4.5 : Naviguer dans le tableau des temps (après désarmement) avec touches + et - (ou molette sur QX7)
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
4.0 : Paramétrages persistents (fichier "/SCRIPTS/CHRONO/chrono.cfg" sur SDCard)
	  Ecrans de menu "Config Race" et "Config Inters"
	  Réglage du nombre de tours et défilement du tableau des temps durant la course
	  Délai de validations entre deux tours paramétrable en secondes
	  Cmmentaire sur les paramétrages dans le abse de l'écran
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
3.5 : Dessins d'écran adapté au type de radio (QX7/ X9D)
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
3.0 : Modes de départ, lancé ou arrêté
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
2.5 : Mode test = vérifier où le RSSI déclenche pour pouvoir ajuster le potar en vol
	  Amélioration RSSI (inter logique)
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
2.0 : Essais RSSI
	  Reglage de seuil RSSI
	  Plage de détection (abandonné par la suite)
- - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1.0 : Premier jet, Table des chonos, chronos, délai ...
------------------------------------------------------------------------------------------------------------------------------------------------


VOILA VOUS SAVEZ TOUT MAINTENANT !!!!!!!

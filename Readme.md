# Description

Ce script permet de contrôler une lampe Philips Hue en fonction de l'état de la batterie de votre ordinateur portable. (MacOS uniquement)

# Config

- HUE_BRIDGE_IP="111.111.1.1" Renseignez l'adresse IP de votre pont Hue 
- HUE_USERNAME="myusername" Renseignez le nom d'utilisateur Hue créé dans l'application Hue
- LIGHT_ID="1" Renseignez l'identifiant de la lampe Hue à contrôler
- PLUG_ID="2" Renseignez l'identifiant de la prise Hue à contrôler

Pour trouver ces informations, vous pouvez consulter cette page : https://developers.meethue.com/develop/get-started-2/

Les limites de charge et de décharge de la batterie sont paramétrables dans le script.
Elles sont par défaut à 20% et 99% respectivement, mais vous pouvez les modifier dans les conditions.

# Utiliser une prise connectée

Vous pouvez également utiliser une prise connectée Philips Hue pour contrôler le chargeur de votre Mac en fonction de l'état de la batterie. 
Pour cela il faut enlever le symbole "#" devant ces lignes :

## Définir la prise à contrôler 

```bash
PLUG_ID="2"
```

## Allumer la prise
```bash
curl -X PUT -d '{"on":true}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$PLUG_ID/state
```

## Éteindre la prise
```bash
curl -X PUT -d '{"on":false}' http://$HUE_BRIDGE_IP/api/$HUE_USERNAME/lights/$PLUG_ID/state
```

# Execution du script au démarage


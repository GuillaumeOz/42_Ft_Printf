# Ft_printf

## **OBJECTIFS**

La versatilité de la fonction printf en C représente pour nous un excellent exercice
de programmation. D’une difficulté modérée, ce projet va vous permettre de découvrir
les fonctions variadiques en C dans un contexte particulièrement adapté, et de voir un
excellent exemple d’un “dispatcher” rudimentaire implémenté en C à l’aide d’un tableau
de pointeurs sur fonctions.  
La clef d’un ft_printf réussi **est un code bien structuré** et **facilement extensible**, car
plus le temps passera, plus vous serez tentés de continuer à étendre votre ft_printf, vous
facilitant ainsi la vie sur les prochains projets. Prenez donc le temps de coder proprement
en gardant en tête que vous devrez relire votre code d’ici quelques semaines ou quelques
mois pour étendre ses fonctionnalités selon votre besoin. Ce serait dommage de ne pas le
faire parce que vous ne pouvez pas vous relire, non ?  

**Consignes générales**

• La fonction doit s’appeler ft_printf.  
• Votre projet doit être à la Norme.  
• Vous devez gérer les erreurs de façon sensible. En aucun cas votre programme ne
doit quitter de façon inattendue (Segmentation fault, etc...).  
• Vous devez fournir un Makefile qui compilera une libftprintf.a. Cette lib sera linké
à notre main de test pour vous donner votre résultat.  
• Vous devez rendre, à la racine de votre dépôt de rendu, un fichier auteur contenant
votre login suivi d’un ’\n’ :  
*     **$>cat -e auteur   
*     xlogin$**  
• Vous avez le droit d’utiliser les fonctions suivantes :  
◦ write  
◦ malloc  
◦ free  
◦ exit  
◦ les fonctions du man 3 stdarg :  

NAME
stdarg -- variable argument lists

SYNOPSIS
#include <stdarg.h>

    void
     va_start(va_list ap, last);
    
     type
     va_arg(va_list ap, type);
    
     void
     va_copy(va_list dest, va_list src);
    
     void
     va_end(va_list ap);

**Partie obligatoire**

%[flags] [width] [.precision] [size] type
• Vous devez recoder la fonction printf de la libc
• Votre fonction s’appelera ft_printf et sera prototypée de la même façon que
printf
• Vous ne ferez pas la gestion de buffer présente dans la fonction printf de la libc.
• Vous devez gérer les conversions suivantes : csp(char, string, pointer)
• Vous devez gérer les conversions suivantes : diouxX(d = decimal avec base 10, i = dec, oct, hexa   avec les flags hh, h, l, ll
• Vous devez gérer la conversion suivante : f avec les flags l et L
• Vous devez gérer le %%
• Vous devez gérer les flags #0-+ et espace
• Vous devez gérer la taille minimum du champ
• Vous devez gérer la précision

man 3 printf / man 3 stdarg

**Partie bonus**

Voici quelques idées de bonus intéressants à réaliser, voire même utiles. Vous pouvez
évidemment ajouter des bonus de votre invention, qui seront évalués à la discrétion de
vos correcteurs.
• Gestion de conversions plus délicates : e, g. Attention votre flag L doit être étendu
à ces deux conversions pour que le bonus soit comptabilisé !
• Gestion de flags plus delicats : *, $, ’
• Gestion de flags non existants : %b pour afficher en binaire, %r pour afficher une
chaine avec des caractères non imprimables, %k pour afficher une date à un format
ISO quelconque, etc.
• Gestion de modifieurs pour gérer les couleurs, les fd ou des choses fun comme ça :)

    printf("Le fichier{cyan}%s{eoc} contient : {red}%s{eoc}", filename, str);

## **LES FONCTIONS VARIADIQUE**

Une **fonction variadique** est une fonction d'[arité](https://fr.wikipedia.org/wiki/Arit%C3%A9) indéfinie, c'est-à-dire qui accepte un nombre variable de [paramètres](https://fr.wikipedia.org/wiki/Param%C3%A8tre_(programmation_informatique)).

Le langage C permet la définition de fonctions variadiques.

Les exemples les plus connus sont les fonctions [standard](https://fr.wikipedia.org/wiki/Biblioth%C3%A8que_standard_du_C) d'entrée-sortie `printf` et `scanf`.

## SYNOPSIS

**#include <[stdarg.h](file:///usr/include/stdarg.h)>**

    void va_start(va_list ap, last);
    
    type va_arg(va_list ap, type);
    
    void va_end(va_list ap);
    
    void va_copy(va_list dest, va_list src);

## DESCRIPTION

Une fonction peut être appelée avec un nombre variable d'arguments, eux-mêmes de types variables. Une telle fonction est dite « variadique ». Le fichier d'entête <[stdarg.h](file:///usr/include/stdarg.h)> déclare un type va_list et définit trois macros permettant de parcourir la liste d'arguments dont le nombre et les types ne sont pas connus par la fonction appelée.

La fonction appelée doit déclarer un objet de type va_list utilisé par les macros **va_start**(), **va_arg**() et **va_end**().  

### va_start()

La macro **va_start**() initialise ap pour les utilisations ultérieures de **va_arg**() et **va_end**(), et doit donc être appelée en premier.

Le paramètre last est le nom du dernier paramètre avant la liste d'argument variable, c'est-à-dire le dernier paramètre dont la fonction connaisse le type.

Comme l'adresse de ce paramètre est utilisée dans la macro **va_start**(), il ne doit pas être déclaré comme une variable en registre, ni comme un type fonction ou tableau.  

### va_arg()

La macro **va_arg**() se développe en une expression qui a le type et la valeur de l'argument suivant de l'appel. Le paramètre ap est la va_list ap initialisée par **va_start**(). Chaque appel de

**va_arg**() modifie ap pour que l'appel suivant renvoie l'argument suivant. Le paramètretype

est le nom du type, indiqué de telle manière qu'un pointeur sur un objet de ce type puisse être déclaré simplement en ajoutant un astérisque à type.

La première utilisation de la macro **va_arg**() après celle de **va_start**() renvoie l'argument suivant last. Les invocations successives renvoient les valeurs des arguments restants.

S'il n'y a pas d'argument suivant, ou si type n'est pas compatible avec le type réel du prochain argument, des erreurs imprévisibles se produiront.

Si ap est passé à une fonction qui utilise **va_arg(**ap**,**type**)** alors la valeur de ap est indéfinie après le retour de cette fonction.  

### va_end()

À chaque invocation de **va_start**() doit correspondre une invocation de **va_end**() dans la même fonction. Après l'appel **va_end(**ap**)**la variable ap est indéfinie. Plusieurs traversées de la liste sont possibles, à condition que chacune soit encadrée par **va_start**() et **va_end**(). **va_end** () peut être une macro ou une fonction.

### va_copy()

Une implémentation évidente est de représenter va_list par un pointeur dans la pile de la fonction variadique. Dans une telle situation (de loin la plus courante), rien ne semble s'opposer à une affectation.

## TABLEAU DES FONCTIONNALITES

[ft_printf](https://www.notion.so/092956be83024677a84c034ae4231ba7)

### Syntaxe de spécification de format : fonctions printf

### % 1[flags] 2[width] 3[.precision] 4[size] 5type

### 1 - type % d i o u x X f c s p b F

c (char) 

s (string) 

p (pointer)

d (d = decimal avec base 10)

i (i = dec, oct, hexa automatically detection) 

o (o = octal form) 

u (u =  unsigned decimal) 

x (x = hexa format) 

X (X = hexa format with letter in uppercase)

f (f = float nombre a virgule) → avec flag l et L

%% (for print %)

### Bonus :

b (b = affiche en binaire)

r (r = affiche une chaine avec des caractères non imprimables)

k (k = affiche une date a un format ISO quelconque)

Gestion de modifieurs pour gérer les couleurs, les fd ou des choses fun comme ça :

    printf("Le fichier{cyan}%s{eoc} contient : {red}%s{eoc}", filename, str);

### 2 - [size] (modificateur de longueur)

hh Pour spécifier char unsigned - char | Avec le spécificateur de type d, i, o, u, x ou X

h Pour spécifier short int - short unsigned int | Avec le spécificateur de type d, i, o, u, x ou X

l Pour spécifier long int - long unsigned int | Avec le spécificateur de type d, i, o, u, x ou X et f

ll Pour spécifier long long int - unsigned long long int | Avec le spécificateur de type d, i, o, u, x ou X

L Pour spécifier long double | Avec le spécificateur de type a, A, e, E, f, F, g ou G

![README_src/size_for_printf.png](Ft_printf/size_for_printf.png)

### 3 - [.precision] - Spécification de précision

Le champs de précision correspond au troisième champ facultatif, il se compose d'un point (.) suivi d'un entier décimal non négatif qui, selon le type de conversion, spécifie le nombre de caractères de chaîne, le nombre de décimales ou le nombre de chiffres significatifs à générer.

Contrairement à la spécification de largeur, la spécification de précision peut entraîner la troncation de la valeur de sortie ou l’arrondi d’une valeur à virgule flottante. Si vous spécifiez 0 comme précision et que la valeur à convertir est 0, vous n’obtenez aucune sortie de caractères, comme illustré dans cet exemple :

    printf( "%.0d", 0 ); /* No characters output */

Si la spécification de précision est un astérisque (*), un argument int issu de la liste d’arguments fournit la valeur. Dans la liste d’arguments, l’argument precision doit précéder la valeur mise en forme, comme illustré dans cet exemple :

    printf( "%.*f", 3, 3.14159265 ); /* 3.142 output */

Le caractère type détermine soit l’interprétation de precision, soit la précision par défaut quand precision est omis, comme illustré dans le tableau suivant.

---

![README_src/Capture_decran_2019-07-08_a_19.31.15.png](Ft_printf/Capture_decran_2019-07-08_a_19.31.15.png)

### 4 - [width] - Spécification de largeur

Dans une spécification de conversion, le champ facultatif de spécification de largeur apparaît après n’importe quel caractère d’*indicateur*. L’argument *width* est un entier décimal non négatif qui contrôle le nombre minimal de caractères qui sont générés. Si le nombre de caractères dans la valeur de sortie est inférieur à la longueur spécifiée, des espaces sont ajoutés à gauche ou à droite des valeurs, selon que l’indicateur d’alignement à gauche (**-**) est spécifié ou non, jusqu’à ce que la largeur minimale soit atteinte. Si *width* est préfixé par 0, des zéros non significatifs sont ajoutés aux conversions en entiers ou en nombres à virgule flottante jusqu’à ce que la largeur minimale soit atteinte, sauf en cas de conversion en valeur infinie ou NaN.

La spécification de largeur ne provoque jamais la troncature d’une valeur. Si le nombre de caractères dans la valeur de sortie est supérieur à la largeur spécifiée, ou si *width* n’est pas spécifié, tous les caractères de la valeur sont générés, conformément à la spécification *precision*.

Si la spécification de la largeur est un astérisque (`*`), un argument `int` issu de la liste d’arguments fournit la valeur. L’argument *width* doit précéder la valeur mise en forme dans la liste des arguments, comme illustré dans l’exemple suivant :

    printf("%0*f", 5, 3); /* 00003 is output */
    printf("%06c, 1); /* 000001 is output */

Une valeur width manquante ou petite dans une spécification de conversion n’entraîne pas la troncation d’une valeur de sortie. Si le résultat d’une conversion est plus large que la valeur width, le champ peut être développé pour contenir le résultat de la conversion.

### 5 - [flags]

 -      **Signification :** Aligner à gauche le résultat selon la largeur de champ donnée. | **Par défaut :** Aligner à droite.

 +      **Signification :** Utilisez un signe (+ ou -) pour préfixer la valeur de sortie s’il s’agit d’un type signé. | **Par défaut :** Le signe apparaît uniquement pour les valeurs signées négatives (-).

0      **Signification :** Si width est préfixé par 0, des zéros non significatifs sont ajoutés jusqu’à ce que la largeur minimale soit atteinte. Si 0 et - apparaissent, le 0 est ignoré(erreur). 

Si 0 est spécifié pour un format entier (i, u, x, X, o, d) et qu’une spécification de précision est également présente (par exemple, %04.d), le 0 est ignoré. 

" → ZERO CONDITION pour que le pading passe de ' ' a '0'
Si le flag ZERO est parsé et que le flag MINUS ne la pas été :

Si il n'y a pas de precision et que le specifier n'est pas égale a "cf%" **OU** il n'y a pas de precision et que le specifier est égale a "cf%" **OU** il y a une precision et le specifier est égale a "cf%"

    if (info.flags & ZERO && !(info.flags & MINUS))
    	if (info.precision == NONE || ft_ischarset(info.specifier, "cf%"))
    		info.pad = '0';

Si 0 est spécifié pour le format à virgule flottante a ou A, des zéros non significatifs sont ajoutés en préfixe à la mantisse, après le préfixe 0x ou 0X.  | **Par défaut :** Aucun remplissage.

espace (' ')      **Signification :** Utilisez un espace pour préfixer la valeur de sortie si elle est signée et positive. L’espace est ignoré si l’espace et des indicateurs + apparaissent. | **Par défaut :** Aucun espace ne s’affiche.

#      **Signification :**

- Quand il est utilisé avec le format o, x ou X, l’indicateur # utilise 0, 0x ou 0X, respectivement, pour préfixer une valeur de sortie différente de zéro. | **Par défaut :** Aucun espace ne s’affiche.
- Quand il est utilisé avec le format e, E, f, F, a ou A, l’indicateur # impose à la valeur de sortie de contenir une virgule décimale. | **Par défaut :** La virgule décimale apparaît uniquement si des chiffres la suivent.
- Quand il est utilisé avec le format g ou G, l’indicateur # force la valeur de sortie à contenir une virgule décimale et empêche la troncature des zéros de fin. Ignoré s’il est utilisé avec c, d, i, u ou s. **Par défaut :** La virgule décimale apparaît uniquement si des chiffres la suivent. Les zéros de fin sont tronqués.

### Bonus :

*     Rajouter le nombre d'espace avant ce qu'il faut ecrire ft_printf("%*c", 12, 'a');

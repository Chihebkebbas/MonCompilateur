# Compilateur Pascal Simplifié
## Auteur

**Chiheb Eddine KEBBAS**  
**Uapv2500228**  
**Groupe 03**

## Travail personnel

- Implémentation de l'instruction `CASE` 
    - Analyse syntaxique dans `compilateur.cpp`
    - Ajout des tokens `CASE`/`OF` dans `tokeniser.l`
    - Génération de code assembleur pour les comparaisons multiples
    - Tests avec différents types (`INTEGER`/`CHAR`)

## Exemples de programmes supportés

```pascal
// Exemple 1 : CASE avec entiers
VAR x: INTEGER;
BEGIN
        x := 3;
        CASE x OF
                1: DISPLAY 10;
                2,3: DISPLAY 20;
                4: DISPLAY 30;
        END;
END.

// Exemple 2 : CASE avec caractères
VAR c: CHAR;
BEGIN
        c := 'A';
        CASE c OF
                'A','B': DISPLAY 1;
                'C': DISPLAY 2;
        END;
END.
```

## Utilisation

- **Compiler** : `make`
- **Exécuter test** : `make test`
- **Déboguer** : `ddd ./test`

### Explication de l'extension CASE

- **Fonctionnement** :
    - Évalue une expression (`INTEGER` ou `CHAR`)
    - Compare avec plusieurs valeurs étiquettes
    - Exécute le bloc correspondant à la première valeur correspondante
- **Implémentation** :
    - Utilise `%rax` pour stocker la valeur de l'expression
    - Génère des sauts conditionnels (`je`) pour chaque étiquette
    - Structure avec labels pour éviter les conflits
- **Limitations** :
    - Ne gère pas encore de clause `ELSE`
    - Requiert des constantes littérales pour les étiquettes

Cette extension respecte le style de code existant et s'intègre naturellement dans l'architecture du compilateur. Le code généré est optimisé avec des sauts directs et une gestion efficace des registres.


## Liens

- [LinkedIn](https://www.linkedin.com/in/chiheb-eddine-kebbas/)
- [GitHub](https://github.com/Chihebkebbas)
- [Portfolio](https://chihebkebbas.github.io/Portfolio/)
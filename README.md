# Skills, Crafting, Trading, Business

### Changelog:
```
[21/01/2016]
  - Añadido sistema de notificación.
  - Assets.
  - Cambiado nombre de 'Marketing' a 'Trading'.
  - Algunas cosas de UI.
```

### Progreso:

  - **Skills**:
      - Configs:                  90%
      - Funcionalidad local:      70%
      - Funcionalidad servidor:   10%
      - API Generica:             30%
  - **Crafting**:
      - Configs:                  70%
      - Funcionalidad local:      30%
      - Funcionalidad servidor:    0%
      - API Generica:             20%
  - **Marketing**:
      - Configs:                   0%
      - Funcionalidad local:       0%
      - Funcionalidad servidor:    0%
      - API Generica:              0%
  - **Business**:
      - Configs:                   0%
      - Funcionalidad local:       0%
      - Funcionalidad servidor:    0%
      - API Generica:              0%
  - **Otros**:
      - UI:                       20%
      - Sounds:                   80%
      - EventHandlers:            30%
      - Localization:              5%
      - Utils:                    15%

### API:
    #### UI: 
    TAG = `AUI`
    
    - Mostrar notificación: `["titulo" ,"description", "opcional_IMAGEN"] call AUI_fnc_showNotification;`
    - Mostrar Blur: `showBlur = true`, desactivar con `showBlur = false`
    - Mostrar blanco y negro: `showBN = true`, desactivar con `showBN = false`
    #### Skills
    TAG = `SKL`
    
    - Add skill

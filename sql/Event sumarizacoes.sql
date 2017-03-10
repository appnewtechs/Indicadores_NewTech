DROP EVENT sumarizacoes;
DELIMITER |
CREATE EVENT sumarizacoes
  ON SCHEDULE EVERY 5 MINUTE STARTS NOW()
DO
  BEGIN
    call somarTop5Dia();
    call somarTop5Mes();
    call somarTop5Ano();
    call somarIndicadores();
  END |
DELIMITER;
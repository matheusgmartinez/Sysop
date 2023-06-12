create database sysop;
use sysop;

CREATE TABLE IF NOT EXISTS `sysop`.`usuario` (
  `ID_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `CPF` VARCHAR(15) NOT NULL,
  `Senha` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `Funcao` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_usuario`),
  INDEX `Indice_nome` (`nome` ASC) INVISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE);
  
CREATE TABLE IF NOT EXISTS `sysop`.`turma` (
  `ID_Turma` INT NOT NULL AUTO_INCREMENT,
  `ID_Professor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Turma`),
  INDEX `FK_Usuario_Turma_idx` (`ID_Professor` ASC) VISIBLE,
  CONSTRAINT `FK_Usuario_Turma`
    FOREIGN KEY (`ID_Professor`)
    REFERENCES `sysop`.`usuario` (`ID_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `sysop`.`aluno` (
  `ID_Aluno` INT NOT NULL AUTO_INCREMENT,
  `ID_Turma` INT NOT NULL,
  INDEX `FK_Turma_Aluno_idx` (`ID_Turma` ASC) VISIBLE,
  PRIMARY KEY (`ID_Aluno`, `ID_Turma`),
  CONSTRAINT `FK_Usuario_Aluno`
    FOREIGN KEY (`ID_Aluno`)
    REFERENCES `sysop`.`usuario` (`ID_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Turma_Aluno`
    FOREIGN KEY (`ID_Turma`)
    REFERENCES `sysop`.`turma` (`ID_Turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `sysop`.`Prova` (
  `idProva` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  PRIMARY KEY (`idProva`));
  
  CREATE TABLE IF NOT EXISTS `sysop`.`provarealizada` (
  `ID_ProvasRealizadas` INT NOT NULL AUTO_INCREMENT,
  `ID_Aluno` INT NOT NULL,
  `Resultados` VARCHAR(45) NOT NULL,
  `ID_Prova` INT NOT NULL,
  PRIMARY KEY (`ID_ProvasRealizadas`),
  INDEX `FK_Aluno_ProvasRealizadas_idx` (`ID_Aluno` ASC) VISIBLE,
  INDEX `FK_ProvaRealizada_Prova_idx` (`ID_Prova` ASC) VISIBLE,
  CONSTRAINT `FK_Aluno_ProvaRealizadas`
    FOREIGN KEY (`ID_Aluno`)
    REFERENCES `sysop`.`aluno` (`ID_Aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProvaRealizada_Prova`
    FOREIGN KEY (`ID_Prova`)
    REFERENCES `sysop`.`Prova` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `sysop`.`disciplina` (
  `ID_Disciplina` INT NOT NULL AUTO_INCREMENT,
  `ID_Professor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Disciplina`),
  INDEX `FK_usuario_Disciplina_idx` (`ID_Professor` ASC) VISIBLE,
  CONSTRAINT `FK_usuario_Disciplina`
    FOREIGN KEY (`ID_Professor`)
    REFERENCES `sysop`.`usuario` (`ID_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `sysop`.`pergunta` (
  `ID_Perguntas` INT NOT NULL AUTO_INCREMENT,
  `ID_Disciplina` INT NOT NULL,
  `Enunciado` VARCHAR(2000) NOT NULL,
  `Numero de Perguntas` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Perguntas`),
  INDEX `FK_Disciplina_Perguntas_idx` (`ID_Disciplina` ASC) VISIBLE,
  CONSTRAINT `FK_Disciplina_Perguntas`
    FOREIGN KEY (`ID_Disciplina`)
    REFERENCES `sysop`.`disciplina` (`ID_Disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `sysop`.`PerguntasDaProva` (
  `idPerguntasProva` INT NOT NULL AUTO_INCREMENT,
  `ID_Pergunta` INT NOT NULL,
  `ID_Prova` INT NOT NULL,
  PRIMARY KEY (`idPerguntasProva`),
  INDEX `FK_Pergunta_Prova_idx` (`ID_Pergunta` ASC) VISIBLE,
  INDEX `Fk_Prova_prova_idx` (`ID_Prova` ASC) VISIBLE,
  CONSTRAINT `FK_Pergunta_PerguntasProva`
    FOREIGN KEY (`ID_Pergunta`)
    REFERENCES `sysop`.`pergunta` (`ID_Perguntas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_Prova_prova`
    FOREIGN KEY (`ID_Prova`)
    REFERENCES `sysop`.`Prova` (`idProva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `sysop`.`resposta` (
  `ID_Respostas` INT NOT NULL AUTO_INCREMENT,
  `ID_Perguntas` INT NOT NULL,
  `Enunciado Resposta` VARCHAR(100) NOT NULL,
  `Resposta Correta` TINYINT NOT NULL,
  PRIMARY KEY (`ID_Respostas`),
  INDEX `FK_Perguntas_Respostas_idx` (`ID_Perguntas` ASC) VISIBLE,
  CONSTRAINT `FK_Perguntas_Respostas`
    FOREIGN KEY (`ID_Perguntas`)
    REFERENCES `sysop`.`pergunta` (`ID_Perguntas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    INSERT INTO `sysop`.`usuario` (`ID_usuario`, `nome`, `CPF`, `Senha`, `email`, `Funcao`) VALUES ('1', 'Gestor', '123456789', '123', 'gestor@gmail.com', 'Gestor');
	INSERT INTO `sysop`.`usuario` (`ID_usuario`, `nome`, `CPF`, `Senha`, `email`, `Funcao`) VALUES ('2', 'Professor', '123456788', '123', 'professor@gmail.com', 'Professor');
	INSERT INTO `sysop`.`usuario` (`ID_usuario`, `nome`, `CPF`, `Senha`, `email`, `Funcao`) VALUES ('3', 'Aluno', '123456787', '123', 'aluno@gmail.com', 'Aluno');
    
    select * from usuario;
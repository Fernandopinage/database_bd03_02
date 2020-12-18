-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Dez-2020 às 01:19
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `andar`
--

CREATE TABLE `andar` (
  `andar_id` int(11) NOT NULL,
  `andar_num` int(10) DEFAULT NULL,
  `andar_setor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `especialidade_id` int(11) NOT NULL,
  `especialidade_nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicos`
--

CREATE TABLE `medicos` (
  `medicos_id` int(11) NOT NULL,
  `medicos_especialidade_id` int(11) DEFAULT NULL,
  `medicos_nome` varchar(100) DEFAULT NULL,
  `medicos_salario` float(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `paciente_id` int(11) NOT NULL,
  `paciente_andar_id` int(11) DEFAULT NULL,
  `paciente_medicos_id` int(11) DEFAULT NULL,
  `paciente_nome` varchar(100) DEFAULT NULL,
  `paciente_rg` varchar(12) DEFAULT NULL,
  `paciente_cpf` varchar(14) DEFAULT NULL,
  `paciente_endereco` varchar(100) DEFAULT NULL,
  `paciente_telefone` varchar(15) DEFAULT NULL,
  `paciente_datanasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `visita`
--

CREATE TABLE `visita` (
  `visita_paciente_id` int(11) DEFAULT NULL,
  `visita_medico_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`andar_id`);

--
-- Índices para tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`especialidade_id`);

--
-- Índices para tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`medicos_id`),
  ADD KEY `medicos_especialidade_id` (`medicos_especialidade_id`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`paciente_id`),
  ADD KEY `paciente_andar_id` (`paciente_andar_id`),
  ADD KEY `paciente_medicos_id` (`paciente_medicos_id`);

--
-- Índices para tabela `visita`
--
ALTER TABLE `visita`
  ADD KEY `visita_paciente_id` (`visita_paciente_id`),
  ADD KEY `visita_medico_id` (`visita_medico_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andar`
--
ALTER TABLE `andar`
  MODIFY `andar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `especialidade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `medicos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `paciente_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`medicos_especialidade_id`) REFERENCES `especialidade` (`especialidade_id`);

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`paciente_andar_id`) REFERENCES `andar` (`andar_id`),
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`paciente_medicos_id`) REFERENCES `medicos` (`medicos_id`);

--
-- Limitadores para a tabela `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`visita_paciente_id`) REFERENCES `paciente` (`paciente_id`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`visita_medico_id`) REFERENCES `medicos` (`medicos_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

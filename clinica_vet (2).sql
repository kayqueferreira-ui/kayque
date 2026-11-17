-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 17/11/2026 às 15:22
-- Versão do servidor: 8.0.42-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica_vet`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int NOT NULL,
  `data_consulta` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `id_pet` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONAMENTOS PARA TABELAS `consultas`:
--   `id_pet`
--       `pets` -> `id_pet`
--

--
-- Despejando dados para a tabela `consultas`
--

INSERT INTO `consultas` (`id_consulta`, `data_consulta`, `valor`, `diagnostico`, `id_pet`) VALUES
(2, '2025-06-15', 180.00, 'Tratamento de infecção', 2),
(3, '2025-06-20', 132.00, 'Avaliação nutricional', 3),
(4, '2025-06-25', 320.00, 'Tratamento dermatológico', 4),
(5, '2025-07-02', 250.00, 'Exames e vacinação', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pets`
--

CREATE TABLE `pets` (
  `id_pet` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `id_tutor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONAMENTOS PARA TABELAS `pets`:
--   `id_tutor`
--       `tutores` -> `id_tutor`
--

--
-- Despejando dados para a tabela `pets`
--

INSERT INTO `pets` (`id_pet`, `nome`, `especie`, `data_nascimento`, `id_tutor`) VALUES
(1, 'Thor', 'Cachorro', '2019-07-14', 1),
(2, 'Amora', 'Gato', '2021-11-23', 1),
(3, 'Pipoca', 'Coelho', '2022-04-09', 2),
(4, 'Nala', 'Gato', '2023-09-17', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutores`
--

CREATE TABLE `tutores` (
  `id_tutor` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- RELACIONAMENTOS PARA TABELAS `tutores`:
--

--
-- Despejando dados para a tabela `tutores`
--

INSERT INTO `tutores` (`id_tutor`, `nome`, `cpf`, `telefone`) VALUES
(1, 'Camila Fernandes', '48162937501', '41987654321'),
(2, 'Rafael Monteiro', '57283194602', '41999998888'),
(3, 'Bianca Carvalho', '69314285703', '41965432109');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `fk_id_consulta_id_pet` (`id_pet`);

--
-- Índices de tabela `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id_pet`),
  ADD KEY `fk_id_pet_id_tutor` (`id_tutor`);

--
-- Índices de tabela `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`id_tutor`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pets`
--
ALTER TABLE `pets`
  MODIFY `id_pet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tutores`
--
ALTER TABLE `tutores`
  MODIFY `id_tutor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `fk_id_consulta_id_pet` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`);

--
-- Restrições para tabelas `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `fk_id_pet_id_tutor` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Mar-2023 às 05:31
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academia`
--
CREATE DATABASE IF NOT EXISTS `academia` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `academia`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso`
--

CREATE TABLE `acesso` (
  `cpf_usuario` varchar(14) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nivel` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf_cliente` varchar(14) NOT NULL,
  `nome_cliente` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `sexo` char(1) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `dia_vencimento` int NOT NULL,
  `objetivo` varchar(200) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `id_mensalidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `cep` varchar(9) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `logradouro` varchar(80) NOT NULL,
  `bairro` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `exercicio`
--

CREATE TABLE `exercicio` (
  `id_exercicio` int NOT NULL,
  `nome_exercicio` varchar(45) NOT NULL,
  `qtd_series` int NOT NULL,
  `qtd_repeticoes` int NOT NULL,
  `observacao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensalidade`
--

CREATE TABLE `mensalidade` (
  `id_mensalidade` int NOT NULL,
  `nome_mensalidade` varchar(45) NOT NULL,
  `valor` float NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL,
  `cpf_cliente` varchar(14) NOT NULL,
  `data_pagamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal`
--

CREATE TABLE `personal` (
  `cpf_personal` varchar(14) NOT NULL,
  `nome_personal` varchar(45) NOT NULL,
  `turno` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_treino`
--

CREATE TABLE `plano_treino` (
  `id_plano_treino` int NOT NULL,
  `id_exercicio` int NOT NULL,
  `id_treino` int NOT NULL,
  `cpf_cliente` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `treino`
--

CREATE TABLE `treino` (
  `id_treino` int NOT NULL,
  `nome_treino` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acesso`
--
ALTER TABLE `acesso`
  ADD PRIMARY KEY (`cpf_usuario`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf_cliente`),
  ADD KEY `fk_Cliente_Endreco_idx` (`cep`),
  ADD KEY `fk_Cliente_Mensalidade1_idx` (`id_mensalidade`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`cep`);

--
-- Índices para tabela `exercicio`
--
ALTER TABLE `exercicio`
  ADD PRIMARY KEY (`id_exercicio`);

--
-- Índices para tabela `mensalidade`
--
ALTER TABLE `mensalidade`
  ADD PRIMARY KEY (`id_mensalidade`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `fk_Pagamento_Cliente1_idx` (`cpf_cliente`);

--
-- Índices para tabela `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`cpf_personal`);

--
-- Índices para tabela `plano_treino`
--
ALTER TABLE `plano_treino`
  ADD PRIMARY KEY (`id_plano_treino`),
  ADD KEY `fk_Plano_Treino_Exercicio1_idx` (`id_exercicio`),
  ADD KEY `fk_Plano_Treino_Treino1_idx` (`id_treino`),
  ADD KEY `fk_Plano_Treino_Cliente1_idx` (`cpf_cliente`);

--
-- Índices para tabela `treino`
--
ALTER TABLE `treino`
  ADD PRIMARY KEY (`id_treino`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `exercicio`
--
ALTER TABLE `exercicio`
  MODIFY `id_exercicio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensalidade`
--
ALTER TABLE `mensalidade`
  MODIFY `id_mensalidade` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plano_treino`
--
ALTER TABLE `plano_treino`
  MODIFY `id_plano_treino` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `treino`
--
ALTER TABLE `treino`
  MODIFY `id_treino` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Cliente_Endreco` FOREIGN KEY (`cep`) REFERENCES `endereco` (`cep`),
  ADD CONSTRAINT `fk_Cliente_Mensalidade1` FOREIGN KEY (`id_mensalidade`) REFERENCES `mensalidade` (`id_mensalidade`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_Pagamento_Cliente1` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`);

--
-- Limitadores para a tabela `plano_treino`
--
ALTER TABLE `plano_treino`
  ADD CONSTRAINT `fk_Plano_Treino_Cliente1` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`),
  ADD CONSTRAINT `fk_Plano_Treino_Exercicio1` FOREIGN KEY (`id_exercicio`) REFERENCES `exercicio` (`id_exercicio`),
  ADD CONSTRAINT `fk_Plano_Treino_Treino1` FOREIGN KEY (`id_treino`) REFERENCES `treino` (`id_treino`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

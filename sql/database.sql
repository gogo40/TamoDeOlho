-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.24-log
-- Versão do PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `prilop5_tdeolho`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `codEstado` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `abreviatura` text NOT NULL,
  PRIMARY KEY (`codEstado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao`
--

CREATE TABLE IF NOT EXISTS `instituicao` (
  `codInstituicao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codEstado` int(10) unsigned NOT NULL,
  `nome` text NOT NULL,
  `tituloLegislador` text NOT NULL,
  `codMunicipio` int(11) unsigned NOT NULL,
  `pontuacao` double NOT NULL,
  PRIMARY KEY (`codInstituicao`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `legislador`
--

CREATE TABLE IF NOT EXISTS `legislador` (
  `codLegislador` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codEstado` int(11) unsigned NOT NULL,
  `codMunicipio` int(11) unsigned NOT NULL,
  `codInstituicao` int(11) unsigned NOT NULL,
  `ano` int(11) NOT NULL,
  `codPartido` int(11) unsigned NOT NULL,
  `nome` text NOT NULL,
  `pontuacao` double NOT NULL,
  PRIMARY KEY (`codLegislador`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
  `codMunicipio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codEstado` int(11) unsigned NOT NULL,
  `nome` text NOT NULL,
  PRIMARY KEY (`codMunicipio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `partido`
--

CREATE TABLE IF NOT EXISTS `partido` (
  `codPartido` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `pontuacao` double NOT NULL,
  PRIMARY KEY (`codPartido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `codProjeto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codInstituicao` int(10) unsigned NOT NULL,
  `dataVotacao` datetime NOT NULL,
  `titulo` text NOT NULL,
  `resumo` text NOT NULL,
  `link` text NOT NULL,
  `codLegislador` int(11) unsigned NOT NULL,
  `dataPublicacao` datetime NOT NULL,
  `pontuacao` double NOT NULL,
  PRIMARY KEY (`codProjeto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `senha` text NOT NULL,
  `privilegio` int(11) NOT NULL,
  PRIMARY KEY (`codUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto_legislador`
--

CREATE TABLE IF NOT EXISTS `voto_legislador` (
  `codVoto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codProjeto` int(10) unsigned NOT NULL,
  `codLegislador` int(10) unsigned NOT NULL,
  `votoSim` int(11) NOT NULL,
  `votoNao` int(11) NOT NULL,
  PRIMARY KEY (`codVoto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto_site`
--

CREATE TABLE IF NOT EXISTS `voto_site` (
  `codVoto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codProjeto` int(10) unsigned NOT NULL,
  `votoSim` int(11) NOT NULL,
  `votoNao` int(11) NOT NULL,
  PRIMARY KEY (`codVoto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto_usuario`
--

CREATE TABLE IF NOT EXISTS `voto_usuario` (
  `codVoto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codProjeto` int(10) unsigned NOT NULL,
  `codUsuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codVoto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

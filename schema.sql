-- Criar tabela de moradores
CREATE TABLE IF NOT EXISTS moradores (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  telefone VARCHAR(20),
  endereco TEXT,
  condominio VARCHAR(255),
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de prestadores
CREATE TABLE IF NOT EXISTS prestadores (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  telefone VARCHAR(20),
  profissao VARCHAR(255),
  descricao TEXT,
  categoria VARCHAR(100),
  avaliacao DECIMAL(3,2) DEFAULT 0,
  verificado BOOLEAN DEFAULT FALSE,
  selo_superqi BOOLEAN DEFAULT FALSE,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de serviços
CREATE TABLE IF NOT EXISTS servicos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  prestador_id UUID REFERENCES prestadores(id) ON DELETE CASCADE,
  titulo VARCHAR(255) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2),
  categoria VARCHAR(100),
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de avaliações
CREATE TABLE IF NOT EXISTS avaliacoes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  morador_id UUID REFERENCES moradores(id) ON DELETE CASCADE,
  prestador_id UUID REFERENCES prestadores(id) ON DELETE CASCADE,
  nota INTEGER CHECK (nota >= 1 AND nota <= 5),
  comentario TEXT,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de contatos
CREATE TABLE IF NOT EXISTS contatos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  morador_id UUID REFERENCES moradores(id) ON DELETE CASCADE,
  prestador_id UUID REFERENCES prestadores(id) ON DELETE CASCADE,
  mensagem TEXT,
  status VARCHAR(50) DEFAULT 'novo',
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar índices para melhor performance
CREATE INDEX idx_moradores_email ON moradores(email);
CREATE INDEX idx_prestadores_email ON prestadores(email);
CREATE INDEX idx_prestadores_categoria ON prestadores(categoria);
CREATE INDEX idx_servicos_prestador ON servicos(prestador_id);
CREATE INDEX idx_avaliacoes_prestador ON avaliacoes(prestador_id);
CREATE INDEX idx_contatos_morador ON contatos(morador_id);
CREATE INDEX idx_contatos_prestador ON contatos(prestador_id);

-- Habilitar RLS (Row Level Security) - opcional
ALTER TABLE moradores ENABLE ROW LEVEL SECURITY;
ALTER TABLE prestadores ENABLE ROW LEVEL SECURITY;
ALTER TABLE servicos ENABLE ROW LEVEL SECURITY;
ALTER TABLE avaliacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE contatos ENABLE ROW LEVEL SECURITY;


# ConectarPRO - Netlify + Supabase

Plataforma de conexão entre moradores e prestadores de serviço, hospedada no Netlify com banco de dados no Supabase.

## Setup Rápido

### 1. Clonar o Repositório
```bash
git clone <seu-repo>
cd conectarpro-netlify
```

### 2. Instalar Dependências
```bash
npm install
```

### 3. Configurar Variáveis de Ambiente
Crie um arquivo `.env.local` com:
```
VITE_SUPABASE_URL=https://dvbomxvwqspdtyeuyiwl.supabase.co
VITE_SUPABASE_ANON_KEY=seu_api_key_aqui
```

### 4. Criar Tabelas no Supabase
1. Acesse o Supabase Dashboard
2. Vá para **SQL Editor**
3. Crie uma nova query
4. Copie o conteúdo de `schema.sql`
5. Execute a query

### 5. Testar Localmente
```bash
npm run dev
```

### 6. Deploy no Netlify
```bash
netlify deploy --prod
```

## Estrutura do Projeto

```
conectarpro-netlify/
├── public/
│   └── index.html              # Site HTML
├── netlify/
│   └── functions/
│       ├── moradores.js        # API para moradores
│       └── prestadores.js      # API para prestadores
├── netlify.toml                # Configuração do Netlify
├── package.json                # Dependências
├── schema.sql                  # Schema do banco de dados
└── README.md                   # Este arquivo
```

## APIs Disponíveis

### Moradores
- `GET /.netlify/functions/moradores` - Listar moradores
- `POST /.netlify/functions/moradores` - Criar morador

### Prestadores
- `GET /.netlify/functions/prestadores` - Listar prestadores
- `POST /.netlify/functions/prestadores` - Criar prestador

## Variáveis de Ambiente (Netlify)

Configure no painel do Netlify:
- `VITE_SUPABASE_URL` - URL do Supabase
- `VITE_SUPABASE_ANON_KEY` - API Key do Supabase

## Suporte

Para dúvidas, entre em contato através da plataforma.

---

**ConectarPRO** - Conectando Condomínios e Prestadores de Serviço ✨


# Entre Línguas

Site de estudo de português brasileiro para uma falante nativa de espanhol. A interface, as explicações e as correções estão em espanhol. O conteúdo prioriza a transferência entre os idiomas e o uso cotidiano brasileiro com `você`.

## Abrir a prévia

Com Node.js instalado, execute nesta pasta:

```sh
node server.cjs
```

Abra **http://localhost:43871**. O servidor escuta apenas na interface local. Não há instalação de dependências nem etapa de build. Também é possível abrir `index.html` diretamente; nesse caso, a persistência depende das permissões do navegador para arquivos locais.

## Organização

- `index.html`: estrutura, navegação e referências de consulta.
- `styles.css`: tema visual e layouts responsivos.
- `content.js`: todos os temas, explicações, exemplos e exercícios.
- `app.js`: navegação, busca, prática, favoritos e progresso.
- `server.cjs`: servidor opcional para a prévia local.

O site contém 7 temas, 50 exemplos e 50 exercícios. O tema de hipóteses tem 14 exercícios e um comparador de três intenções: condição futura, hipótese imaginada e hipótese passada.

## Adicionar um tema

Adicione um objeto ao array `window.LESSONS` de `content.js`, antes do `.map()` final. Não precisa editar o HTML, o roteador ou as telas de progresso. As categorias dos filtros são geradas a partir dos temas.

```js
{
  id: 'id-unico-sem-espacos',
  title: 'Título en español',
  short: 'Título corto',
  category: 'Palabras',
  icon: 'book',
  color: 'green',
  time: 6,
  description: 'Una explicación corta del tema.',
  tags: ['Etiqueta'],
  takeaway: 'La conexión principal que quieres recordar.',
  sections: [
    section('Una idea sencilla', '<p>Explicación en español y <span lang="pt-BR">exemplo em português</span>.</p>')
  ],
  examples: [
    ex('Frase en español.', 'Frase em português.', 'Por qué se dice así.')
  ],
  exercises: [
    choice('Elige la respuesta.', 'Contexto de la situación.', ['Incorrecta', 'Correcta', 'Incorrecta'], 1, 'Explicación de la respuesta.'),
    write('Completa la palabra.', 'Frase con ___.', ['respuesta', 'otra variante válida'], 'Explicación.')
  ]
}
```

O índice da alternativa correta começa em **0**. A comparação das respostas escritas ignora maiúsculas, espaços nas pontas e pontuação final, mas preserva os acentos. Inclua em `answers` todas as variantes que pretende aceitar. Insira apenas HTML confiável em `sections.body`; esse conteúdo é renderizado como HTML.

Cores disponíveis: `green`, `peach`, `blue`, `rose`, `yellow`, `lilac`. Ícones: `spark`, `circles`, `branch`, `heart`, `trophy`, `lock`, `moon`, `book`, `route`, `bookmark`.

Mantenha os IDs dos temas existentes e a ordem dos exercícios e exemplos para preservar as referências já salvas nos navegadores. Se alterar a estrutura do armazenamento, use uma nova versão da chave em `app.js` ou implemente uma migração.

## Progresso e revisão

O navegador salva os melhores resultados, tentativas completas, exemplos favoritos, último tema visitado e perguntas erradas em `localStorage`. Não há conta ou servidor de dados. Um tema fica afianzado com pelo menos **80% na prática completa**. Rever apenas os erros não aumenta artificialmente esse resultado. Responder corretamente a uma pergunta remove seu erro da lista de revisão.

O progresso não é sincronizado entre navegadores, aparelhos, portas ou domínios. Limpar os dados do navegador também remove o progresso.

## Publicação no GitHub Pages

Endereço público: **https://brunogottlieb.github.io/nathy/**.

O código deste projeto fica na pasta **`nathy/`** da branch **`main`** do repositório [BrunoGottlieb/brunogottlieb.github.io](https://github.com/BrunoGottlieb/brunogottlieb.github.io/tree/main/nathy). A publicação usa o GitHub Pages já configurado no repositório.

Para futuras atualizações, envie os arquivos deste projeto apenas para `nathy/`. Preserve o `index.html` da raiz, as pastas `assets/`, `images/` e os demais arquivos do site principal. As alterações na branch publicada acionam o deploy existente do Pages.

Os caminhos dos assets são relativos e a navegação usa hashes (`#/tema/...`), então funcionam na subpágina `/nathy/`, sem reescrita de URLs ou arquivo 404 especial. `server.cjs` é apenas uma ferramenta local; não é necessário em produção.

As fontes DM Sans e Manrope são carregadas do Google Fonts, com fontes de sistema como alternativa. O restante do site não depende de serviços externos para funcionar.

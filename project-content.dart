class Data {
  static const String unity = 'images/Unity.png';
  static const String author = 'images/Author.jpg';
  static const String gradient = 'images/GradientBackground.jpg';
  static const String desktopGradient = 'images/DesktopGradient.jpg';

  static const String linkedinIcon = 'icons/linkedin_white.png';
  static const String mailIcon = 'icons/mail_icon.png';

  static bool isBrazilian = false;

  static const List<String> bioList = [
    'Desenvolvedor Unity com 5+ anos de experiência profissional.',
    'Atuei em projetos de Realidade Virtual, Machine Learning, Networking, Android, iOS, Simuladores, dentre outros.',
    'Aqui você encontrará alguns de meus projetos e um pouco da história sobre cada um.'
  ];

  static String getBio() {
    return isBrazilian ? brazilianBio : englishBio;
  }

  static String brazilianBio =
      'Desenvolvedor Unity com 7+ anos de experiência profissional. \n\nAtuei em projetos de Realidade Virtual, Machine Learning, Networking, Android, iOS, Simuladores, dentre outros. \n\nAqui você encontrará alguns de meus projetos e um pouco da história sobre cada um.';

  static String englishBio =
      'Unity developer with over 7 years of professional experience. \n\nI worked on Virtual Reality, Machine Learning, Networking, Android, iOS, Simulators projects, among others. \n\nHere you will find some of my projects and a little history about each one.';

  static const String lore =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  static List<ProjectData> getProjectsList() {
    return isBrazilian ? portugueseProjectsList : englishProjectsList;
  }

  static final List<ProjectData> portugueseProjectsList = [
    ProjectData(
      'Rogue Masters',
      'Advance Garde',
      Category._3D,
      [
        'Rogue Masters é um souls-like cooperativo, onde o objetivo é combater a entropia em intensas batalhas de hordas, jogáveis em até 6 jogadores. O jogo também oferece, em seu early access, um modo deathmatch e um modo versus. Como um dos pontos mais interessantes, possui um amplo sistema de transmogrificação, onde os jogadores podem alterar a aparência de seus equipamentos sem modificar suas estatísticas.',
        '\nPara mim, foi uma honra entrar para o time de desenvolvimento, pois sempre admirei muito o estilo souls. Trabalhar em um jogo cooperativo, lançado na Steam, foi uma grande oportunidade para aprimorar minhas habilidades. Durante os dois anos em que atuei no projeto, trabalhei com funcionalidades de networking, server, cloud saving, localização, além de implementar recursos como o mapeamento de teclas e a UI como um todo.',
        '\nDesenvolver um jogo multijogador deste porte foi, potencialmente, a experiência mais desafiadora do projeto. Garantir que o jogo funcione corretamente em sincronia para todos os jogadores demandou bastante trabalho da equipe e do processo de controle de qualidade.',
        '\nAlém dos aspectos técnicos, um dos pontos altos desse período foi a dinâmica da equipe. Sempre senti o ambiente altamente colaborativo e divertido, onde a comunicação fluía de maneira eficiente e todos estavam comprometidos com o projeto. Acredito que essa interação tenha enriquecido não apenas o jogo, mas também à mim.',
        '\nVer meu nome nos créditos de um jogo na Steam é também um passo adiante na minha carreira. Saber que contribuí para um projeto que gosto e que também pode ser apreciado por outros jogadores é algo que me deixa contente. Espero que venham mais projetos como este.'
      ],
      [
        'images/rogueMasters/RogueMasters_1.jpg',
        'images/rogueMasters/RogueMasters_2.jpg',
        'images/rogueMasters/RogueMasters_3.jpg',
        'images/rogueMasters/RogueMasters_4.jpg',
        'images/rogueMasters/RogueMasters_5.jpg',
        'images/rogueMasters/RogueMasters_6.jpg',
        'images/rogueMasters/RogueMasters_7.jpg',
      ],
    ),
    ProjectData(
      'Truck Simulator',
      'Rota Simuladores',
      Category._3D,
      [
        '\nProjeto desenvolvido através da Rota Simuladores, com o objetivo de servir como uma ferramenta auxiliar para motoristas de ônibus e caminhões, oferecendo simulações realistas de física e dirigibilidade. Além da simulação de veículos, também foi criado um sistema para a elaboração de aulas personalizadas, oferecendo uma ampla gama de aplicações para instrutores. Atuei neste projeto como desenvolvedor principal.',
        '\nO desenvolvimento deste projeto foi desafiador devido à necessidade de compreender detalhadamente o funcionamento mecânico dos veículos e traduzir essa lógica para o ambiente virtual. A simulação realista exigiu a aplicação intensiva de conceitos de física da engine, assegurando que as dinâmicas de movimento, frenagem e manuseio dos veículos fossem representadas com precisão.',
        '\nO simulador é compatível com o hardware da Rota Simuladores, o qual consta nas imagens, incluindo também os dispositivos G29 e G920 da Logitech, assim como PC e joysticks.'
      ],
      [
        'images/truck/Truck_3.jpg',
        'images/truck/Truck_2.jpg',
        'images/truck/Truck_1.jpg',
        'images/truck/Truck_4.jpg',
        'images/truck/Truck_5.jpg',
      ],
    ),
    ProjectData(
      'Deepest Trench',
      'Main Leaf',
      Category._3D,
      [
        

        '\nDeepest Trench é um jogo de exploração marítima. O jogo é ambientado nas profundezas do oceano, onde o jogador encontra-se numa base abandonada e precisa trabalhar em equipe para desbravar os mistérios ali contidos. Combinando elementos de mistério e exploração, o jogo oferece uma experiência que desafia os jogadores a resolverem enigmas enquanto desbravam o ambiente.',
        '\nEste título pode ser jogado tanto em modo solo, quanto em modo cooperativo. Há também suporte ao Remote Play via Steam e layout para teclado e joystick. Minhas contribuições ao projeto concentraram-se principalmente no desenvolvimento da UI e elementos associados à ela. Também contribuí com a implementação de alguns elementos de gameplay, garantindo que as mecânicas fossem coerentes com a narrativa e o fluxo de jogo.',
        '\nO jogo foi lançado oficialmente em 30 de outubro de 2024, sendo este o segundo jogo presente na Steam a ter meu nome nos créditos.'
      ],
      [
        'images/deepestTrench/deepest_1.jpg',
        'images/deepestTrench/deepest_2.jpg',
        'images/deepestTrench/deepest_3.jpg',
        'images/deepestTrench/deepest_4.jpg',
      ],
    ),
    ProjectData(
      'Souls-Like Boss Combat',
      'Bruno Gottlieb',
      Category._3D,
      [
        'Esse projeto surgiu através da minha paixão por Dark Souls. Sempre admirei o sistema de combate souls, então resolvi aproveitar a oportunidade para fazer um projeto onde o intuito fosse batalhar contra um chefe, usando as mecânicas tradicionais.',
        '\nPor trás das cortinas havia um motivo que me fazia querer investir ainda mais nesse projeto, que era a oportunidade de me aperfeiçoar em animações de modo geral e na lógica de movimentação e interação de personagens. O que ainda é, até hoje, o projeto que mais me possibilitou crescer neste tópico.',
        '\nAproveitando o meu estudo, resolvi disponibilizar um vídeo demonstrativo do projeto no Youtube e posteriormente disponibilizei o código fonte no GitHub para quem pudesse se beneficiar dele.',
        '\nPor fim, acabou sendo uma boa abordagem pois foi interessante ver a interação do público e me motivou a seguir com esse tipo de projeto, posteriormente entrando para o time do Rogue Masters; projeto onde trabalhei durante dois anos e consta no topo deste portfólio.',
        '\nAinda possuo planos de fazer um projeto de combate mais aprimorado utilizando a Unreal Engine 5 em algum futuro próximo.'
      ],
      [
        'images/soulsLike/SoulsLike_1.jpg',
        'images/soulsLike/SoulsLike_2.jpg',
        'images/soulsLike/SoulsLike_3.jpg',
        'images/soulsLike/SoulsLike_4.jpg',
      ],
    ),
    ProjectData(
      'HDRP Souls',
      'Bruno Gottlieb',
      Category._3D,
      [
        'Eis que 4 anos após eu ter desenvolvido o Souls-Like Boss Combat e publicado o projeto no Youtube e GitHub, eu resolvo fazer uma versão aprimorada deste projeto.',
        '\nA nova versão utiliza o HDRP e possui animações muito mais fluídas. Para isso, utilizei um pacote de animações com movimentação 8D, juntamente com animações criadas usando a ferramenta Muse da Unity, na qual gera animações através do uso de IA com interpolação de frames.',
        '\nA IA também foi bem aprimorada, agora utilizando States Machine e sendo muito mais modular do que antes. A nova versão possui diferentes combos e reações dependendo do posicionando e ações do jogador. Cada ação é facilmente flexível à mudanças.',
        '\nTomei como inspiração a DLC do Elden Ring para iniciar esse projeto, fiquei instigado a estudar mais por gostar desse tipo de jogo e ver o quão fluído são os bosses da From Software. Creio que os projetos em que mais me aprimoro são esses onde entro de cabeça e me esforço muito durante muito tempo.'
      ],
      [
        'images/hdrpSouls/hdrpSouls_1.jpg',
        'images/hdrpSouls/hdrpSouls_2.jpg',
        'images/hdrpSouls/hdrpSouls_3.jpg',
        'images/hdrpSouls/hdrpSouls_4.jpg',
        'images/hdrpSouls/hdrpSouls_5.jpg',
      ],
    ),
    ProjectData(
      'Tropical Racing',
      'Simbox Studios',
      Category._3D,
      [
        'Tropical Racing é um jogo de corrida arcade voltado para o uso em cockpits automobilísticos com suporte à force feedback e motion feedback.',
        '\nEsse foi o primeiro projeto em que tive contato com esse tipo de hardware. O próprio contato com um jogo de corrida também me auxiliou muito para o desenvolvimento do simulador automobilístico posteriormente.',
        '\nEste acabou sendo um dos projetos mais divertidos que participei, uma vez que seu desenvolvimento proporcionou uma ótima interação entre a equipe na época, onde frequentemente disputávamos para ver quem era o jogador com melhor tempo.'
            '\nThis ended up being one of the most fun projects I participated in, as its development provided great interaction between the team at the time, where we often competed to see who was the player with the best time.'
      ],
      [
        'images/tropicalRacing/TropicalRacing_1.jpg',
        'images/tropicalRacing/TropicalRacing_2.jpg',
      ],
    ),
    ProjectData(
      'Motorcycle Game',
      'Simbox Studios',
      Category._3D,
      [
        'Com uma ideia bem similar à do Tropical Racing, esse jogo de motovelocidade estava sendo desenvolvido para o uso em hardware simulador de moto. Sendo o hardware desenvolvido na fábrica da Rota Simuladores.',
        '\nEntretanto, apesar da confecção do hardware, ao decorrer do processo o jogo acabou não sendo concluído. Como ele nunca chegou a levar um nome, deixarei aqui ao título de Motorcycle game.'
      ],
      [
        'images/motorcycle/Motorcycle_1.jpg',
        'images/motorcycle/Motorcycle_2.jpg',
        'images/motorcycle/Motorcycle_3.jpg',
      ],
    ),
    ProjectData(
      'Sky Crossing',
      'Simbox Studios',
      Category.VR,
      [
        '\nEste foi o meu primeiro projeto envolvendo o desenvolvimento de jogos para Realidade Virtual, inicialmente utilizando Oculus Rift e Oculus Rift S. Posteriormente, também tive a oportunidade de trabalhar com o Quest 2, ampliando ainda mais minha experiência na área.',
        '\nO jogo consiste em uma pequena cena projetada para centros de entretenimento, com o objetivo de simular uma travessia em grande altitude, proporcionando sensações intensas de adrenalina aos jogadores.'
      ],
      [
        'images/skyCrossing/SkyCrossing_1.jpg',
        'images/skyCrossing/SkyCrossing_2.jpg',
      ],
    ),
    ProjectData(
      'The Grand Sheriff',
      'Simbox Studios',
      Category.VR,
      [
        'Assim como o Tropical Racing, esse jogo foi desenvolvido para ser usado com óculos de realidade virtual em centros de entretenimento. Sendo assim, o segundo jogo em que tive contato com o desenvolvimento VR.',
        '\nSeu objetivo é simular um tiroteio num cenário de faroeste. O jogo é dividido em duas versões, uma diurna e uma noturna, sendo essa segunda composta por maior nível de ação e dificuldade.',
        '\nCom um foco na competitividade, ao final de cada partida é exibida a pontuação do jogador e inserida numa tabela de líderes, processo realizado através do vínculo com os servidores da Simbox Studios.'
      ],
      [
        'images/theGrandSheriff/TheGrandSheriff_1.jpg',
        'images/theGrandSheriff/TheGrandSheriff_2.jpg',
      ],
    ),
    ProjectData(
      'Kamê Kanhru',
      'LabInter UFSM',
      Category._2D,
      [
        'Este é um projeto muito importante para mim, pois, foi o projeto em que me colocou no ramo de desenvolvimento de jogos. Ao final do segundo ano da faculdade de Ciência da Computação, acabei chegando até este projeto através de uma indicação, o que mudaria o rumo da minha carreira daí em diante.',
        '\nO projeto é sediado no Centro de Artes e Letras da Universidade Federal de Santa Maria (UFSM) e possui uma equipe multidisciplinar de variados cursos da própria universidade.',
        '\nSeu intuito é manter viva a cultura Kaingáng através de aprendizagem interativa, servindo assim, como ferramenta de ensino nas escolas indígenas. Aqui o jogador poderá ter contato com o idioma Kaingáng, através da escrita e das falas, além de aprender sobre a história através da interação com elementos culturais importantes.',
        '\nO jogo é composto de uma campanha principal em 3D e de mini jogos em 2D, acessados através da campanha. Aqui nesse portfólio coloquei imagens apenas de alguns dos mini jogos, visto que o 3D ainda está em desenvolvimento.',
        '\nPara garantir a integridade do projeto, são realizadas dinâmicas entre escolas e comunidades Kaingángs de Santa Maria RS e Tenente Portela RS. Dessa forma podemos interagir com os professores e com as crianças, o que me trouxe uma experiência totalmente diferente do que eu estava acostumado, uma vez que passei a ter uma visão mais humanitária e contato muito mais próximo do que o habitual apenas no curso de computação.',
        '\nO jogo será lançado tanto para desktops quanto para dispositivos móveis, sendo a acessibilidade um de seus focos principais.',
        '\nEncontro-me próximo ao time e ao projeto até os dias atuais, entretanto, não estou mais atuando como programador, visto que com o tempo precisei de mais tempo para focar em outros projetos.'
      ],
      [
        'images/projetoIndigena/ProjetoIndigena_1.jpg',
        'images/projetoIndigena/ProjetoIndigena_2.jpg',
        'images/projetoIndigena/ProjetoIndigena_3.jpg',
        'images/projetoIndigena/ProjetoIndigena_4.jpg',
        'images/projetoIndigena/ProjetoIndigena_5.jpg',
        'images/projetoIndigena/ProjetoIndigena_6.jpg',
        'images/projetoIndigena/ProjetoIndigena_7.jpg',
        'images/projetoIndigena/ProjetoIndigena_8.jpg',
        'images/projetoIndigena/ProjetoIndigena_9.jpg',
        'images/projetoIndigena/ProjetoIndigena_10.jpg',
      ],
    ),
    ProjectData(
      'Tigres e Cachorros',
      'LabInter UFSM',
      Category._2D,
      [
        'Estava eu numa tarde exibindo o Projeto Indígena Kamé Kanhru para o público da cidade de Santa Maria, num evento da UFSM, quando um casal indígena vem até minha banca e comenta sobre o Jogo dos Tigres e dos Cachorros.',
        '\nEles comentaram sobre como o jogo é culturalmente jogado no chão, fazendo as marcações das linhas no chão com gravetos e usando grãos de feijão / arroz ou pedrinhas como peças. Em seguida, conseguiram uma folha, para desenhar como era o tabuleiro, juntamente com algumas miçangas para usar como peças e me ensinaram a jogar.',
        '\nO jogo consiste numa partida entre dois jogadores, onde um comanda dois tigres e outro comanda os cachorros. Os tigres vencem o jogo após comer um certo nível de cachorros. Os cachorros vencem após encurralar os tigres, deixando-os sem casas livres para se movimentar. Em geral é um bom jogo de estratégia e que demonstra conceitos de trabalho em equipe.',
        '\nFalando um pouco de seu desenvolvimento, resolvi aproveitar a oportunidade e torná-lo multijogador local e online. Foi a primeira vez em que tive contato com alguma networking na Unity. Nesse caso, a Photon Framework. O que serviu de grande aprendizado para troca de mensagens via RPC, uma vez que mesmo atualmente usando o Mirror, a ideia é extremamente similar.',
        '\nO fato do jogo ser multijogador online permite algo que antes ainda não era possível: a interação entre jogadores de diferentes comunidades ao redor do país. Acredito que atualmente ainda não há disponível outra versão desse jogo com esse mesmo propósito.'
      ],
      [
        'images/tigresCachorros/TigresCachorros_1.jpg',
        'images/tigresCachorros/TigresCachorros_2.jpg',
        'images/tigresCachorros/TigresCachorros_3.jpg',
        'images/tigresCachorros/TigresCachorros_4.jpg',
        'images/tigresCachorros/TigresCachorros_5.jpg',
        'images/tigresCachorros/TigresCachorros_6.jpg',
      ],
    ),
    ProjectData(
      'Santa is Late for Christmas!',
      'Triplano',
      Category._3D,
      [
        'Este foi um projeto de duas semanas, oriundo de um processo seletivo onde o objetivo era fazer um jogo estilo endless runner para mobile. Optei por utilizar a temática natalina e acabei gostando do resultado. A programação desse projeto possui alguns diferenciais, a exemplo, foi a primeira vez que utilizei o New Input System.'
      ],
      [
        'images/santa/santaMedley.jpg',
      ],
    ),
    ProjectData(
      'FastRak',
      'Triplano',
      Category._2D,
      [
        'Este projeto, na verdade, não trata-se de um jogo mas sim de um aplicativo. Entretanto ele demonstrou-se bem desafiador e usa diversos elementos complexos, então achei muito válido de pôr aqui neste portfólio.',
        '\nTrata-se de um aplicativo de caça para ser utilizado em território estadunidense. Toda a interface do aplicativo funciona em conjunto com o backend, solicitando e enviando informações através de rotas implementadas com o servidor AWS.',
        '\nDentre suas principais funções, destacam-se: Tela de login / cadastro, confirmação de OTP via e-mail, login com rede social, informações completas de clima (através da API do OpenWeather), mapa interativo (através do SDK do MapBox), informações de propriedade (através da API do ReportAllUSA), cena de simulação com cervo em 3D, questionários, listas de seguidores, feed de rede social, envio de imagens, tracking com GPS, chat, notificações, dentre outros.'
      ],
      [
        'images/fastRak/fastRak_1.jpg',
        'images/fastRak/fastRak_2.jpg',
        'images/fastRak/fastRak_3.jpg',
        'images/fastRak/fastRak_4.jpg',
      ],
    ),
    ProjectData(
      'Pong ML',
      'Bruno Gottlieb',
      Category._2D,
      [
        'A história desse projeto é a seguinte: Estava eu cursando a disciplina de Inteligência Artificial na faculdade e precisava escolher um tópico de Redes Neurais para fazer um trabalho prático / teórico. Com isso, eu já ciente da existência da ferramenta ML-Agents da Unity, resolvi escolher o tópico de Machine Learning.',
        '\nTendo o tópico escolhido e já estudado a parte teórica, resolvi aplicar os conhecimentos na prática. Assim, pensei comigo mesmo: preciso de um jogo que seja multijogador, rápido de implementar e que seja divertido de jogar. Aí que surge o clássico Pong na história.',
        '\nMeu principal objetivo com isso era sanar algumas dúvidas, tais como: 1. Consigo implementar uma IA capaz de derrotar um humano? 2. Qual será o comportamento desta IA, ela irá se parecer com um jogador humano? 3. Quanto tempo será necessário para treiná-la?',
        '\nEm resumo, criei duas versões da IA. A 1.0 tendo treinado por 7 minutos, resultando numa acurácia de 80% e variação de 20%; e a 2.0 tendo treinado por 3 horas, resultando numa acurácia de 99.4% e variação de 1%.',
        '\nAlém da sala de aula, cheguei a ministrar uma oficina de Machine Learning utilizando esse projeto no Centro de Artes e Letras da UFSM, explicando os conceitos básicos de ML e permitindo a interação das pessoas com o jogo. Esta foi uma boa oportunidade de espalhar o conhecimento.'
      ],
      [
        'images/pongML/PongML_1.png',
        'images/pongML/PongML_2.png',
      ],
    ),
    ProjectData(
      'Lunar Lander',
      'Bruno Gottlieb',
      Category._2D,
      [
        'Lunar Lander foi o segundo jogo que desenvolvi na Unity. Considero ele parte fundamental do começo da minha jornada como desenvolvedor de jogos e sempre o levo com bastante carinho na memória.',
        '\nAqui o jogador deve controlar uma nave espacial usando os comandos de toque na tela e rotação do dispositivo móvel através do acelerômetro. O jogo possui 10 fases com dificuldade progressiva e o objetivo de cada uma delas é pousar a nave em segurança no destino indicado.',
        '\nApesar dos gráficos e UI serem totalmente primitivos, acredito que seja um jogo divertido de modo geral e mostra a minha evolução como desenvolvedor.'
      ],
      [
        'images/lunarLander/LunarLander_1.jpg',
        'images/lunarLander/LunarLander_2.jpg',
        'images/lunarLander/LunarLander_3.jpg',
      ],
    ),
    ProjectData(
      'Pinky Lander',
      'Bruno Gottlieb',
      Category._2D,
      [
        'Com o surgimento do sistema de iluminação 2D da Unity, senti vontade de fazer um projeto para testá-lo na prática. Assim surgiu Pinky Lander, meio como um sucessor do Lunar Lander.',
        '\nA ideia aqui é bem similar, o jogador controla uma espécie de nave através do acelerômetro do celular e toques na tela. Com adição de algumas mecânicas, como a de toque com um dedo para aceleração lenta e dois dedos para aceleração rápida. Outra mecânica é que agora o dano de colisão passou a ser bem menos punitivo, apenas em casos de velocidade muito alta.',
        '\nA minha ideia inicial era pôr o jogo na Play Store, entretanto, devido à má otimização da iluminação 2D em dispositivos móveis na época, o projeto acabou ficando engavetado. Agora durante o desenvolvimento deste site resolvi resgatar o projeto e ver como ele está. Notei que algumas luzes acabaram se comportando de maneira estranha na transição do projeto para a Unity 2022.2.0f1, no fim é uma daquelas coisas que tenho vontade de ajeitar mas que potencialmente jamais será feito.'
      ],
      [
        'images/newLunarLander/newLunarLander_5.jpg',
        'images/newLunarLander/newLunarLander_6.jpg',
        'images/newLunarLander/newLunarLander_7.jpg',
        'images/newLunarLander/newLunarLander_8.jpg',
        'images/newLunarLander/newLunarLander_2.png',
        'images/newLunarLander/newLunarLander_3.png',
        'images/newLunarLander/newLunarLander_4.png',
      ],
    ),
    ProjectData(
      'Insomnia',
      'Bruno Gottlieb',
      Category._2D,
      [
        'O surgimento de Insomnia é uma história peculiar, nascida de uma necessidade pessoal. Num dia de recesso do trabalho, me vi em uma situação em que meus horários estavam completamente trocados, dormindo durante o dia e ficando acordado à noite. Percebi que precisava tomar alguma atitude a respeito. Precisava buscar algo para ocupar meu tempo durante o dia todo, de modo a permanecer acordado até a noite seguinte, quando poderia dormir e regularizar meu horário. Foi então que me sentei em frente ao computador. Decidi que faria algo, qualquer coisa - um projeto, um jogo; afinal, era o que sabia fazer. E assim, após 12 horas consecutivas de desenvolvimento, surge-se o protótipo de Insomnia. O nome, uma homenagem ao seu propósito original, traduz justamente essa jornada de ajuste do ciclo de sono.',
        '\nO resultado foi duplamente positivo: não apenas consegui ajustar meu horário de sono, mas também criei um jogo divertido para dispositivos móveis. Aproveitei a oportunidade para estudar os serviços da PlayGames, incorporando conquistas e tabelas de liderança ao jogo.',
        '\nInspirado no estilo arcade clássico, Insomnia coloca o jogador no controle de uma nave espacial. O objetivo é avançar enquanto enfrenta uma variedade de inimigos. Cada inimigo possui uma cor específica e um comportamento único, exigindo do jogador adaptabilidade e estratégias para supera-los. À medida que o jogador avança, novos inimigos surgem, aumentando gradualmente a dificuldade.',
      ],
      [
        'images/Insomnia/insomnia_1.png',
      ],
    ),
  ];

  static final List<ProjectData> englishProjectsList = [
    ProjectData(
      'Rogue Masters',
      'Advance Garde',
      Category._3D,
      [
        'Rogue Masters is a cooperative souls-like game, where the objective is to combat entropy in intense horde battles, playable with up to 6 players. The game also offers, in its early access, a deathmatch mode and a versus mode. As one of the most interesting points, it has an extensive transmogrification system, where players can change the appearance of their equipment without modifying their statistics.',
        '\nFor me, it was an honor to join the development team, as I have always greatly admired the souls style. Working on a cooperative game, released on Steam, was a great opportunity to improve my skills. During the two years that I worked on the project, I worked with networking, server, cloud saving, localization functionalities, in addition to implementing features such as key mapping and the UI as a whole.',
        '\nDeveloping a multiplayer game of this size was, potentially, the most challenging experience of the project. Ensuring that the game works correctly in sync for all players required a lot of work from the team and the quality control process.',
        '\nIn addition to the technical aspects, one of the highlights of this period was the team dynamics. I always felt the environment was highly collaborative and fun, where communication flowed efficiently and everyone was committed to the project. I believe that this interaction has enriched not only the game, but also me.',
        '\nSeeing my name in the credits of a game on Steam is also a step forward in my career. Knowing that I contributed to a project that I like and that can also be enjoyed by other players is something that makes me happy. I hope there are more projects like this.'
      ],
      [
        'images/rogueMasters/RogueMasters_1.jpg',
        'images/rogueMasters/RogueMasters_2.jpg',
        'images/rogueMasters/RogueMasters_3.jpg',
        'images/rogueMasters/RogueMasters_4.jpg',
        'images/rogueMasters/RogueMasters_5.jpg',
        'images/rogueMasters/RogueMasters_6.jpg',
        'images/rogueMasters/RogueMasters_7.jpg',
      ],
    ),
    ProjectData(
      'Truck Simulator',
      'Rota Simuladores',
      Category._3D,
      [
        '\nProject developed through Rota Simuladores, with the aim of serving as an auxiliary tool for bus and truck drivers, offering realistic physics and drivability simulations. In addition to vehicle simulation, a system was also created for creating personalized classes, offering a wide range of applications for instructors. I worked on this project as main developer.',
        '\nThe development of this project was challenging due to the need to understand in detail the mechanical functioning of the vehicles and translate this logic into the virtual environment. The realistic simulation required the intensive application of engine physics concepts, ensuring that the dynamics of vehicle movement, braking and handling were accurately represented.',
        '\nThe simulator is compatible with Rota Simulators hardware, which appears in the images, also including Logitech\'s G29 and G920 devices, as well as PC and joysticks.'
      ],
      [
        'images/truck/Truck_3.jpg',
        'images/truck/Truck_2.jpg',
        'images/truck/Truck_1.jpg',
        'images/truck/Truck_4.jpg',
        'images/truck/Truck_5.jpg',
      ],
    ),
    ProjectData(
      'Deepest Trench',
      'Main Leaf',
      Category._3D,
      [
        

        '\nDeepest Trench is a sea exploration game. The game is set in the depths of the ocean, where the player finds himself in an abandoned base and needs to work as a team to uncover the mysteries contained there. Combining elements of mystery and exploration, the game offers an experience that challenges players to solve puzzles while exploring the environment.',
        '\nThis title can be played both solo and cooperatively. There is also support for Remote Play via Steam and a keyboard and joystick layout. My contributions to the project focused mainly on the development of the UI and elements associated with it. I also contributed to the implementation of some gameplay elements, ensuring that the mechanics were coherent with the narrative and game flow.',
        '\nThe game was officially released on October 30, 2024, making this the second game on Steam to have my name in the credits.'
      ],
      [
        'images/deepestTrench/deepest_1.jpg',
        'images/deepestTrench/deepest_2.jpg',
        'images/deepestTrench/deepest_3.jpg',
        'images/deepestTrench/deepest_4.jpg',
      ],
    ),
    ProjectData(
      'Souls-Like Boss Combat',
      'Bruno Gottlieb',
      Category._3D,
      [
        'This project came about through my passion for Dark Souls. I\'ve always admired the souls combat system, so I decided to take the opportunity to do a project where the aim was to battle a boss, using traditional mechanics.',
        '\nBehind the scenes there was a reason that made me want to invest even more in this project, which was the opportunity to improve myself in animation in general and in the logic of character movement and interaction. Which is still, to this day, the project that allowed me to grow the most in this topic.',
        '\nTaking advantage of my study, I decided to make a demonstrative video of the project available on YouTube and later made the source code available on GitHub for anyone who could benefit from it.',
        '\nFinally, it ended up being a good approach as it was interesting to see the public\'s interaction and motivated me to continue with this type of project, later joining the Rogue Masters team; project where I worked for two years and is at the top of this portfolio.',
        '\nI still have plans to make a more improved combat project using Unreal Engine 5 in the near future.'
      ],
      [
        'images/soulsLike/SoulsLike_1.jpg',
        'images/soulsLike/SoulsLike_2.jpg',
        'images/soulsLike/SoulsLike_3.jpg',
        'images/soulsLike/SoulsLike_4.jpg',
      ],
    ),
    ProjectData(
      'HDRP Souls',
      'Bruno Gottlieb',
      Category._3D,
      [
        '4 years after I developed Souls-Like Boss Combat and published the project on Youtube and GitHub, I decided to make an improved version of this project.',
        '\nThe new version uses HDRP and has much more fluid animations. To do this, I used an animation package with 8D movement, along with animations created using Unity\'s Muse tool, which generates animations through the use of AI with frame interpolation.',
        '\nThe AI ​​has also been greatly improved, now using States Machine and being much more modular than before. The new version has different combos and reactions depending on the player\'s positioning and actions. Each action is easily flexible to change.',
        '\nI took the Elden Ring DLC ​​as inspiration to start this project, I was encouraged to study more because I like this type of game and see how fluid From Software\'s bosses are. I believe that the projects in which I improve the most are the ones where I jump in head first and put in a lot of effort for a long time.'
      ],
      [
        'images/hdrpSouls/hdrpSouls_1.jpg',
        'images/hdrpSouls/hdrpSouls_2.jpg',
        'images/hdrpSouls/hdrpSouls_3.jpg',
        'images/hdrpSouls/hdrpSouls_4.jpg',
        'images/hdrpSouls/hdrpSouls_5.jpg',
      ],
    ),
    ProjectData(
      'Tropical Racing',
      'Simbox Studios',
      Category._3D,
      [
        'Tropical Racing is an arcade racing game aimed at use in automobile cockpits with support for force feedback and motion feedback.',
        '\nThis was the first project in which I had contact with this type of hardware. The contact with a racing game also helped me a lot in developing the car simulator later.',
        '\nThis ended up being one of the most fun projects I participated in, as its development provided great interaction between the team at the time, where we often competed to see who was the player with the best time.'
      ],
      [
        'images/tropicalRacing/TropicalRacing_1.jpg',
        'images/tropicalRacing/TropicalRacing_2.jpg',
      ],
    ),
    ProjectData(
      'Motorcycle Game',
      'Simbox Studios',
      Category._3D,
      [
        'With a very similar idea to Tropical Racing, this motorcycle game was being developed for use on motorcycle simulator hardware. The hardware was developed at the Rota Simulators factory.',
        '\nHowever, despite the hardware being made, during the process the game ended up not being completed. As it never got a name, I\'ll leave it here with the title of Motorcycle game.'
      ],
      [
        'images/motorcycle/Motorcycle_1.jpg',
        'images/motorcycle/Motorcycle_2.jpg',
        'images/motorcycle/Motorcycle_3.jpg',
      ],
    ),
    ProjectData(
      'Sky Crossing',
      'Simbox Studios',
      Category.VR,
      [
        '\nThis was my first project involving the development of games for Virtual Reality, initially using Oculus Rift and Oculus Rift S. Later, I also had the opportunity to work with Quest 2, further expanding my experience in the area.',
        '\nThe game consists of a small scene designed for entertainment centers, with the aim of simulating a crossing at high altitude, providing intense sensations of adrenaline to players.'
      ],
      [
        'images/skyCrossing/SkyCrossing_1.jpg',
        'images/skyCrossing/SkyCrossing_2.jpg',
      ],
    ),
    ProjectData(
      'The Grand Sheriff',
      'Simbox Studios',
      Category.VR,
      [
        'Like Tropical Racing, this game was developed to be used with virtual reality glasses in entertainment centers. Therefore, the second game in which I had contact with VR development.',
        '\nYour objective is to simulate a shootout in a western setting. The game is divided into two versions, a daytime and a nighttime version, with the latter having a higher level of action and difficulty.',
        '\nWith a focus on competitiveness, at the end of each match the player\'s score is displayed and inserted into a leaderboard, a process carried out through the link with Simbox Studios servers.'
      ],
      [
        'images/theGrandSheriff/TheGrandSheriff_1.jpg',
        'images/theGrandSheriff/TheGrandSheriff_2.jpg',
      ],
    ),
    ProjectData(
      'Kamê Kanhru',
      'LabInter UFSM',
      Category._2D,
      [
        'This is a very important project for me, as it was the project that got me into the game development business. At the end of the second year of Computer Science college, I ended up coming to this project through a recommendation, which would change the direction of my career from then on.',
        '\nThe project is based at the Center for Arts and Letters at the Federal University of Santa Maria (UFSM) and has a multidisciplinary team from various courses at the university itself.',
        '\nIts aim is to keep the Kaingáng culture alive through interactive learning, thus serving as a teaching tool in indigenous schools. Here the player will be able to have contact with the Kaingáng language, through writing and speaking, in addition to learning about history through interaction with important cultural elements.',
        '\nThe game is made up of a 3D main campaign and 2D mini games, accessed through the campaign. Here in this portfolio I only included images of some of the mini games, since 3D is still in development.',
        '\nTo guarantee the integrity of the project, dynamics are carried out between schools and Kaingáng communities in Santa Maria RS and Tenente Portela RS. This way we can interact with the teachers and the children, which gave me a totally different experience than what I was used to, since I started to have a more humanitarian vision and much closer contact than usual only in the computing course. .',
        '\nThe game will be released for both desktop and mobile devices, with accessibility being one of its main focuses.',
        '\nI am close to the team and the project to this day, however, I am no longer working as a programmer, as over time I needed more time to focus on other projects.'
      ],
      [
        'images/projetoIndigena/ProjetoIndigena_1.jpg',
        'images/projetoIndigena/ProjetoIndigena_2.jpg',
        'images/projetoIndigena/ProjetoIndigena_3.jpg',
        'images/projetoIndigena/ProjetoIndigena_4.jpg',
        'images/projetoIndigena/ProjetoIndigena_5.jpg',
        'images/projetoIndigena/ProjetoIndigena_6.jpg',
        'images/projetoIndigena/ProjetoIndigena_7.jpg',
        'images/projetoIndigena/ProjetoIndigena_8.jpg',
        'images/projetoIndigena/ProjetoIndigena_9.jpg',
        'images/projetoIndigena/ProjetoIndigena_10.jpg',
      ],
    ),
    ProjectData(
      'Tigers and Dogs',
      'LabInter UFSM',
      Category._2D,
      [
        'I was showing the Kamé Kanhru Indigenous Project to the public in the city of Santa Maria one afternoon, at a UFSM event, when an indigenous couple came to my stall and commented on the Game of Tigers and Dogs.',
        '\nThey commented on how the game is culturally played on the ground, marking lines on the ground with sticks and using grains of beans/rice or pebbles as pieces. Then they got a piece of paper to draw what the board looked like, along with some beads to use as pieces, and they taught me how to play.',
        '\nThe game consists of a match between two players, where one commands two tigers and the other commands the dogs. Tigers win the game after eating a certain level of dogs. The dogs win after cornering the tigers, leaving them without free homes to move around. In general, it is a good strategy game that demonstrates teamwork concepts.',
        '\nTalking a little about its development, I decided to take the opportunity and make it local and online multiplayer. It was the first time I had contact with any networking at Unity. In this case, the Photon Framework. This served as a great learning experience for exchanging messages via RPC, since even though we currently use Mirror, the idea is extremely similar.',
        '\nThe fact that the game is online multiplayer allows something that wasn\'t possible before: interaction between players from different communities around the country. I believe that there is currently no other version of this game available for this same purpose.'
      ],
      [
        'images/tigresCachorros/TigresCachorros_1.jpg',
        'images/tigresCachorros/TigresCachorros_2.jpg',
        'images/tigresCachorros/TigresCachorros_3.jpg',
        'images/tigresCachorros/TigresCachorros_4.jpg',
        'images/tigresCachorros/TigresCachorros_5.jpg',
        'images/tigresCachorros/TigresCachorros_6.jpg',
      ],
    ),
    ProjectData(
      'Santa is Late for Christmas!',
      'Triplano',
      Category._3D,
      [
        'This was a two-week project, arising from a selection process where the objective was to make an endless runner style game for mobile. I chose to use the Christmas theme and ended up liking the result. The programming of this project has some differences, for example, it was the first time I used the New Input System.'
      ],
      [
        'images/santa/santaMedley.jpg',
      ],
    ),
    ProjectData(
      'FastRak',
      'Triplano',
      Category._2D,
      [
        'This project, in fact, is not a game but an application. However, it proved to be very challenging and uses several complex elements, so I found it very worthwhile to include here in this portfolio.',
        '\nIt is a hunting application to be used in US territory. The entire application interface works in conjunction with the backend, requesting and sending information through routes implemented with the AWS server.',
        '\nAmong its main functions, the following stand out: Login / Registration screen, OTP confirmation via email, login with social network, complete weather information (through the OpenWeather API), interactive map (through the MapBox SDK), property information (through the ReportAllUSA API), 3D deer simulation scene, questionnaires, follower lists, social network feed, image sending, GPS tracking, chat, notifications, among others.'
      ],
      [
        'images/fastRak/fastRak_1.jpg',
        'images/fastRak/fastRak_2.jpg',
        'images/fastRak/fastRak_3.jpg',
        'images/fastRak/fastRak_4.jpg',
      ],
    ),
    ProjectData(
      'Pong ML',
      'Bruno Gottlieb',
      Category._2D,
      [
        'The story of this project is as follows: I was studying Artificial Intelligence at college and I needed to choose a Neural Networks topic to do practical/theoretical work. As a result, I was already aware of the existence of Unity\'s ML-Agents tool, so I decided to choose the topic of Machine Learning.',
        '\nHaving chosen the topic and having already studied the theoretical part, I decided to apply the knowledge in practice. So I thought to myself: I need a game that is multiplayer, quick to implement, and fun to play. That\'s when the classic Pong appears in history.',
        '\nMy main objective with this was to resolve some doubts, such as: 1. Can I implement an AI capable of defeating a human? 2. What will the behavior of this AI be, will it resemble a human player? 3. How long will it take to train her?'
            '\nIn short, I created two versions of the AI. At 1.0 having trained for 7 minutes, resulting in an accuracy of 80% and variation of 20%; and 2.0 having trained for 3 hours, resulting in an accuracy of 99.4% and a variation of 1%.',
        '\nIn addition to the classroom, I even taught a Machine Learning workshop using this project at the UFSM Center for Arts and Letters, explaining the basic concepts of ML and allowing people to interact with the game. It was a very nice opportunity to spread the knowledge.'
      ],
      [
        'images/pongML/PongML_1.png',
        'images/pongML/PongML_2.png',
      ],
    ),
    ProjectData(
      'Lunar Lander',
      'Bruno Gottlieb',
      Category._2D,
      [
        'Lunar Lander was the second game I developed at Unity. I consider it a fundamental part of the beginning of my journey as a game developer and I always remember it very fondly.',
        '\nHere the player must control a spaceship using touch commands on the screen and rotation of the mobile device through the accelerometer. The game has 10 phases with progressive difficulty and the objective of each of them is to land the ship safely at the indicated destination.',
        '\nAlthough the graphics and UI are completely primitive, I believe it is a fun game overall and shows my evolution as a developer.'
      ],
      [
        'images/lunarLander/LunarLander_1.jpg',
        'images/lunarLander/LunarLander_2.jpg',
        'images/lunarLander/LunarLander_3.jpg',
      ],
    ),
    ProjectData(
      'Pinky Lander',
      'Bruno Gottlieb',
      Category._2D,
      [
        'With the emergence of Unity\'s 2D lighting system, I felt the urge to do a project to test it in practice. That\'s how Pinky Lander came about, kind of like a successor to Lunar Lander.',
        '\nThe idea here is very similar, the player controls a kind of ship through the cell phone\'s accelerometer and touches on the screen. With the addition of some mechanics, such as tapping with one finger for slow acceleration and two fingers for fast acceleration. Another mechanic is that collision damage is now much less punishing, only in cases of very high speed.',
        '\nMy initial idea was to put the game on the Play Store, however, due to the poor optimization of 2D lighting on mobile devices at the time, the project ended up being shelved. Now during the development of this site I decided to rescue the project and see how it is going. I noticed that some lights ended up behaving strangely when transitioning the project to Unity 2022.2.0f1, in the end it\'s one of those things that I want to fix but that will potentially never be done.'
      ],
      [
        'images/newLunarLander/newLunarLander_5.jpg',
        'images/newLunarLander/newLunarLander_6.jpg',
        'images/newLunarLander/newLunarLander_7.jpg',
        'images/newLunarLander/newLunarLander_8.jpg',
        'images/newLunarLander/newLunarLander_2.png',
        'images/newLunarLander/newLunarLander_3.png',
        'images/newLunarLander/newLunarLander_4.png',
      ],
    ),
    ProjectData(
      'Insomnia',
      'Bruno Gottlieb',
      Category._2D,
      [
        'The emergence of Insomnia is a peculiar story, born of a personal need. On a day off from work, I found myself in a situation where my schedule was completely changed, sleeping during the day and staying awake at night. I realized I needed to do something about it. I needed to find something to occupy my time throughout the day, so I could stay awake until the next night, when I could sleep and adjust my schedule. It was then that I sat down in front of the computer. I decided I would do something, anything - a project, a game; after all, it was what he knew how to do. And so, after 12 consecutive hours of development, the Insomnia prototype emerged. The name, a tribute to its original purpose, reflects precisely this journey of adjusting the sleep cycle.',
        '\nThe result was doubly positive: not only was I able to adjust my sleep schedule, but I also created a fun game for mobile devices. I took the opportunity to study PlayGames\' services, incorporating achievements and leaderboards into the game.',
        '\nInspired by classic arcade style, Insomnia puts the player in control of a spaceship. The objective is to advance while facing a variety of enemies. Each enemy has a specific color and unique behavior, requiring adaptability and strategies from the player to overcome them. As the player progresses, new enemies appear, gradually increasing the difficulty.',
      ],
      [
        'images/Insomnia/insomnia_1.png',
      ],
    ),
  ];
}

class ProjectData {
  ProjectData(this.projectName, this.subTitle, this.projectType,
      this.projectText, this.imageList);
  String projectName;
  String subTitle;
  Category projectType;
  List<String> projectText;
  List<String> imageList;
}

enum Category { _3D, _2D, VR }

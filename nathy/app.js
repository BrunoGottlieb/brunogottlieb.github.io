(() => {
  'use strict';
  const lessons = window.LESSONS;
  const allQuestions = lessons.flatMap(l => l.exercises);
  const key = 'entre-linguas-v1';
  const main = document.querySelector('#main');
  const escape = value => String(value).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const paths = {
    grid:'<rect x="3" y="3" width="7" height="7" rx="2"/><rect x="14" y="3" width="7" height="7" rx="2"/><rect x="3" y="14" width="7" height="7" rx="2"/><rect x="14" y="14" width="7" height="7" rx="2"/>',
    route:'<circle cx="6" cy="5" r="2"/><circle cx="18" cy="19" r="2"/><path d="M6 7v5a4 4 0 0 0 4 4h4a4 4 0 0 0 0-8h-3"/>',
    bookmark:'<path d="M6 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16l-6-4Z"/>',
    spark:'<path d="m12 3 2.8 6.2L21 12l-6.2 2.8L12 21l-2.8-6.2L3 12l6.2-2.8Z"/>',
    circles:'<circle cx="9" cy="12" r="6"/><circle cx="15" cy="12" r="6"/>',
    branch:'<path d="M7 3v12a4 4 0 0 0 4 4h3M7 9h5a5 5 0 0 0 5-5"/><circle cx="7" cy="3" r="2"/><circle cx="17" cy="3" r="2"/><circle cx="17" cy="19" r="2"/>',
    heart:'<path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1.1-1.1a5.5 5.5 0 0 0-7.8 7.8L12 21l8.8-8.6a5.5 5.5 0 0 0 0-7.8Z"/>',
    trophy:'<path d="M8 3h8v6a4 4 0 0 1-8 0ZM8 5H4v3a4 4 0 0 0 4 4M16 5h4v3a4 4 0 0 1-4 4M12 13v6M7 21h10"/>',
    lock:'<rect x="5" y="10" width="14" height="11" rx="3"/><path d="M8 10V6a4 4 0 0 1 8 0v4M12 14v3"/>',
    moon:'<path d="M20.5 13a8.5 8.5 0 1 1-9.5-9.5 6.5 6.5 0 0 0 9.5 9.5Z"/><path d="M18 2v4M16 4h4"/>',
    arrow:'<path d="M5 12h14m-5-5 5 5-5 5"/>',
    search:'<circle cx="10.5" cy="10.5" r="6.5"/><path d="m16 16 4 4"/>',
    check:'<path d="m5 12 4 4L19 6"/>',
    clock:'<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>',
    book:'<path d="M12 5c-3-2-6-2-9-1v15c3-1 6-1 9 1 3-2 6-2 9-1V4c-3-1-6-1-9 1Zm0 0v15"/>',
    reset:'<path d="M3 10a9 9 0 1 1 2 8M3 4v6h6"/>',
    close:'<path d="m6 6 12 12M6 18 18 6"/>'
  };
  const icon = (name,cls='') => `<svg class="icon ${cls}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.65" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">${paths[name] || paths.spark}</svg>`;
  document.querySelectorAll('[data-icon]').forEach(el=>el.innerHTML=icon(el.dataset.icon));
  let state = {saved:[],errors:[],progress:{},visited:[],last:null,practice:0};
  let storageAvailable = true;
  try {
    const read = JSON.parse(localStorage.getItem(key));
    if(read && typeof read === 'object') {
      state.saved = Array.isArray(read.saved) ? read.saved.filter(id=>lessons.some(l=>l.examples.some(e=>e.id===id))) : [];
      state.errors = Array.isArray(read.errors) ? read.errors.filter(id=>allQuestions.some(q=>q.id===id)) : [];
      state.visited = Array.isArray(read.visited) ? read.visited.filter(id=>lessons.some(l=>l.id===id)) : [];
      state.last = lessons.some(l=>l.id===read.last) ? read.last : null;
      state.practice = Number.isFinite(read.practice) ? read.practice : 0;
      if(read.progress && typeof read.progress==='object') for(const l of lessons) {
        const p=read.progress[l.id];
        if(p && Number.isFinite(p.best) && Number.isFinite(p.attempts)) state.progress[l.id]={best:Math.max(0,Math.min(100,p.best)),attempts:p.attempts};
      }
    }
  } catch { storageAvailable=false; }
  let filter = 'Todos', search = '', quickAnswer=null, session=null, currentRoute='';
  let toastTimer;
  function toast(message) {
    const el=document.querySelector('#toast'); el.textContent=message; el.classList.add('show');
    clearTimeout(toastTimer); toastTimer=setTimeout(()=>el.classList.remove('show'),3200);
  }
  function save() {
    try { localStorage.setItem(key,JSON.stringify(state)); } catch { if(storageAvailable) toast('No se pudo guardar en este navegador. Puedes seguir practicando.'); storageAvailable=false; }
    updateCounts();
  }
  const mastered = l => (state.progress[l.id]?.best || 0) >= 80;
  function updateCounts() {
    document.querySelector('#saved-count').textContent=state.saved.length;
    document.querySelector('#completed-count').textContent=lessons.filter(mastered).length;
  }
  function lessonLink(l,tab='comprender') {return `#/tema/${l.id}/${tab}`;}
  function status(l) {
    const p=state.progress[l.id];
    return mastered(l) ? `<span class="lesson-status complete">${icon('check')} Afianzado · ${p.best}%</span>` : p ? `<span class="lesson-status started">En práctica · ${p.best}%</span>` : state.visited.includes(l.id) ? '<span class="lesson-status started">En curso</span>' : '<span class="lesson-status">Por descubrir</span>';
  }
  function card(l,index) {return `<a class="topic-card ${l.color}" href="${lessonLink(l)}"><div class="card-top"><span class="topic-icon">${icon(l.icon)}</span><span class="topic-category">${escape(l.category)}</span><span class="card-arrow">↗</span></div><div class="card-number">TEMA ${String(index+1).padStart(2,'0')}</div><h3>${escape(l.title)}</h3><p>${escape(l.description)}</p><div class="card-bottom">${status(l)}<span>${l.time} min</span></div></a>`;}
  function filteredLessons() {
    const normalize = s=>s.normalize('NFD').replace(/[\u0300-\u036f]/g,'').toLowerCase();
    return lessons.filter(l=>(filter==='Todos'||l.category===filter)&&normalize([l.title,l.short,l.description,...l.tags].join(' ')).includes(normalize(search)));
  }
  function topicGrid() {
    const list=filteredLessons();
    return list.length ? list.map(l=>card(l,lessons.indexOf(l))).join('') : '<div class="empty-state"><h3>No encontramos ese tema.</h3><p>Prueba con «subjuntivo», «todo» o «dormir».</p><button class="button secondary" data-action="clear-search">Ver todos los temas</button></div>';
  }
  function home() {
    const count=lessons.filter(mastered).length;
    const resume=lessons.find(l=>l.id===state.last) || lessons[0];
    const featuredVisual=resume.id==='hipotesis'?'<div class="word-outline">-ra</div><div class="word-switch">↘</div><div class="word-solid">-sse<span>✓</span></div>':`<div class="resume-visual">${icon(resume.icon)}</div>`;
    main.innerHTML=`<section class="home-intro"><div><div class="eyebrow"><span class="mini-line"></span> UN PUENTE ENTRE DOS IDIOMAS</div><h1>Tu español ya es<br>un buen <em>comienzo.</em></h1><p>No empiezas de cero. Descubre esas pequeñas diferencias<br class="desktop-br"> que hacen que el portugués empiece a sentirse tuyo.</p><div class="intro-details"><span>${icon('book')} ${lessons.length} temas, paso a paso</span><span class="intro-dot">·</span><span>Explicado en tu idioma</span></div></div><div class="language-art" aria-hidden="true"><span class="art-spark">✳</span><div class="art-label">tan cerca, tan diferente</div><div class="art-card spanish"><span>EN ESPAÑOL</span><strong>Si pudiera…</strong><small>lo que ya conoces</small></div><svg class="art-path" viewBox="0 0 300 150"><path d="M25 35C180-25 60 170 245 100" fill="none" stroke="#d29373" stroke-width="2" stroke-dasharray="5 5"/><path d="m231 94 16 5-11 13" fill="none" stroke="#d29373" stroke-width="2"/></svg><div class="art-card portuguese"><span>EM PORTUGUÊS</span><strong lang="pt-BR">Se eu pudesse…</strong><small>tu siguiente conexión</small></div><span class="art-dot"></span></div></section>
    <section class="start-grid" aria-label="Por dónde empezar"><a class="featured" href="${lessonLink(resume)}"><div class="featured-copy"><span class="pill light">${state.last?'CONTINÚA TU CAMINO':'EMPIEZA POR AQUÍ'} ${icon('spark')}</span><h2>${state.last?escape(resume.short):'Si tuviera, si quisiera…<br>¿y en portugués?'}</h2><p>${state.last?'Vuelve a tu último tema. Una conexión a la vez.':'Entiende el subjuntivo y deja de traducir<br class="desktop-br"> «pareciera» como «parecera».'}</p><span class="featured-cta">${state.last?'Retomar el tema':'Entender las hipótesis'} ${icon('arrow')}</span></div><div class="featured-art" aria-hidden="true">${featuredVisual}</div><span class="featured-meta">${resume.time} MIN · ${resume.exercises.length} EJERCICIOS</span></a>
    <div class="quick-card"><div class="eyebrow">UNA CONEXIÓN RÁPIDA ${icon('spark')}</div><p class="quick-instruction">¿Cómo lo dirías en portugués?</p><h3>«Si yo pudiera…»</h3><div class="quick-options"><button data-quick="0" class="quick-option ${quickAnswer===0?'wrong':''}" ${quickAnswer!==null?'disabled':''}><span>A</span> Se eu pudera…</button><button data-quick="1" class="quick-option ${quickAnswer===1?'correct':''}" ${quickAnswer!==null?'disabled':''}><span>B</span> Se eu pudesse…</button></div><div class="quick-feedback" role="status">${quickAnswer===null?'<span>Una pequeña prueba. Sin presión.</span>':`${quickAnswer===1?'¡Exacto!':'Casi. La forma es «pudesse».'} <span>Pudiera / pudiese → pudesse.</span> <button class="text-button" data-action="quick-reset">Volver a intentar ↺</button>`}</div></div></section>
    <section class="topics-section" id="temas"><div class="section-heading"><div><div class="eyebrow">PEQUEÑAS DIFERENCIAS, GRANDES CONEXIONES</div><h2>¿Qué vamos a aclarar hoy?</h2></div><span class="topic-total">${lessons.length} temas para explorar</span></div><div class="topic-tools"><div class="filters" aria-label="Filtrar temas">${['Todos',...new Set(lessons.map(l=>l.category))].map(f=>`<button class="filter ${filter===f?'active':''}" data-filter="${f}" aria-pressed="${filter===f}">${f}</button>`).join('')}</div><label class="search-box">${icon('search')}<input id="topic-search" type="search" placeholder="Buscar un tema…" aria-label="Buscar un tema" value="${escape(search)}"></label></div><div class="topic-grid" id="topic-grid">${topicGrid()}</div><p class="results-count sr-only" id="results-count" role="status">${filteredLessons().length} temas encontrados.</p></section>
    <section class="practice-banner"><span class="banner-icon">${icon('route')}</span><div><h3>Un poco de todo, a tu ritmo.</h3><p>Mezcla los temas y descubre las conexiones que ya hiciste.</p></div><a class="button secondary" href="#/practica">Practicar 10 preguntas ${icon('arrow')}</a></section><div class="home-bottom-note"><span>${count} de ${lessons.length} temas afianzados</span><span>Aprender también es volver a intentarlo.</span></div>`;
  }
  function exampleCard(e,l) {
    const saved=state.saved.includes(e.id);
    return `<article class="example-card"><div class="example-label"><span>ESPAÑOL</span><button class="icon-button save-example ${saved?'is-saved':''}" data-save="${e.id}" aria-pressed="${saved}" aria-label="${saved?'Quitar del':'Guardar en mi'} cuaderno: ${escape(e.pt)}">${icon('bookmark')}</button></div><p class="es-sentence" lang="es">${escape(e.es)}</p><div class="translation-divider"><span>↓</span> PORTUGUÊS</div><p class="pt-sentence" lang="pt-BR">${escape(e.pt)}</p><div class="example-note">${icon('spark')}<span>${escape(e.note)}</span></div>${l?`<a class="example-topic" href="${lessonLink(l)}">${escape(l.short)} ↗</a>`:''}</article>`;
  }
  function lessonPage(l,tab) {
    const index=lessons.indexOf(l);
    main.innerHTML=`<div class="lesson-breadcrumb"><a href="#/">Todos los temas</a><span>/</span><span>Tema ${String(index+1).padStart(2,'0')}</span></div><header class="lesson-heading"><div class="lesson-kicker"><span class="topic-icon ${l.color}">${icon(l.icon)}</span><span>${escape(l.category)}</span>${l.id==='hipotesis'?'<span class="pill priority">FOCO PRINCIPAL</span>':''}</div><h1>${escape(l.title)}</h1><p>${escape(l.description)}</p><div class="lesson-tags">${l.tags.map(t=>`<span>${escape(t)}</span>`).join('')}<span>${icon('clock')} ${l.time} min</span></div></header><nav class="lesson-tabs" aria-label="Secciones del tema">${[['comprender','book','Comprender'],['ejemplos','circles','Ver ejemplos'],['practicar','spark','Practicar']].map(([id,ic,label],i)=>`<a href="${lessonLink(l,id)}" ${tab===id?'aria-current="page"':''}>${icon(ic)}<span>${label}</span><small>${i===0?String(l.sections.length).padStart(2,'0'):i===1?l.examples.length:l.exercises.length}</small></a>`).join('')}</nav><div id="lesson-content"></div>`;
    const content=document.querySelector('#lesson-content');
    if(tab==='comprender') {
      content.innerHTML=`<div class="explanation-layout"><article class="explanation">${l.sections.map((s,i)=>`<section class="explanation-section" id="concepto-${i}"><span class="section-index">${String(i+1).padStart(2,'0')}</span><h2>${escape(s.title)}</h2>${s.body}</section>`).join('')}${l.id==='hipotesis'?simulator():''}<div class="next-panel"><span>La idea ya está. Ahora, mírala en acción.</span><a class="button primary" href="${lessonLink(l,'ejemplos')}">Ver ${l.examples.length} ejemplos ${icon('arrow')}</a></div></article><aside class="lesson-aside"><div class="sticky-note"><span class="eyebrow">QUÉDATE CON ESTO</span><span class="note-star">✳</span><p>${escape(l.takeaway)}</p><div class="note-divider"></div><span>Entender primero.<br>Practicar después.</span></div><div class="content-index"><span class="eyebrow">EN ESTA EXPLICACIÓN</span>${l.sections.map((s,i)=>`<button data-scroll="concepto-${i}">${String(i+1).padStart(2,'0')} <span>${escape(s.title)}</span></button>`).join('')}</div></aside></div>`;
    } else if(tab==='ejemplos') {
      content.innerHTML=`<div class="tab-intro"><div><h2>Del español a la vida real.</h2><p>Compara las frases y guarda las que quieras recordar.</p></div><span class="muted">${l.examples.length} conexiones</span></div><div class="examples-grid">${l.examples.map(e=>exampleCard(e)).join('')}</div><div class="next-panel"><span>¿Lo ponemos en práctica?</span><a class="button primary" href="${lessonLink(l,'practicar')}">Hacer ${l.exercises.length} ejercicios ${icon('arrow')}</a></div>`;
    } else {
      if(!session || session.key!==l.id) startSession(l.exercises,l.id,{lessonId:l.id,fullLesson:true});
      renderQuiz(content);
    }
  }
  const scenarios=[
    {label:'Una posibilidad futura',es:'Si tengo tiempo mañana, voy a viajar.',condition:'Se eu tiver tempo amanhã,',result:'vou viajar.',tense:'Tiver · futuro do subjuntivo',note:'Todavía puede ocurrir. En español usas «tengo»; aquí, portugués usa «tiver».'},
    {label:'Una situación imaginada',es:'Si tuviera tiempo, viajaría.',condition:'Se eu tivesse tempo,',result:'viajaria.',tense:'Tivesse · pretérito imperfeito do subjuntivo',note:'Imaginas la condición. Tuviera / tuviese → tivesse; viajaría → viajaria.'},
    {label:'Un pasado que no ocurrió',es:'Si hubiera tenido tiempo, habría viajado.',condition:'Se eu tivesse tido tempo,',result:'teria viajado.',tense:'Tivesse tido · pretérito mais-que-perfeito do subjuntivo',note:'Miras un pasado que ya no puedes cambiar: tivesse + participio → teria + participio.'}
  ];
  function simulator() {
    return `<section class="simulator explanation-section"><div class="eyebrow">PRUEBA A CAMBIAR LA IDEA</div><h2>La misma frase. Tres intenciones.</h2><label for="scenario">¿Qué quieres expresar?</label><select id="scenario">${scenarios.map((s,i)=>`<option value="${i}" ${i===1?'selected':''}>${s.label}</option>`).join('')}</select><div id="scenario-result" aria-live="polite">${scenarioResult(1)}</div></section>`;
  }
  function scenarioResult(i) {const s=scenarios[i];return `<p class="sim-es">${s.es}</p><p class="sim-pt" lang="pt-BR"><strong>${s.condition}</strong> ${s.result}</p><span class="pill">${s.tense}</span><p class="sim-note">${s.note}</p>`;}
  function startSession(questions,id,meta={}) {
    session={key:id,questions:[...questions],originalQuestions:[...questions],index:0,selection:null,input:'',checked:false,correct:false,results:[],finished:false,recorded:false,...meta};
  }
  function shuffled(items) {const result=[...items];for(let i=result.length-1;i>0;i--){const j=Math.floor(Math.random()*(i+1));[result[i],result[j]]=[result[j],result[i]];}return result;}
  function mixedQuestions() {
    const focus=lessons[0];
    const selected=[...shuffled(focus.exercises).slice(0,4),...shuffled(lessons.slice(1)).slice(0,6).map(l=>shuffled(l.exercises)[0])];
    if(selected.length<10)selected.push(...shuffled(allQuestions.filter(q=>!selected.some(s=>s.id===q.id))).slice(0,10-selected.length));
    return shuffled(selected);
  }
  function quizPage(mode) {
    const review=mode==='errores';
    const id=review?'review':'mixed';
    if(!session||session.key!==id) startSession(review?shuffled(allQuestions.filter(q=>state.errors.includes(q.id))):mixedQuestions(),id);
    main.innerHTML=`<div class="lesson-breadcrumb"><a href="${review?'#/cuaderno':'#/'}">${review?'Mi cuaderno':'Todos los temas'}</a><span>/</span><span>Práctica</span></div><header class="lesson-heading compact"><div class="eyebrow">${review?'VOLVER TAMBIÉN ES AVANZAR':'CONECTA LO QUE APRENDISTE'}</div><h1>${review?'Una segunda mirada.':'Un poco de todo.'}</h1><p>${review?'Vuelve a las preguntas que te costaron. Una respuesta correcta las retira de tu lista.':'Diez preguntas de distintos temas, con especial atención al subjuntivo.'}</p></header><div id="lesson-content"></div>`;
    if(!session.questions.length){document.querySelector('#lesson-content').innerHTML=`<div class="empty-state"><span class="empty-icon">${icon('check')}</span><h2>No tienes errores pendientes.</h2><p>Cuando una pregunta se complique, la encontrarás aquí.</p><a class="button primary" href="#/practica">Hacer una práctica mixta ${icon('arrow')}</a></div>`;return;}
    renderQuiz(document.querySelector('#lesson-content'));
  }
  function renderQuiz(container) {
    if(session.finished){renderResult(container);return;}
    const q=session.questions[session.index],l=lessons.find(l=>l.id===q.lessonId),count=session.questions.length;
    const correctAnswer=q.type==='choice'?q.options[q.answer]:q.answers[0];
    container.innerHTML=`<div class="quiz-layout"><section class="quiz-card"><div class="quiz-top"><span>PREGUNTA ${String(session.index+1).padStart(2,'0')} <span class="muted">/ ${String(count).padStart(2,'0')}</span></span><span>${q.type==='write'?'ESCRIBE EN PORTUGUÉS':'ELIGE UNA RESPUESTA'}</span></div><div class="progress-track"><span style="width:${session.index/count*100}%"></span></div><span class="quiz-topic">${escape(l.short)}</span><h2 id="question-title">${escape(q.prompt)}</h2><p class="quiz-context">${escape(q.context)}</p><form id="answer-form" aria-labelledby="question-title">${q.type==='choice'?`<fieldset class="answer-options"><legend class="sr-only">Opciones de respuesta</legend>${q.options.map((o,i)=>`<label class="answer-option ${session.selection===i?'selected':''} ${session.checked?(i===q.answer?'answer-correct':session.selection===i?'answer-wrong':''):''}"><input type="radio" name="answer" value="${i}" ${session.selection===i?'checked':''} ${session.checked?'disabled':''}><span class="answer-letter">${String.fromCharCode(65+i)}</span><span ${/^Se |^Eu |^Gan|^Quand|^Todo|^Tudo|^Dormi|^É |^Venci|^O |^A |^Nosso|^Final|^Quero/.test(o)?'lang="pt-BR"':''}>${escape(o)}</span>${session.checked&&i===q.answer?icon('check'):''}</label>`).join('')}</fieldset>`:`<label class="write-label" for="written-answer">Tu respuesta</label><input id="written-answer" class="written-answer ${session.checked?(session.correct?'input-correct':'input-wrong'):''}" type="text" lang="pt-BR" autocomplete="off" autocapitalize="none" spellcheck="false" placeholder="Escribe la palabra que falta…" value="${escape(session.input)}" ${session.checked?'disabled':''} aria-describedby="writing-tip"><span class="writing-tip" id="writing-tip">Escribe solo lo que falta. Incluye los acentos si los hay.</span>`}
      <div id="answer-feedback" aria-live="polite">${session.checked?`<div class="answer-feedback ${session.correct?'success':'retry'}"><strong>${session.correct?'¡Esa conexión está hecha!':'Todavía estás haciendo la conexión.'}</strong>${!session.correct?`<p class="correct-answer">Respuesta: <b lang="pt-BR">${escape(correctAnswer)}</b></p>`:''}<p>${escape(q.explanation)}</p></div>`:''}</div><div class="quiz-actions"><span>Equivocarte también cuenta como aprender.</span>${session.checked?`<button type="button" class="button primary" data-action="next-question">${session.index===count-1?'Ver mi resultado':'Siguiente'} ${icon('arrow')}</button>`:`<button type="submit" class="button primary" id="check-answer" ${(q.type==='choice'?session.selection===null:!session.input.trim())?'disabled':''}>Comprobar ${icon('check')}</button>`}</div></form></section><aside class="quiz-aside"><span class="topic-icon green">${icon('spark')}</span><h3>Una idea a la vez.</h3><p>Lee la situación antes de mirar las opciones. ¿Qué quieres decir realmente?</p><div class="quiz-score"><strong>${session.results.filter(r=>r.correct).length}</strong><span>respuestas correctas<br>en esta práctica</span></div><a class="text-link" href="${lessonLink(l)}">Volver a la explicación ↗</a></aside></div>`;
  }
  function normalizeAnswer(v) {return v.trim().toLocaleLowerCase('pt-BR').normalize('NFC').replace(/[.!?]+$/,'').trim();}
  function checkAnswer() {
    if(!session||session.checked||session.finished)return;
    const q=session.questions[session.index];
    if(q.type==='choice'&&session.selection===null)return;
    if(q.type==='write'&&!session.input.trim())return;
    session.correct=q.type==='choice'?session.selection===q.answer:q.answers.some(a=>normalizeAnswer(a)===normalizeAnswer(session.input));
    session.checked=true;
    session.results.push({id:q.id,correct:session.correct});
    state.errors=state.errors.filter(id=>id!==q.id);
    if(!session.correct)state.errors.push(q.id);
    save();renderQuiz(document.querySelector('#lesson-content'));
    document.querySelector('[data-action="next-question"]').focus({preventScroll:true});
  }
  function recordResult() {
    if(session.recorded)return;
    const score=Math.round(session.results.filter(r=>r.correct).length/session.questions.length*100);
    if(session.fullLesson) {
      const p=state.progress[session.lessonId]||{best:0,attempts:0};
      state.progress[session.lessonId]={best:Math.max(p.best,score),attempts:p.attempts+1};
    }
    state.practice++;session.recorded=true;save();
  }
  function renderResult(container) {
    recordResult();
    const correct=session.results.filter(r=>r.correct).length,total=session.questions.length,wrong=total-correct;
    const l=lessons.find(l=>l.id===session.lessonId);
    container.innerHTML=`<section class="result-card"><span class="result-flower" aria-hidden="true">✳</span><div class="eyebrow">CADA INTENTO CONSTRUYE ALGO</div><h2>${correct===total?'¡Las conexiones están hechas!':correct/total>=.8?'Tu portugués está tomando forma.':'Paso a paso, lo vas conectando.'}</h2><p>${correct===total?'Todo correcto en esta ronda. Sigue creando nuevas conexiones.':'Ya sabes qué repasar. Mira la explicación, vuelve a intentarlo y date tiempo.'}</p><div class="result-score"><strong>${correct}<span>/${total}</span></strong><span>respuestas correctas<br>${Math.round(correct/total*100)}% en esta ronda</span></div>${l&&session.fullLesson?`<div class="result-best">${mastered(l)?`${icon('check')} Tema afianzado`:'Con 80% o más, este tema queda afianzado.'} · Mejor resultado: ${state.progress[l.id].best}%</div>`:''}<div class="result-buttons">${wrong?`<button class="button primary" data-action="retry-wrong">Repasar ${wrong} ${wrong===1?'error':'errores'} ${icon('arrow')}</button>`:'<a class="button primary" href="#/recorrido">Ver mi recorrido '+icon('arrow')+'</a>'}<button class="button secondary" data-action="restart-quiz">${icon('reset')} Repetir práctica</button></div>${l?`<a class="text-link" href="${lessonLink(l,'ejemplos')}">Volver a los ejemplos</a>`:'<a class="text-link" href="#/">Explorar los temas</a>'}<p class="result-note">${wrong?'Tus errores quedan en Mi cuaderno para retomarlos cuando quieras.':'Si esta ronda incluía errores guardados, ya salieron de tu cuaderno.'}</p></section>`;
  }
  function recorrido() {
    const count=lessons.filter(mastered).length,percent=Math.round(count/lessons.length*100);
    main.innerHTML=`<header class="page-heading"><div class="eyebrow">TU PROPIO RITMO</div><h1>Todo lo que vas <em>conectando.</em></h1><p>No hace falta hacerlo todo hoy. Cada pequeña conexión cuenta.</p></header><section class="journey-summary"><div class="progress-ring" style="--progress:${percent}%"><strong>${count}<span>de ${lessons.length}</span></strong></div><div><h2>${count===lessons.length?'Un puente que ya puedes cruzar.':'Tu recorrido ya tiene un lugar.'}</h2><p>Un tema queda afianzado al conseguir al menos 80% en su práctica completa.</p><span class="pill">${state.practice} ${state.practice===1?'práctica terminada':'prácticas terminadas'}</span></div></section><div class="journey-list">${lessons.map((l,i)=>`<a class="journey-row" href="${lessonLink(l)}"><span class="journey-number">${String(i+1).padStart(2,'0')}</span><span class="topic-icon ${l.color}">${icon(l.icon)}</span><div><h3>${escape(l.short)}</h3><span>${l.exercises.length} ejercicios · ${l.time} min${state.progress[l.id]?` · ${state.progress[l.id].attempts} ${state.progress[l.id].attempts===1?'intento completo':'intentos completos'}`:''}</span></div>${status(l)}<span class="row-arrow">${icon('arrow')}</span></a>`).join('')}</div><div class="local-note">${icon('lock')} Tu progreso se guarda en este navegador. Puedes volver cuando quieras.${!storageAvailable?' El almacenamiento no está disponible: esta sesión no se podrá conservar.':''}</div>`;
  }
  function cuaderno() {
    const examples=lessons.flatMap(l=>l.examples.filter(e=>state.saved.includes(e.id)).map(e=>({e,l})));
    main.innerHTML=`<header class="page-heading"><div class="eyebrow">UN LUGAR PARA VOLVER</div><h1>Tu pequeño <em>cuaderno.</em></h1><p>Las frases que quieres recordar y las conexiones que merecen otra mirada.</p></header><section class="review-banner"><span class="topic-icon peach">${icon('reset')}</span><div><h2>${state.errors.length?`${state.errors.length} ${state.errors.length===1?'conexión por reforzar':'conexiones por reforzar'}`:'Sin errores pendientes. Qué bien.'}</h2><p>${state.errors.length?'Una respuesta correcta retira la pregunta de esta lista.':'Cuando te equivoques en una práctica, podrás repasar aquí.'}</p></div>${state.errors.length?`<a class="button primary" href="#/errores">Practicar errores ${icon('arrow')}</a>`:'<a class="button secondary" href="#/practica">Hacer una práctica '+icon('arrow')+'</a>'}</section><div class="section-heading notebook-title"><h2>Frases para quedarte</h2><span class="muted">${examples.length} ${examples.length===1?'ejemplo guardado':'ejemplos guardados'}</span></div>${examples.length?`<div class="examples-grid">${examples.map(({e,l})=>exampleCard(e,l)).join('')}</div>`:`<div class="empty-state"><span class="empty-icon">${icon('bookmark')}</span><h3>Tu primera frase te espera.</h3><p>Toca el marcador en cualquier ejemplo para guardarlo aquí.</p><a class="button secondary" href="${lessonLink(lessons[0],'ejemplos')}">Descubrir ejemplos ${icon('arrow')}</a></div>`}`;
  }
  function route() {
    const raw=(location.hash||'#/').slice(1).split('/').filter(Boolean);
    const page=raw[0]||'home';
    const routeKey=raw.join('/');
    const previous=currentRoute;currentRoute=routeKey;
    let active=page==='tema'||page==='practica'?'home':page==='errores'?'cuaderno':page;
    document.querySelectorAll('[data-nav]').forEach(a=>{if(a.dataset.nav===active)a.setAttribute('aria-current','page');else a.removeAttribute('aria-current');});
    if(page==='home') {home();document.querySelector('#breadcrumb').textContent='Tu próximo paso empieza aquí';document.title='Entre Línguas · Del español al portugués';}
    else if(page==='tema') {
      const l=lessons.find(l=>l.id===raw[1]);
      if(!l){notFound();return;}
      const tab=['comprender','ejemplos','practicar'].includes(raw[2])?raw[2]:'comprender';
      if(!state.visited.includes(l.id))state.visited.push(l.id);state.last=l.id;save();
      if(!previous.startsWith(`tema/${l.id}`)&&session?.key===l.id)session=null;
      lessonPage(l,tab);document.querySelector('#breadcrumb').textContent=`Tu espacio / ${l.short}`;document.title=`${l.short} · Entre Línguas`;
    }
    else if(page==='recorrido'){recorrido();document.querySelector('#breadcrumb').textContent='Tu espacio / Mi recorrido';document.title='Mi recorrido · Entre Línguas';}
    else if(page==='cuaderno'){cuaderno();document.querySelector('#breadcrumb').textContent='Tu espacio / Mi cuaderno';document.title='Mi cuaderno · Entre Línguas';}
    else if(page==='practica'||page==='errores') {if(previous!==routeKey)session=null;quizPage(page);document.querySelector('#breadcrumb').textContent='Tu espacio / Practicar';document.title='Practicar · Entre Línguas';}
    else {notFound();return;}
    updateCounts();window.scrollTo({top:0,behavior:'instant'});
    if(previous!==routeKey&&previous!=='')main.focus({preventScroll:true});
  }
  function notFound() {main.innerHTML=`<div class="empty-state"><h1>Este camino todavía no existe.</h1><p>Volvamos a tus temas para seguir aprendiendo.</p><a class="button primary" href="#/">Explorar temas ${icon('arrow')}</a></div>`;document.title='Tema no encontrado · Entre Línguas';}
  document.addEventListener('click',event=>{
    const target=event.target.closest('button,a');if(!target)return;
    if(target.classList.contains('skip-link')){event.preventDefault();main.focus();main.scrollIntoView({block:'start'});return;}
    if(target.dataset.save){
      const id=target.dataset.save,wasSaved=state.saved.includes(id);
      state.saved=wasSaved?state.saved.filter(x=>x!==id):[...state.saved,id];save();
      if(currentRoute==='cuaderno')cuaderno();else {target.classList.toggle('is-saved',!wasSaved);target.setAttribute('aria-pressed',String(!wasSaved));const e=lessons.flatMap(l=>l.examples).find(e=>e.id===id);target.setAttribute('aria-label',`${wasSaved?'Guardar en mi':'Quitar del'} cuaderno: ${e.pt}`);}
      toast(wasSaved?'Ejemplo retirado del cuaderno.':storageAvailable?'Guardado en tu cuaderno.':'Guardado durante esta sesión. El navegador no permite conservarlo.');
    }
    if(target.dataset.filter){filter=target.dataset.filter;document.querySelectorAll('[data-filter]').forEach(b=>{const selected=b.dataset.filter===filter;b.classList.toggle('active',selected);b.setAttribute('aria-pressed',String(selected));});document.querySelector('#topic-grid').innerHTML=topicGrid();document.querySelector('#results-count').textContent=`${filteredLessons().length} temas encontrados.`;}
    if(target.dataset.quick!==undefined){quickAnswer=Number(target.dataset.quick);const scroll=window.scrollY;home();window.scrollTo(0,scroll);}
    if(target.dataset.scroll)document.getElementById(target.dataset.scroll)?.scrollIntoView({behavior:matchMedia('(prefers-reduced-motion: reduce)').matches?'instant':'smooth',block:'start'});
    switch(target.dataset.action){
      case 'clear-search': filter='Todos';search='';home();document.querySelector('#topic-search').focus();break;
      case 'quick-reset': quickAnswer=null;{const scroll=window.scrollY;home();window.scrollTo(0,scroll);}break;
      case 'next-question':
        if(!session?.checked||session.finished)break;
        if(session.index===session.questions.length-1)session.finished=true;
        else {session.index++;session.selection=null;session.input='';session.checked=false;session.correct=false;}
        renderQuiz(document.querySelector('#lesson-content'));document.querySelector('.quiz-card,.result-card')?.scrollIntoView({block:'start',behavior:'instant'});{const heading=document.querySelector(session.finished?'.result-card h2':'#question-title');heading.setAttribute('tabindex','-1');heading.focus({preventScroll:true});}break;
      case 'restart-quiz': {
        const {key,lessonId}=session;
        const questions=key==='mixed'?mixedQuestions():key==='review'?shuffled(allQuestions.filter(q=>state.errors.includes(q.id))):session.originalQuestions;
        startSession(questions,key,{lessonId,fullLesson:!!lessonId&&questions.length===lessons.find(l=>l.id===lessonId).exercises.length});
        if(!questions.length)quizPage('errores');else renderQuiz(document.querySelector('#lesson-content'));break;
      }
      case 'retry-wrong': {
        const wrongIds=session.results.filter(r=>!r.correct).map(r=>r.id),old=session;
        startSession(old.questions.filter(q=>wrongIds.includes(q.id)),old.key,{lessonId:old.lessonId,fullLesson:false,originalQuestions:old.originalQuestions});renderQuiz(document.querySelector('#lesson-content'));break;
      }
    }
  });
  document.addEventListener('change',event=>{
    if(event.target.name==='answer'&&session&&!session.checked){session.selection=Number(event.target.value);document.querySelectorAll('.answer-option').forEach(el=>el.classList.toggle('selected',el.querySelector('input').checked));document.querySelector('#check-answer').disabled=false;}
    if(event.target.id==='scenario')document.querySelector('#scenario-result').innerHTML=scenarioResult(Number(event.target.value));
  });
  document.addEventListener('input',event=>{
    if(event.target.id==='topic-search'){search=event.target.value;document.querySelector('#topic-grid').innerHTML=topicGrid();document.querySelector('#results-count').textContent=`${filteredLessons().length} temas encontrados.`;}
    if(event.target.id==='written-answer'&&session&&!session.checked){session.input=event.target.value;document.querySelector('#check-answer').disabled=!session.input.trim();}
  });
  document.addEventListener('submit',event=>{if(event.target.id==='answer-form'){event.preventDefault();checkAnswer();}});
  const dialog=document.querySelector('#about-dialog');
  document.querySelector('#about-button').addEventListener('click',()=>dialog.showModal());
  dialog.querySelector('.dialog-close').addEventListener('click',()=>dialog.close());
  dialog.addEventListener('click',event=>{if(event.target===dialog){const r=dialog.getBoundingClientRect();if(event.clientX<r.left||event.clientX>r.right||event.clientY<r.top||event.clientY>r.bottom)dialog.close();}});
  window.addEventListener('hashchange',route);
  route();
})();

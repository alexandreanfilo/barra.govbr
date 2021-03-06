  divBarra = document.getElementById("barra-brasil")
  if divBarra
    divBarra.removeAttribute "style"
  # conteudoBarra definido no barra-brasil-1.yaml e atribuido pelo assetgen
    divBarra.innerHTML = conteudoBarra
    head = document.getElementsByTagName("head")[0]

  clickHandler = ->
    if event.target.id == 'openModalBarra' or event.target.id == 'closeModalBarra'
      document.getElementById('openModalBarra').className = 'modalDialogBarraClose'
      document.getElementById('barraiFrame').src = ''
    return

  anchor = document.getElementById('closeModalBarra')
  if anchor.addEventListener
    anchor.addEventListener 'click', clickHandler, false
  else if anchor.attachEvent
    anchor.attachEvent 'onclick', ->
      clickHandler.apply anchor, [ window.event ]
  anchor = document.getElementById('openModalBarra')
  if anchor.addEventListener
    anchor.addEventListener 'click', clickHandler, false
  else if anchor.attachEvent
    anchor.attachEvent 'onclick', ->
      clickHandler.apply anchor, [ window.event ]

  getOrgaoContent = ->
    metas = document.getElementsByTagName 'meta' 
    i = 0
    while i < metas.length
      if metas[i].getAttribute('property') == 'creator.productor'
        return '&orgao='+ metas[i].getAttribute('content')
      i++
    ''

  link = document.getElementById('barra-brasil-orgao')
  link.setAttribute 'href', 'http://www.servicos.gov.br/?pk_campaign=barrabrasil'+getOrgaoContent()

  window._barrabrasil =
    insere_css: (css) ->
        style = document.createElement "style"
        style.setAttribute "type","text/css"
        style.setAttribute "media","all"
        style.appendChild document.createTextNode(css)
        
        head.appendChild style

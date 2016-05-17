@Record = React.createClass
  render: ->
    React.DOM.div null, @props.record.date
    React.DOM.tr null,
      React.DOM.td null, @props.record.date
      React.DOM.td id: "idcko", @props.record.title


      React.DOM.td null, amountFormat(@props.record.amount)
#    React.DOM.ul({},
#      React.DOM.li({}, "First"),
#      React.DOM.li({}, "Second"),
#    )
#    linkClicked = (event) ->
#      console.log(event)
#      console.log(event.target)
#      alert("you clicked me")
#    virtualDom = React.DOM.div(
#        {id: "render-me-react-please"},
#        React.DOM.a(
##        {href:"javascript:void(0)", onClick: linkClicked},
##        "Click me"
#        )
#      )

@OneTimeClickLink = React.createClass
  getInitialState: ->
    {clicked: false}
  linkClicked: (event) ->
    console.log(event + "I react on click :)")
    @setState(clicked: true)
  render: ->
    unless @state.clicked
      React.DOM.div id: "one-time-click-link"
      React.DOM.a href: "javascript:void(0)", onClick: @linkClicked, "Click me"
    else
      React.DOM.div(
        {id: "one-time-click-link"},
        React.DOM.span({}, "You clicked the link")
      )

oneTimeClickLink = React.createFactory(OneTimeClickLink)
$ ->
  ReactDOM.render(
    oneTimeClickLink(),
    document.getElementById("start")
  )
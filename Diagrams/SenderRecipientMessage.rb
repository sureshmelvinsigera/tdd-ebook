# This code was generated by dot2ruby.g

require 'rubygems'
require 'graphviz'
graph_g = GraphViz.digraph( "G", :strict => true ) { |graph_g|
  graph_g[:fontname] = 'Ubuntu'
  graph_g[:fontsize] = '5'
  graph_g[:overlap] = 'false'
  graph_g[:splines] = 'true'
  graph_g1 = graph_g.add_graph( "g1" )
  graph_g1[:fontname] = 'Ubuntu'
  graph_g1[:fontsize] = '5'
  graph_g1[:overlap] = 'false'
  graph_g1[:splines] = 'true'
  graph_g2 = graph_g.add_graph( "g2" )
  graph_g2[:fontname] = 'Ubuntu'
  graph_g2[:fontsize] = '5'
  graph_g2[:overlap] = 'false'
  graph_g2[:splines] = 'true'
  node_sender = graph_g1.add_nodes( "Sender", :fontsize => '10', :label => '', :pos => '1,2!', :shape => 'circle' )
  graph_g1.add_edges( "Sender", "square", :fontsize => '10', :taillabel => 'Recipient::DoSomething()...' )
  node_recipient = graph_g1.add_nodes( "Recipient", :fontsize => '10', :label => 'Concrete\nRecipient', :pos => '9.7,2!', :shape => 'circle' )
  node_square = graph_g1.add_nodes( "square", :fontsize => '10', :label => 'Recipient\n(Interface)', :pos => '4.4,2!', :shape => 'Mdiamond' )
  graph_g1.add_edges( "square", "Recipient", :fontsize => '10', :taillabel => '...ConcreteRecipient::DoSomething()' )
  node_alarm = graph_g2.add_nodes( "Alarm", :fontsize => '10', :label => '', :pos => '1,1!', :shape => 'circle' )
  graph_g2.add_edges( "Alarm", "Lift", :fontsize => '10', :taillabel => 'Lift::GoToBottomFloor()...' )
  node_autolift = graph_g2.add_nodes( "AutoLift", :fontsize => '10', :label => 'AutoLift', :pos => '9.7,1!', :shape => 'circle' )
  node_lift = graph_g2.add_nodes( "Lift", :fontsize => '10', :label => 'Lift\n(Interface)', :pos => '4.4,1!', :shape => 'Mdiamond' )
  graph_g2.add_edges( "Lift", "AutoLift", :fontsize => '10', :taillabel => '...AutoLift::GoToBottomFloor()' )
}.output(:svg => "SenderRecipientMessage.svg")

//Experiment No.1
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//This Source file is Written by Dr. T. Subbulaskhmi, Professor, 
//School of Computing Science and Engineering, VIT University Chennai 
//using the NARVAL examples of Scilab for Network Topology Creation  
//The Operating System used for writing the code found in this file is Windows 8
//SCILAB version 5.5.2 and NARVAL toolbox version 3.1
//|-----------------------------------------------------------------------------|
//|This lab experiment will do the following operations                         |
//|1.create and Display Bus Topology                                            |
//|2.Colour the nodes and Edges                                                 |
//|3.Display the node number and edge number                                    |
//|4.Display the number of nodes and edges                                      |
//|5.Display the Edge Indexbetween two nodes                                    |
//|6.Display the length of every edge                                           |
//|7.Return the set of edges connected to a node inside a graph                 |
//|8.Extract the data fields of the node                                        |
//|9.Extract the data fields of the Edge                                        |
//|-----------------------------------------------------------------------------|
clear;
clc;
//1. create and Display Bus Topology
NameOfNetwork='Bus Topology';// Name of your network
NumberOfNodes=15;//Number of Nodes in the network
StartingNodesOfConnection=[1 2 3 4 5 6 7 1 2 3 4 5 6 7]; //Starting Nodes of the connection lines
EndingNodesOfConnection=[2 3 4 5 6 7 8 9 10 11 12 13 14 15]; //Ending Node of the connection 
XCoordinatesOfNodes=[100 100 100 100 100 100 100 100 200 300 400 500 600 300 300]; // X-Coordinates of the nodes
YCoordinatesOfNodes=[300 400 500 600 700 800 900 950 300 400 500 600 700 800 900]; // Y-Coordinates of the nodes
[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,StartingNodesOfConnection,EndingNodesOfConnection,XCoordinatesOfNodes,YCoordinatesOfNodes)//Creates the Bus topoplogy
WindowIndex=1; //Graph Window Number
[Graphparameters] = NL_G_ShowGraph(TopologyGraph,WindowIndex);// Visualize the Graph along with indices for Nodes and Edges
xtitle("Bus Topology","X-Nodes","Y-Nodes");
//2. Colour the nodes and Edges
NodeColor=30; // Node Colour 2:[Blue],3:[Green], 5:[Red]
BorderThickness=10; // Node Border thickness
NodeDiameter=25; //Node diameter 
WindowIndex=2;//window index
ListOfNodes=[1 2 4 6 8 10 12 14];//list of nodes
[graph1,nodes]=NL_G_HighlightNodes(TopologyGraph,ListOfNodes,NodeColor,BorderThickness,NodeDiameter,WindowIndex);//Highlight the specific nodes mentioned in the 'nodes' vector
xtitle("Highlight the specific nodes mentioned in the nodes vector","X-Nodes","Y-Nodes");
NodeColor=5;// Edge Colour
EdgeWidth=5;//Edge Width
WindowIndex=3;//window index
ListOfEdges=[1 5 7];//list of edges
[graph2,nodes]=NL_G_HighlightEdges(TopologyGraph,ListOfEdges,NodeColor,EdgeWidth,WindowIndex);//Highlight the specific nodes mentioned in the 'edges' vector
xtitle("Highlight the specific nodes mentioned in the  edges vector","X-Nodes","Y-Nodes");
//3. Display the node number and edge number
WindowIndex=4; //Graph Window Number
[GraphVisualise] = NL_G_ShowGraphNE(TopologyGraph,WindowIndex);// Visualize the Graph along with indices for Nodes and Edges
xtitle("Graph along with indices for Nodes and Edges","X-Nodes","Y-Nodes");
//4. Display the number of nodes and edges 
[ExtractedNode,ExtractedEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp('Number of nodes:',ExtractedNode); //display the number of nodes and edges 
disp('Number of edges:',ExtractedEdge);

//5.Display the Edge Index between two nodes
StartingNode=4;//starting node
EndingNode=5;//ending node
[GetEdgeIndex]=NL_G_Nodes2Edge(TopologyGraph,StartingNode,EndingNode);//Get the Edge Index
disp('Index of Edge across nodes 4 and 5:',GetEdgeIndex);

//6. Display the length of every edge
[EdgeLength]=NL_G_EdgesLength(TopologyGraph.node_x,TopologyGraph.node_y,TopologyGraph.head,TopologyGraph.tail);//Display the length of every edge 
disp('length of all edges',EdgeLength); 

//7. Return the set of edges connected to a node inside a graph
NodeIndex=2;//node index
[GetEdgeIndex]=NL_G_EdgesOfNode(TopologyGraph,NodeIndex);//application of NL_G_EdgesOfNode
disp('Internal Edges of node 2:',GetEdgeIndex);

//8. Extract the data fields of the node 
[node_x,node_y,node_border,node_diameter,node_color,node_number]=NL_G_NodeDataFields(TopologyGraph);// Extracting the node data fields 
disp('Node x :',XCoordinatesOfNodes); // X Coordinates
disp('Node y :', YCoordinatesOfNodes);// Y Coordinates
disp('Node Borders :', node_border); //Node Border
disp('Node Diameter :', node_diameter); // Diameter of the node
disp('Node Colour :', node_color); // Node colour
disp('Node Number :', node_number); //Number of Nodes

//9.Extract the data fields of the Edge
[e_head,e_tail,e_color,e_width,e_length,e_weight,e_number]=NL_G_EdgeDataFields(TopologyGraph)//application of NL_G_EdgeDataFields
disp('Head Nodes',e_head); //Head node details
disp('Tail Nodes',e_tail); // Tail Node details
disp('Edge Colours',e_color); // Colour of edges
disp('Edge Widths',e_width); // Width of edges
disp('Edge Lengths',e_length); // Length of the edges
disp('Edge Weights',e_weight); //Weight of the edges
disp('Edge Numbers',e_number); // Edge Number 


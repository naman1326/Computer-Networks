//Experiment No.4
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
//Program to 1. Create and visualize a graph with Mesh Topology  2. Colour the nodes 3. Visualize the Graph with node number and edge number 4. Display the number of nodes and edges in scilab prompt 5. Display the length of every edge in Scilab prompt 6. Display the set of edges connected to a node inside a graph in Scilab Prompt

clear;
clc;

//1. Create and visualize a graph with Mesh Topology 
NameOfNetwork='Mesh Topology';// Name of your network
NumberOfNodes=6;// Number of Nodes in the network
EndingNodesOfEdge=[1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 6 6 6 6 6]; //Ending Nodes of the connection lines
StartNodesOfEdge=[2 3 4 5 6 2 3 4 5 6 2 3 4 5 6 2 3 4 5 6 2 3 4 5 6 2 3 4 5 6]; //Starting Nodes of the connection lines
XCoordinatesOfNodes=[300 300 400 500 500 400]; // X-Coordinates of the nodes
YCoordinatesOfNodes=[500 700 800 700 500 400]; // Y-Coordinates of the nodes
[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,EndingNodesOfEdge,StartNodesOfEdge,XCoordinatesOfNodes,YCoordinatesOfNodes)//Creates the Mesh topoplogy
WindowNumber=1;//Graph Window Number
[GraphVisualize] = NL_G_ShowGraph(TopologyGraph,WindowNumber); // Visualize the Graph
xtitle("MeshTopology","X-Nodes","Y-Nodes");
//2. Colour the nodes 
NodeColor=30; // Node Colour 2:[Blue],3:[Green], 5:[Red]
BorderThickness=10; // Node Border thickness
NodeDiameter=25; //Node diameter 
WindowNumber=2;//window index
ListOfNodes=[1 3 5];//list of nodes

[NodeHighlight,Graph1]=NL_G_HighlightNodes(TopologyGraph,ListOfNodes,NodeColor,BorderThickness,NodeDiameter,WindowNumber);// Highlight the specified nodes and output a graph

//3. Visualize the Graph with node number and edge number 
xtitle("Node Highlight","X-Nodes","Y-Nodes");
WindowNumber=3; //Graph Window Number
[VisualizeNodesEdges] = NL_G_ShowGraphNE(TopologyGraph,WindowNumber);// Visualize the Graph along with indices for Nodes and Edges
xtitle("Edge index","X-Nodes","Y-Nodes");
//4. Display the number of nodes and edges in scilab prompt
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 

//5. Display the length of every edge in Scilab prompt
[ExtractEdge]=NL_G_EdgesLength(TopologyGraph.node_x,TopologyGraph.node_y,TopologyGraph.head,TopologyGraph.tail);//Display the length of every edge 
disp('length of all edges',ExtractEdge); 

//6. Display the set of edges connected to a node inside a graph in Scilab Prompt
NodeIndex=2;//node index
[EdgeApplication]=NL_G_EdgesOfNode(TopologyGraph,NodeIndex);//application of NL_G_EdgesOfNode
disp('Internal Edges of node 2:',EdgeApplication);

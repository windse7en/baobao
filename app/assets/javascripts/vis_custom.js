// vis 图谱表格试验
// provide data in the DOT language
var container = document.getElementById('vis_container');

var data = {
  nodes: parsedData.nodes,
  edges: parsedData.edges
}

var options = parsedData.options;

// you can extend the options like a normal JSON variable:
options.nodes = {
  color: 'red',
}

// create a network
var network = new vis.Network(container, data, options);

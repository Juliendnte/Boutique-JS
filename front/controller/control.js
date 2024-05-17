const url = "http://localhost:4000";

exports.Index = (req, res) => {
  const watches = getWatches();
  res.render("../views/pages/index", watches);
};

async function getWatches() {
  const data = await fetch(`${url}/articles`);
  return data.json();
}

const url = "http://localhost:4000";

exports.Index = (req, res) => {
  res.render("../views/pages/index");
};

exports.Result = (req, res) => {
  getWatches()
    .then((watches) => {
      console.log(watches.articles.items);
      res.render("../views/pages/result", {
        lst: watches.articles.items,
      });
    })
    .catch((err) => {
      console.log(err);
    });
};

async function getWatches() {
  const data = await fetch(`${url}/articles`);
  return data.json();
}

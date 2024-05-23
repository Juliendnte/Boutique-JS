const url = "http://localhost:4000";

exports.Index = (req, res) => {
  getWatch(1).then(watches =>{
    console.log(watches)
    res.render("../views/pages/index", {
      lst : watches.article.img
    });
  }).catch(err =>{
    console.log(err);
  })
};

async function getWatch(i) {
  const data = await fetch(`${url}/article/${i}`);
  return data.json();
}

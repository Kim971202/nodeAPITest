var express = require("express");
var router = express.Router();
const pool = require("../database/pool");

router.get("/:idx", async (req, res, next) => {
  const { idx } = req.params;
  try {
    const sql = "select * from t_notice "; //where idx = ?";
    const data = await pool.query(sql, [idx]);
    //console.log(data[0][1].noti_title);

    let resultList = data[0];
    //console.log(resultList[11]);
    //console.log(resultList[11].noti_title);
    //console.log(JSON.stringify(resultList[11]));
    //return res.json(resultList);
    //return res.json(data[0]);

    let test = {
      test1: "111",
      test2: "222",
      test3: resultList[1],
    };

    console.log(test);
    return res.send(test);
  } catch (err) {
    return res.status(500).json(err);
  }
});

/*
router.get('/:boardId', async (req, res, next) => {
  const { boardId } = req.params
  try {
    const data = await pool.query('select board_id, title, content from board where board_id = ?', [boardId])
    return res.json(data[0])
  } catch (err) {
    return res.status(500).json(err)
  }
})

router.get('/', async (req, res, next) => {
  const { page, size } = req.query
  try {
    const data = await pool.query('select board_id, title from board limit ?, ?', [Number(page), Number(size)])
    return res.json(data[0])
  } catch (err) {
    return res.status(500).json(err)
  }
})

router.post('/', async (req, res, next) => {
  const { title, content } = req.body
  try {
    const data = await pool.query('insert into board set ?', { title: title, content: content })
    return res.json(data[0])
  } catch (err) {
    return res.status(500).json(err)
  }
})

router.patch('/:boardId', async (req, res, next) => {
  const { boardId } = req.params
  const { title, content } = req.body
  try {
    const data = await pool.query('update board set title = ?, content = ? where board_id = ?', [title, content, boardId])
    return res.json(data[0])
  } catch (err) {
    return res.status(500).json(err)
  }
})

router.delete('/:boardId', async (req, res, next) => {
  const { boardId } = req.params
  try {
    const data = await pool.query('delete from board where board_id = ?', [boardId])
    return res.json(data[0])
  } catch (err) {
    return res.status(500).json(err)
  }
})
*/

module.exports = router;

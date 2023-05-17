import express from "express";
import db from "../db.js";

const router = express.Router();

// Get all animals
router.get("/", async (req, res) => {
  const { rows } = await db.query("SELECT * FROM animals;");
  res.json(rows);
});

// Get a single animal by ID
router.get("/:id", async (req, res) => {
  const { id } = req.params;
  const { rows } = await db.query("SELECT * FROM animals WHERE id = $1;", [id]);

  if (rows.length === 0) {
    res.sendStatus(404);
  } else {
    res.json(rows[0]);
  }
});

// Create a new animal
router.post("/", async (req, res) => {
  const { name, species, age, enclosure_id } = req.body;

  const text = "INSERT INTO animals (name, species, age, enclosure_id) VALUES ($1, $2, $3, $4) RETURNING *;"; // prettier-ignore
  const data = [name, species, age, enclosure_id];

  const { rows } = await db.query(text, data);

  res.status(201).json(rows[0]);
});

// Update an animal
router.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { name, species, age, enclosure_id } = req.body;
  const { rows } = await db.query(
    "UPDATE animals SET name = $1, species = $2, age = $3, enclosure_id = $4 WHERE id = $5 RETURNING *;",
    [name, species, age, enclosure_id, id]
  );

  if (rows.length === 0) {
    res.sendStatus(404);
  } else {
    res.json(rows[0]);
  }
});

// Delete an animal
router.delete("/:id", async (req, res) => {
  const { id } = req.params;
  const { rowCount } = await db.query("DELETE FROM animals WHERE id = $1;", [
    id,
  ]);

  if (rowCount === 0) {
    res.sendStatus(404);
  } else {
    res.sendStatus(204);
  }
});

export default router;

import express from "express";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";
import db from "../db.js";

const signUpSignIn = express.Router();

// When the user first signs up
signUpSignIn.post("/register", async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!password || password.length < 8) {
      res.status(400).json({ message: "Invalid password" });
      return;
    }

    // Generate a salt and hash the password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // Save the new user to the database
    await db.query("INSERT INTO users (email, password_hash) VALUES ($1, $2)", [
      email,
      hashedPassword,
    ]);

    // Send a response indicating successful registration
    res.status(201).json({ message: "User registered successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Something terrible happened" });
  }
});

signUpSignIn.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    // Fetch the user with the provided email
    const userResult = await db.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    const user = userResult.rows[0];

    // If no such user exists, or the password is incorrect, send an error
    if (!user || !(await bcrypt.compare(password, user.password_hash))) {
      res.status(401).json({ message: "Invalid email or password" });
      return;
    }

    // If the credentials are correct, create a new session
    const sessionId = uuidv4();
    const oneDay = 24 * 60 * 60 * 1000; // in ms
    const expiresAt = new Date(Date.now() + oneDay); // expires in 24 hours

    await db.query(
      "INSERT INTO sessions (user_id, session_id, expires_at) VALUES ($1, $2, $3)",
      [user.id, sessionId, expiresAt]
    );

    // Set a cookie with the session id
    res.cookie("session_id", sessionId, {
      expires: expiresAt,
      httpOnly: true,
      sameSite: "Strict",
    });

    // Send a response indicating successful login
    res.status(200).json({ message: "User logged in successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Something terrible happened" });
  }
});

signUpSignIn.post("/signout", async (req, res) => {
  try {
    const { session_id } = req.cookies;
    if (session_id) {
      await db.query(
        "UPDATE sessions SET is_valid = false WHERE session_id = $1",
        [session_id]
      );
    }
  } catch (err) {
    console.error(err);
  } finally {
    res.clearCookie("session_id");
    res.end();
  }
});

export default signUpSignIn;

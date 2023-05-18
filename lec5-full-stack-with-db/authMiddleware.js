import db from "./db.js";

const authMiddleware = async (req, res, next) => {
  const sessionId = req.cookies.session_id;

  if (!sessionId) {
    res.status(401).json({ message: "Unauthorized" });
    return;
  }

  const { rows } = await db.query(
    "SELECT * FROM sessions WHERE session_id = $1",
    [sessionId]
  );

  const session = rows[0];

  if (!session || new Date() > session.expires_at || !session.is_valid) {
    res.status(401).json({ message: "Unauthorized" });
    return;
  }

  res.locals.user_id = session.user_id;

  next();
};

export default authMiddleware;

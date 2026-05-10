const express = require("express");
const axios = require("axios");

const app = express();

// Route 1: health check
app.get("/", (req, res) => {
  res.send("API is running");
});

// Route 2: AI endpoint
app.get("/ai", async (req, res) => {
  try {
    const response = await axios.get("https://api.chucknorris.io/jokes/random");

    res.json({
      message: "AI response",
      data: response.data.value
    });

  } catch (error) {
    res.status(500).json({ error: "Something went wrong" });
  }
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
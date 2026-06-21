import "dotenv/config";
import type { Request, Response } from "express";
import dotenv from 'dotenv';
import fetch from "node-fetch";
dotenv.config();

export const technicianNotification = async (req: Request, res: Response) => {

    // app.post("/send_notification", async (req, res) => {
    const { title, message, playerId, type, referenceId } = req.body;

    //   if (!playerIds || playerIds.length === 0) {
    //     return res.status(400).json({ error: "Please provide at least one player ID" });
    // console.log(`Your ONESIGNAL_API_KEY is:${process.env.ONESIGNAL_API_KEY}`);

//     console.log('body', req.body)
//    const app_Id =`${process.env.ONESIGNAL_APP_ID}`
//    console.log('app_Id:',app_Id)

    const bodyData = {
        app_id: `${process.env.ONESIGNAL_APP_ID}`,
        // app_id:"bda3a186-5e4d-44df-8312-911c68f6a97c",
        include_player_ids: [playerId],
        //   include_player_ids: ["0c7ef7b4-3938-4e10-9362-193bdc5e1786"],
        //    include_player_ids: ["e63d1220-9779-4de4-aba5-c423ebeedebf"], 
        headings: { en: title },
        // headings: { en: title || "Test Notification" },
        contents: { en: message },
        // contents: { en: message || "Hello from Node.js + OneSignal!" },

        //     //send for all player here
        //     include_player_ids: [], 
        // included_segments: ["All"]

        data: {
            type: type, //Dynamic
            referenceId: referenceId// this is CAPA/task ID; dynamic
        }

    };

      try {

    const response = await fetch("https://onesignal.com/api/v1/notifications", {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Basic " + `${process.env.ONESIGNAL_API_KEY}`,
      },
      body: JSON.stringify(bodyData),
      
    });

    const data = await response.json();
    res.status(response.status).json(data);
  } catch (err) {
    console.error("Error sending notification:", err);
    res.status(500).json({ success: false, error: err });
  }
}
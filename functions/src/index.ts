import * as functions from "firebase-functions";
import {getFirestore, Timestamp} from "firebase-admin/firestore";
import {initializeApp} from "firebase-admin/app";

initializeApp();

exports.dailyCleanup = functions.pubsub
    .schedule("every 24 hours").onRun(async () => {
      const firestore = getFirestore();
      const roomsCollection = firestore.collection("rooms");

      const dateCheck = new Date(Date.now() - 24 * 60 * 60 * 1000);
      const query = roomsCollection
          .where("lastInteraction", "<", Timestamp.fromDate(dateCheck));
      const snapshot = await query.get();

      const batch = firestore.batch();

      snapshot.forEach((doc) => {
        batch.delete(doc.ref);
      });

      return await batch.commit();
    });

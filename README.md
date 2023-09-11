# Deliverigo
### JUNCTION ASIA 2023 
CNT TRACK 3RD WINNER
## **Introduce**

---

This app is a service aimed at promoting **healthy consumption habits** and **environmental protection** at the same time **by reducing dependence on delivery**.

It is a **GPS distance-based calorie counting service** aimed at reducing dependence on delivery. We want to reduce dependence on delivery **by explicitly showing consumers health, economic cost, and ESG** three factors, and giving users a sense of **accomplishment**.

To do this, we first called the **Google Maps API, region, country, and restaurant search API.**
Next, based on your current location and selected location information, **it provides information on the distance between two locations, calories** burned when walking that distance, carbon consumption and motorcycle carbon emissions over distance.

Based on this information, users can feel a sense of accomplishment by explicitly confirming through the app what value they have gained by visiting directly without using a delivery app.

We expect that **this app will make a small contribution to reducing delivery dependence** by **encouraging direct visits by making users feel a sense of accomplishment.**

## **WireFrame**

---

![image](https://github.com/izongg0/Deliverigo/assets/108528803/e17d9c8f-c8e8-4a46-91b9-51d9ffeed219)

## MainFunction

---

1. Based on GPS, measure the distance to the current location and the selected location and provide required information about the distance

2. When you enter calorie, Calorie information can be obtained by subtracting the calories consumed when visiting directly from the calories of the food entered.

3. Not only calorie information, but also elements that can be obtained when not using the delivery app are increasingly allowing users to see and feel a sense of accomplishment.

## **Calculation standard**

---

**On the last page, you will find information about the benefits of not using a delivery app.
We will explain what criteria were used when calculating the information.**

1. **Calorie** : Based on an adult male weighing 70 kg, walking 1 km consumes 40 kcal. Based on this, the distance from the current location to the selected location was converted into calories.
2. **Save Money** : The delivery fee, which is an expense that does not occur when the delivery app is not used, was used as money to save.
3. **Carbon reduction** : It tells you how much carbon emissions have been avoided by telling you the amount of carbon emissions from motorcycles that occur when delivery is made and the amount of carbon emissions that occur when a multi-use container is not used. For reference, the carbon footprint of motorcycles is 0.103 g per 1 m, and we used this information.

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

csv_file = "list_d2.csv"
data_frame = pd.read_csv(csv_file).astype(str)

servo_max = 110000
servo_min = 40000
servo_mid = servo_min + (servo_max - servo_min) / 2

pen_down_color = {
    servo_min: "blue",
    servo_max: "red"
}

# Binary to Decimal
for key in data_frame.keys():
    data_frame[key] = data_frame[key].apply(lambda x: int(x, 2))

print(data_frame)

# Scatterplot X and Y
for valX, valY, valZ in zip(data_frame["X"], data_frame["Y"], data_frame["Z"]):
    valY = (valY-servo_mid) / (servo_max - servo_min)
    cartesianX = valX * np.cos(np.pi*valY)
    cartesianY = valX * np.sin(np.pi*valY)
    plt.scatter(cartesianX, cartesianY, color=pen_down_color[valZ])
    
plt.scatter(0, 0, color="black")    
plt.axis('equal')
plt.xlabel("X")
plt.ylabel("Y")
plt.grid(True)
plt.show()

from re import A
import cv2
import argparse
import numpy as np
from math import log10, sqrt
from skimage.metrics import structural_similarity as compare_ssim
#from skimage.measure import compare_ssim
#import imutils

def PSNR(original, approximate):
    mse = np.mean((original - approximate) ** 2)
    if(mse == 0):  # MSE is zero means no noise is present in the signal .
                  # Therefore PSNR have no importance.
        return 100
    max_pixel = 255.0
    psnr = 20 * log10(max_pixel / sqrt(mse))
    return psnr

def main():
    ap = argparse.ArgumentParser(description='Convert an image to a column file of pixel value')
    ap.add_argument("-e","--exact", required=True, help="name of exact image")
    ap.add_argument("-a","--approx", required=True, help="name of approximate image")

    args = vars(ap.parse_args())

    exact = cv2.imread(args["exact"])
    approx = cv2.imread(args["approx"])

    exactGray = cv2.cvtColor(exact, cv2.COLOR_BGR2GRAY)
    approxGray = cv2.cvtColor(approx, cv2.COLOR_BGR2GRAY)

    # Two different forms to calculate PSNR
    psnr = cv2.PSNR(exactGray,approxGray)
    value = PSNR(exactGray,approxGray)
    print("PSNR_1: {} dB".format(psnr)) 
    print("PSNR_2: {} dB".format(value)) 

    # Calculate SSIM
    (score, diff) = compare_ssim(exactGray, approxGray, full=True)
    print("SSIM: {}".format(score))

if __name__ == "__main__":
    main()
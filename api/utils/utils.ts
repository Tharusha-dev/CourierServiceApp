import jwt from 'jsonwebtoken'

import { User } from '@prisma/client';
export function generateAccessToken(user: User) {
  return jwt.sign({ uid: user.uid, privilegeLevel: user.privilegeLevel }, "mySecretKey", {
    expiresIn: "30m", // access token expire quickly
  });
};

export function generateRefreshToken(uid: number, privilegeLevel: number) {
  return jwt.sign({ uid, privilegeLevel }, "myRefreshSecretKey", {
    expiresIn: "30d", // while refresh token are meant to last longer. This means every user MUST re-login once every 30 days.
  });
};


export function isValidPassword(password: string): boolean {

  if (password.length < 5) {
    return false;
  }
  const specialCharRegex = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
  if (!specialCharRegex.test(password)) {
    return false;
  }
  const numberRegex = /\d/;
  if (!numberRegex.test(password)) {
    return false;
  }
  const capitalLetterRegex = /[A-Z]/;
  if (!capitalLetterRegex.test(password)) {
    return false;
  }

  return true;
}



export function isValidEmail(email: string): boolean {
  let emailPattern = new RegExp(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/);
  return emailPattern.test(email)

}
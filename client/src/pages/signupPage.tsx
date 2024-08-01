import React, { useEffect, useState } from 'react'
import bcrypt from 'bcryptjs'
// import api from '../axios'
import { useApi } from '../useApi'
import PasswordChecklist from "react-password-checklist"

import "../pages/signupPage.css"
import { useNavigate } from 'react-router-dom'

export default function SignupPage() {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [passwordAgain, setPasswordAgain] = useState("")
    const [isPasswordValid, setIsPasswordValid] = useState(false)
    const [isEmailValid, setIsEmailValid] = useState(false)



    const [fname, setFname] = useState("")
    const [lname, setLname] = useState("")
    const [addrs, setAddrs] = useState("")


    const [response, setResponse] = useState("")
    const navigate = useNavigate()
    const api = useApi()

    useEffect(() => {

        async function verifyUser() {
            await api.post("/verify", {},
                {

                }

            ).then((res) => {


                if (res.status === 200) {
                    navigate("/dashboard")
                }
            }).catch((err) => {
                if (err.response.status === 403) {
                    navigate("/signup")
                }
            })

        }

        verifyUser()


    }, [])

    function validateEmail(email: string):boolean {
        let emailPattern = new RegExp(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/);
        return emailPattern.test(email)
    }


    async function submitDetails(firstName: string, lastName: string, email: string, password: string, address: string) {



        await api.post("/signup", {
            "firstName": firstName,
            "lastName": lastName,
            "username": email,
            "password": password,
            "address": address
        }).then((res) => {
            setResponse(res.data)

            if (res.status === 200) {
                navigate("/login")
            }

        })
    }



    return (
        <div className="signup-page">
            <div className="signup-container">
                <h1 className="heading">
                    Sign Up
                </h1>
                <span className="field-name">First Name : </span>
                <input onChange={(e) => {
                    setFname(e.target.value)
                }} type="text" name="" id="" className="field-input" />

                <span className="field-name">Last Name : </span>
                <input onChange={(e) => {
                    setLname(e.target.value)
                }} type="text" name="" id="" className="field-input" />
                <span className="field-name">Address : </span>
                <input onChange={(e) => {
                    setAddrs(e.target.value)
                }} type="text" name="" id="" className="field-input" />

                <span className="field-name">Email (username): </span>
                <input onChange={(e) => {
                    setIsEmailValid(validateEmail(e.target.value))
                    setEmail(e.target.value)
                }} type="text" name="" id="" className="field-input" />
                <span className="field-name">Password : </span>
                <input onChange={(e) => {
                    setPassword(e.target.value)
                }} type="password" name="" id="" className="field-input" />

                <span className="field-name">Type password again : </span>
                <input onChange={(e) => {
                    setPasswordAgain(e.target.value)
                }} type="password" name="" id="" className="field-input" />
                {!isEmailValid ? <span style={{marginTop:"5%"}} className='email-validation-response'>Email not valid</span> : <></>}


                <PasswordChecklist
                    style={{ marginTop: "6%" }}
                    rules={["minLength", "specialChar", "number", "capital", "match"]}
                    minLength={5}
                    value={password}
                    valueAgain={passwordAgain}
                    onChange={(isValid) => {
                        setIsPasswordValid(isValid)

                    }}
                />



                <button onClick={(e) => {
                    if (isPasswordValid && isEmailValid) {
                        submitDetails(fname, lname, email, password, addrs)
                    } else {
                        console.log("Password in invalid")
                    }
                }} className={`signup-submit-button ${isPasswordValid  && isEmailValid? "btn-unlocked" : ""}`}>
                    Sign Up
                </button>

                <span style={{ marginTop: "10%" }} onClick={() => { navigate("/login") }}> Already a user ? Log in here. </span>
            </div>

            {response != "" ? <span>{response}</span> : ""}

        </div>


    )
}

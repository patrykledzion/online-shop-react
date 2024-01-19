import { useState } from 'react'
import './App.css'
import React from "react"
import { BrowserRouter, Routes, Route, Navigate} from "react-router-dom";
import Header from "./MainPageComponents/Header"
import MainContent from "./MainPageComponents/MainContent"
import Search from "./MainPageComponents/Search"
import Item from "./MainPageComponents/Item"
import LoginPage from "./MainPageComponents/LoginPage"
import { instanceOf } from 'prop-types';
import {withCookies, Cookies} from 'react-cookie'
import UserAccount from './MainPageComponents/UserAccount';
import AddProduct from './MainPageComponents/AddProduct';


class App extends React.Component {

  static propTypes = {
    cookies: instanceOf(Cookies).isRequired,
  };
 
  constructor(props) {
    super(props);
    const {cookies} = props;
    this.state = {
      cookies: cookies,
      Auth: cookies.get('Auth') || null
    }

    this.api = {
      url: "http://localhost/api-for-shop/",
      suburls: {
        categories: "categories/",
        file: "file/",
        users: {
          loginUser: "users/loginUser/",
          getData: "users/getData/"
        },
        products: {
          addProduct: "products/addProduct/",
          showProducts: "products/showProducts/"
        }
      }
    }

  }

  

  render() {
    return (
      <>
      
      <Header />
      <Routes>
        <Route index element={<MainContent api={this.api} cookies={this.state.AuthID}/>}/>
        <Route path='/main' element={<MainContent api={this.api} cookies={this.state.AuthID}/>}/>
        <Route path='/search' element={<Search cookies={this.state.AuthID} app={this} />}/>
        <Route path='/item' element={<Item cookies={this.state.AuthID}/>}/>
        <Route path='/login'
          element={ this.state.Auth===null ? <LoginPage api={this.api} app={this}/> : <Navigate replace to="/account" />}
        />  

        <Route path='/account'
          element = { this.state.Auth===null ? <Navigate replace to="/login" /> : <UserAccount app={this}/>}
        />  

        <Route path='/add-order'
          element = { this.state.Auth===null ? <Navigate replace to="/login" /> : <AddProduct app={this}/>}
        />  
         

      </Routes>
      </>
    )
  }
}

export default withCookies(App);

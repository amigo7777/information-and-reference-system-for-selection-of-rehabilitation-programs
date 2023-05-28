'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    
    static associate(models) {
    }
  }
  User.init({
    username: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: DataTypes.STRING,
    password: {
      type: DataTypes.STRING,
      allowNull: false
    },
    phone_number: DataTypes.STRING,
    gender: DataTypes.CHAR,
    date_of_birth: DataTypes.DATE,
    primary_disease: DataTypes.INTEGER,
    secondary_condition: DataTypes.INTEGER,
    diets_id: DataTypes.INTEGER
  }, {
    sequelize,
    tableName: 'users',
    modelName: 'User',
  });
  return User;
};
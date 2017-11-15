
'use strict'
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('versions', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      field_set_id: {
        type: Sequelize.INTEGER
      },
      field_set_table: {
        type: Sequelize.TEXT
      },
      major_version: {
        type: Sequelize.INTEGER,
        defaultValue: 1
      },
      minor_version: {
        type: Sequelize.INTEGER,
        defaultValue: 0
      },
      created_at: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP(3)')
      },
      updated_at: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP(3)')
      }
    })
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('versions', {
      cascade: true
    })
  }

}

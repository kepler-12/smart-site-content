
'use strict'
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('templates', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      resource_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'resources',
          key: 'id'
        }
      },
      name: {
        type: Sequelize.STRING
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
      },
      slots: {
        type: Sequelize.JSON
      }
    })
      .then(result => {

      })
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('templates', {
      cascade: true
    })
  }

}

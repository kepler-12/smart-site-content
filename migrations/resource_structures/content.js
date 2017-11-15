
'use strict'
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('content', {
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
        type: Sequelize.STRING
      },
      version_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'versions',
          key: 'id'
        }
      },
      field_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'fields',
          key: 'id'
        }
      },
      name: {
        type: Sequelize.STRING
      },
      value: {
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
      }
    })
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('content', {
      cascade: true
    })
  }

}

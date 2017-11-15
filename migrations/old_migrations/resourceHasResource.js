
'use strict'
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('resourceHasResource', {
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
      hasresource_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'resources',
          key: 'id'
        }
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
    return queryInterface.dropTable('resourceHasResource', {
      cascade: true
    })
  }

}

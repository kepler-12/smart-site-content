
'use strict'
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('fields', {
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
      field_set: {
        type: Sequelize.STRING
      },
      name: {
        type: Sequelize.STRING
      },
      type: {
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
    .then(() => {
      return queryInterface.addIndex('fields',
        {
          fields: ['field_set', 'name', 'resource_id'],
          name: 'composite_index',
          type: 'UNIQUE'
        })
    })
  },
  down: (queryInterface, Sequelize) => {
    console.log('FIELDS DOWN')
    return queryInterface.dropTable('fields', {
      cascade: true
    })
  }

}

module.exports = (data) => {
  if (data.timestamps !== false) {
    return `
    created_at: {
      allowNull: false,
      type: Sequelize.DATE
    },
    updated_at: {
      allowNull: false,
      type: Sequelize.DATE
    },`
  }
}

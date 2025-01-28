const handler = async (event, ctx) => {
  try {
    const body = event?.body ?? {}
    const name = body?.name ?? null
    if (!name) {
      throw new Error("Name parameter is required")
    }
    return {
      statusCode: 200,
      body: JSON.stringify({
        message: `Hello ${name}`
      })
    }
  } catch(error) {
    console.error("Error", error.message)
    return {
      statusCode: 400,
      body: JSON.stringify({error: error.message})
    }
  }
};

module.exports = { handler }

if (require.main === module) {
    // This code will only run if the file is run directly
    console.log('This module is being run directly');
    handler().then(x => console.log(x))
             .catch(e => console.error(e))
} else {
    // This code will run if the file is required/imported
    console.log('This module has been required/imported');
}

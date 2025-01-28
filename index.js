const handler = async (event, ctx) => {
  const myEnvVar = process?.env?.MY_ENV_VAR ?? "Default Value"
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: `Environment Variable: ${myEnvVar}`
    }),
  };
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

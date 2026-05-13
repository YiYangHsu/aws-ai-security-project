const axios = require("axios");

const {
    SecretsManagerClient,
    GetSecretValueCommand
} = require("@aws-sdk/client-secrets-manager");

const client = new SecretsManagerClient({
    region: "us-east-1"
});

exports.handler = async (event) => {
    console.log("🚀 Lambda started");
    try {

        // Retrieve secret from Secrets Manager
        const command = new GetSecretValueCommand({
            SecretId: "secure-ai-api-key"
        });
        console.log("📡 Fetching secret from Secrets Manager");
        const secretResponse = await client.send(command);

        const secretString = JSON.parse(secretResponse.SecretString);

        const apiKey = secretString.api_key;

        console.log("Secret retrieved successfully");

        // External API call
        const response = await axios.get(
            "https://jsonplaceholder.typicode.com/todos/1"
        );
        console.log("🌐 Calling external API");
        return {
            statusCode: 200,
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                success: true,
                message:  "CI/CD deployment successful",
                external_api_data: response.data
            })
        };

    } catch (error) {

        console.error("ERROR:");
        console.error(error);

        return {
            statusCode: 500,
            body: JSON.stringify({
                success: false,
                error: error.message
            })
        };
    }
};
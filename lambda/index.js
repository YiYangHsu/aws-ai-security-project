const axios = require("axios");

exports.handler = async (event) => {

    console.log("Incoming event:");
    console.log(JSON.stringify(event));

    try {

        const response = await axios.get(
            "https://jsonplaceholder.typicode.com/todos/1"
        );

        console.log("External API response:");
        console.log(response.data);

        return {
            statusCode: 200,
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                success: true,
                external_api_data: response.data
            })
        };

    } catch (error) {

        console.error("Error calling external API:");
        console.error(error);

        return {
            statusCode: 500,
            body: JSON.stringify({
                success: false,
                message: "Failed to call external API"
            })
        };
    }
};
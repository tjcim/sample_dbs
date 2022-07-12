import express from 'express';
import {ApolloServer, gql} from 'apollo-server-express';
import { ApolloServerPluginLandingPageGraphQLPlayground } from "apollo-server-core";

const PORT = process.env.PORT || 4000;
const API_ENDPOINT = process.env.API_ENDPOINT || `http://localhost:${PORT}/graphql`;

// Construct a schema, using GraphQL schema language
const typeDefs = gql`
  type Query {
    hello: String
  }
`;

// Provide resolver functions for your schema fields
const resolvers = {
    Query: {
        hello: () => 'Hello world!',
    },
};

const server = new ApolloServer({
  typeDefs,
  resolvers,
  csrfPrevention: true,
  cache: "bounded",
  plugins: [
    ApolloServerPluginLandingPageGraphQLPlayground(),
  ],
  playground: {
      endpoint: API_ENDPOINT
  }
});

const app = express();
await server.start();
server.applyMiddleware({app});


app.listen(PORT, () => {
    console.log(`GraphiQL is now listening on http://localhost:${PORT}${server.graphqlPath}`);
    console.log(`Default API endpoint: ${API_ENDPOINT}`);
});


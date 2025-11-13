const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

exports.handler = async (event, context) => {
  try {
    if (event.httpMethod === 'GET') {
      const { data, error } = await supabase
        .from('prestadores')
        .select('*');

      if (error) throw error;

      return {
        statusCode: 200,
        body: JSON.stringify(data)
      };
    }

    if (event.httpMethod === 'POST') {
      const body = JSON.parse(event.body);
      const { data, error } = await supabase
        .from('prestadores')
        .insert([body]);

      if (error) throw error;

      return {
        statusCode: 201,
        body: JSON.stringify(data)
      };
    }

    return {
      statusCode: 405,
      body: JSON.stringify({ error: 'Method not allowed' })
    };
  } catch (error) {
    return {
      statusCode: 500,
      body: JSON.stringify({ error: error.message })
    };
  }
};


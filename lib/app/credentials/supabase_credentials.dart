import 'package:supabase/supabase.dart';

class SupabaseCredentials {
  static const String APIKEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqYnN2b21oYWVkbG9naHB2aW1qIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk4MjM0MzQsImV4cCI6MjAxNTM5OTQzNH0.whExCQOEY125OmBIhYZZyEP7iRA_u1zenio0sRxqLj0';
  static const String APIURL = 'https://ijbsvomhaedloghpvimj.supabase.co';

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}

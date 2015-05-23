path = File.join(Rails.root, "config/secrets.yml")
TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => '', 'from' => '', 'token' => ''}

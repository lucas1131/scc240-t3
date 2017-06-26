package Connection;

public class Connection {
	public void main(String[] args) {
		final String url = "jdbc:oracle://grad.icmc.usp.br:15215/ORCL";
		final String username = "9293265";
		final String password = "a";

		System.out.println("Connecting database...");

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
		    System.out.println("Database connected!");
		} catch (SQLException e) {
		    throw new IllegalStateException("Cannot connect the database!", e);
		}
	}
}
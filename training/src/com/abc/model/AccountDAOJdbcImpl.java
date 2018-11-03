package com.abc.model;

import java.sql.*;

import javax.sql.DataSource;

public class AccountDAOJdbcImpl implements AccountDAO {
    private DataSource dataSource;
    
    public AccountDAOJdbcImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

   @Override
   public void ChangePass(Account account) {
        Connection conn = null;
        PreparedStatement stmt = null;
        SQLException ex = null;
        try {
            conn = dataSource.getConnection();
            String tsql = "update t_account set password = '"+account.getPassword()+"' where name = '"+account.getName()+"';";
            System.out.println(tsql);
            stmt = conn.prepareStatement(tsql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            ex = e;
        }
        finally {
            if(stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
        }
        if(ex != null) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public boolean isUserExisted(Account account) {
        Connection conn = null;
        PreparedStatement stmt = null;
        SQLException ex = null;
        boolean existed = false;
        try {
            conn = dataSource.getConnection();
            stmt = conn.prepareStatement("SELECT COUNT(1) FROM t_account WHERE name = ?");
            stmt.setString(1, account.getName());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                existed = (rs.getInt(1) == 1);
            }
        } catch (SQLException e) {
            ex = e;
        }
        finally {
            if(stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
        }
        if(ex != null) {
            throw new RuntimeException(ex);
        }
        
        return existed;
    }

    @Override
    public void addAccount(Account account) {
        Connection conn = null;
        PreparedStatement stmt = null;
        SQLException ex = null;
        try {
            conn = dataSource.getConnection();
            stmt = conn.prepareStatement("INSERT INTO t_account(name, password, email) VALUES(?, ?, ?)");
            stmt.setString(1, account.getName());
            stmt.setString(2, account.getPassword());
            stmt.setString(3, account.getEmail());
            stmt.executeUpdate();
        } catch (SQLException e) {
            ex = e;
        }
        finally {
            if(stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
        }
        if(ex != null) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public Account getAccount(Account account) {
        Connection conn = null;
        PreparedStatement stmt = null;
        SQLException ex = null;
        Account acct = null;
        try {
            conn = dataSource.getConnection();
            stmt = conn.prepareStatement("SELECT password, email, uid FROM t_account WHERE name = ?");
            stmt.setString(1, account.getName());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                acct = new Account(account.getName(), rs.getString(1), rs.getString(2));
                acct.setUid(rs.getInt(3));
            }
        } catch (SQLException e) {
            ex = e;
        }
        finally {
            if(stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
        }
        if(ex != null) {
            throw new RuntimeException(ex);
        }
        
        return acct;
    }

}

import React, { useEffect, useState } from "react";
import { Typography, Button, Container, Paper, Box, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Avatar, ButtonGroup } from '@mui/material';
import { Link, useNavigate } from "react-router-dom";
import axios from 'axios';
import ArrowBackIcon from '@mui/icons-material/ArrowBack'; // เพิ่มไอคอนย้อนกลับ

const token = localStorage.getItem('token');
const url = process.env.REACT_APP_BASE_URL;

export default function Index() {
  const [employees, setEmployees] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    employeesGet();
  }, []);

  const employeesGet = () => {
    axios.get(`${url}/employee`, {
      headers: {
        'Authorization': `Bearer ${token}`,
      },
    })
    .then((response) => {
      setEmployees(response.data); 
    })
    .catch((error) => {
      console.error('Error fetching employees', error);
    });
  };

  const ViewEmployee = (id) => {
    window.location = `/admin/employee/view/${id}`;
  }

  const UpdateEmployee = (id) => {
    window.location = `/admin/employee/update/${id}`;
  }

  const EmployeeDelete = (id) => {
    axios.delete(`${url}/employee/${id}`, {
      headers: {
        'Accept': 'application/form-data',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
    })
    .then((response) => {
      if (response.data.status === true) {
        alert(response.data.message);
        employeesGet();
      } else {
        alert('Failed to delete employee');
      }
    })
    .catch((error) => {
      console.error('There was an error!', error);
    });
  };

  const EmployeeBan = (id) => {
    axios.put(`${url}/employee/ban/${id}`, null, {
      headers: {
        'Authorization': `Bearer ${token}`,
      },
    })
    .then((response) => {
      if (response.data.status === true) {
        alert(response.data.message);
        employeesGet(); // Refresh the employee list after banning
      } else {
        alert('Failed to suspend employee');
      }
    })
    .catch((error) => {
      console.error('Error suspending employee:', error);
    });
  };

  const EmployeeUnban = (id) => {
    axios.put(`${url}/employee/unban/${id}`, null, {
      headers: {
        'Authorization': `Bearer ${token}`,
      },
    })
    .then((response) => {
      if (response.data.status === true) {
        alert(response.data.message);
        employeesGet(); // Refresh the employee list after unbanning
      } else {
        alert('Failed to unban employee');
      }
    })
    .catch((error) => {
      console.error('Error unbanning employee:', error);
    });
  };

  return (
    <Box sx={{ display: 'flex', minHeight: '100vh', backgroundColor: '#F8E9F0' }}> {/* เปลี่ยนสีพื้นหลังเป็นชมพูอ่อน */}
      <Container sx={{ marginTop: 2 }} maxWidth="lg">
        <Paper sx={{ padding: 2, backgroundColor: '#fff', borderRadius: '15px' }}> {/* เปลี่ยนพื้นหลังเป็นสีขาวและขอบมน */}
          <Box display="flex" alignItems="center" sx={{ mb: 2 }}>
            {/* ปุ่มย้อนกลับ */}
            <Button
              startIcon={<ArrowBackIcon />}
              onClick={() => navigate('/dashboard')}
              sx={{ mr: 2, color: '#000', fontWeight: 'bold', fontSize: '18px' }}
            >
              จัดการข้อมูลผู้ใช้
            </Button>
          </Box>

          {/* ตารางข้อมูลพนักงาน */}
          <TableContainer sx={{ border: '2px solid black', borderRadius: '10px' }}> {/* เพิ่มกรอบรอบนอกตาราง */}
            <Table aria-label="simple table">
              <TableHead>
                <TableRow>
                  <TableCell align="right" sx={{ fontWeight: 'bold', fontSize: '16px' }}>รหัส</TableCell>
                  <TableCell align="center" sx={{ fontWeight: 'bold', fontSize: '16px' }}>รูป</TableCell>
                  <TableCell align="left" sx={{ fontWeight: 'bold', fontSize: '16px' }}>ชื่อ</TableCell>
                  <TableCell align="left" sx={{ fontWeight: 'bold', fontSize: '16px' }}>นามสกุล</TableCell>
                  <TableCell align="left" sx={{ fontWeight: 'bold', fontSize: '16px' }}>ชื่อผู้ใช้</TableCell>
                  <TableCell align="center" sx={{ fontWeight: 'bold', fontSize: '16px' }}>จัดการข้อมูล</TableCell>
                </TableRow>
              </TableHead>

              <TableBody>
                {employees.map((employee) => (
                  <TableRow key={employee.empID}>
                    <TableCell align="right" sx={{ fontSize: '14px' }}>{employee.empID}</TableCell>
                    <TableCell align="center">
                      <Box display="flex" justifyContent="center">
                        <Avatar src={url + '/employee/image/' + employee.imageFile} sx={{ width: 56, height: 56 }} /> {/* ขอบมน */}
                      </Box>
                    </TableCell>
                    <TableCell align="left" sx={{ fontSize: '14px' }}>{employee.firstname}</TableCell>
                    <TableCell align="left" sx={{ fontSize: '14px' }}>{employee.lastname}</TableCell>
                    <TableCell align="left" sx={{ fontSize: '14px' }}>{employee.username}</TableCell>
                    <TableCell align="center">
                      <ButtonGroup color="primary" aria-label="outlined primary button group">
                        <Button variant="outlined" onClick={() => ViewEmployee(employee.empID)} sx={{ borderRadius: '10px', color: '#000', borderColor: '#000', backgroundColor: '#FFF' }}>
                          ตรวจสอบรายงาน
                        </Button>
                        <Button variant="outlined" onClick={() => UpdateEmployee(employee.empID)} sx={{ borderRadius: '10px', borderColor: '#000', color: '#000' }}>
                          แก้ไข
                        </Button>
                        <Button variant="contained" onClick={() => EmployeeBan(employee.empID)} sx={{
                          borderRadius: '10px', color: 'red', border: '1px solid red', backgroundColor: employee.isActive === 0 ? '#ffcccc' : '#fff',
                          '&:hover': { backgroundColor: '#ffe6e6' }
                        }} disabled={employee.isActive === 0}>
                          ระงับผู้ใช้
                        </Button>
                        <Button variant="contained" onClick={() => EmployeeUnban(employee.empID)} sx={{
                          borderRadius: '10px', color: 'green', border: '1px solid green', backgroundColor: employee.isActive === 1 ? '#ccffcc' : '#fff',
                          '&:hover': { backgroundColor: '#e6ffe6' }
                        }} disabled={employee.isActive === 1}>
                          ปลดแบน
                        </Button>
                        <Button variant="contained" color="error" onClick={() => EmployeeDelete(employee.empID)} sx={{ borderRadius: '10px' }}>
                          ลบผู้ใช้
                        </Button>
                      </ButtonGroup>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        </Paper>
      </Container>
    </Box>
  );
}

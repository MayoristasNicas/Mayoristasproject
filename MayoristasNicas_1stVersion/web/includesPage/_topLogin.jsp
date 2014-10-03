    
<div id = "topLogin">
    <div class="container_16">
        <div id="LoginBox" class="grid_16">

            <div class="grid_6" id = "loginForm">
                <form method="POST" action="login"  name="loginForm">
                    <table>
                        <tr>
                            <td colspan="2">
                                <strong><h1 style="font-wieght:bold; text-align:left; padding:20px 0px; color:#FFF;">Inicio de Sesión...</h1></strong>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="correo@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr><tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Iniciar Sesión" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="grid_6 push_3" id = "RegisterForm">
                <form method="POST" action="register" name="registerForm">
                    <table>
                        <tr>
                            <td colspan="2">
                                <strong><h1 style="font-wieght:bold; text-align:right; padding:20px 0px; color:#FFF;">Registrate Ahora!!</h1></strong>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Repetir Password</label>
                            </td>
                            <td>
                                <input type="password" name="passAgain" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        <!--	<tr>
                                        <td>
                                        <label>Gender</label>
                                        </td>
                                        <td>
                                        <select>
                                                <option name="gender" value="male">Male</option>
                                                <option name="gender" value="female">Female</option>
                                        </select><br/>
                                        </td>
                                </tr>-->

                        <tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Resgistrarme" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </div>
</div>
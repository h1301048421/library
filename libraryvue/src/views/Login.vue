<template>
    <div>
        <el-form :rules="rules" ref="loginForm" :model="loginForm" class="loginContain">
            <h3 class="loginTitle">用户登录</h3>
            <el-form-item prop="username">
                <el-input type="text" v-model="loginForm.username"
                          auto-complete="off" placeholder="请输入用户名"></el-input>
            </el-form-item>
            <el-form-item prop="password">
                <el-input type="password" v-model="loginForm.password"
                          auto-complete="off" placeholder="请输入密码" @keydown.enter.native="submitLogin"></el-input>
            </el-form-item>
            <el-checkbox v-model="checked" class="loginRemember">记住密码</el-checkbox>
            <el-button  type="primary" style="width: 100%" @click="submitLogin">登录</el-button>
        </el-form>
    </div>
</template>

<script>

    export default {
        name: "Login",
        data(){
            return{
                checked:true,
                loginForm:{
                    username:'hukun',
                    password:'123456'
                },
                rules:{
                    username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
                    password: [{ required: true, message: '请输入用户密码', trigger: 'blur' }],
                }
            }
        },
        methods:{
            submitLogin(){
                this.$refs.loginForm.validate((valid) => {
                    if (valid) {
                        this.postKeyValueRequest('/doLogin',this.loginForm).then(resp=>{
                            if (resp){
                                //将登录信息保存到sessionStorage中去
                                window.sessionStorage.setItem("user",JSON.stringify(resp.obj));
                                //页面跳转，
                                this.$router.replace("/home");
                            }
                        })
                    } else {
                        this.$message.error('请输入所有字段！')
                        return false;
                    }
                });
            }
        }
    }

</script>

<style>
.loginContain{
    border-radius: 15px;
    background-clip: padding-box;
    margin: 180px auto;
    width: 350px;
    padding: 25px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
}
    .loginTitle{
        margin: 5px auto 20px auto;
        text-align: center;
        color: #505458;
    }
    .loginRemember{
        text-align: left;
        margin: 0px 0px 15px 0px;
    }
</style>
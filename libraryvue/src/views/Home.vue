<template>
    <div>
        <el-container>
            <el-header class="homeHeader">
                <div style="color: white">图书管理系统</div>
                <div>
                    <el-dropdown class="userInfo" trigger="click" @command="commandHandler">
                        <span  class="el-dropdown-link">
                            {{user.name}}<i><img :src="user.userface"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item command="userInfo">个人中心</el-dropdown-item>
                            <el-dropdown-item command="setting">设置</el-dropdown-item>
                            <el-dropdown-item command="logout" divided>注销登录</el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </div>
            </el-header>
            <el-container>
                <el-aside width="200px">
                    <el-menu router unique-opened>
                        <el-submenu :index="index+''" v-for="(item,index) in routes" v-if="!item.hidden"
                                    :key="index">
                            <template slot="title">
                                <i style="color: #409EFF;margin-right: 5px" :class="item.iconCls"></i>
                                <span>{{item.name}}</span>
                            </template>
                            <el-menu-item :index="child.path" v-for="(child,indexj) in item.children" :key="indexj">
                                <i style="color: #409EFF;margin-right: 5px" :class="child.iconCls"></i>
                                {{child.name}}</el-menu-item>
                        </el-submenu>
                    </el-menu>
                </el-aside>
                <el-main>
                    <el-breadcrumb separator-class="" v-if="this.$router.currentRoute.path!='/home'">
                        <el-breadcrumb-item :to="{path:'/home'}">首页</el-breadcrumb-item>
                        <el-breadcrumb-item>{{this.$router.currentRoute.name}}</el-breadcrumb-item>
                    </el-breadcrumb>
                    <div class="homeWelcome" v-if="this.$router.currentRoute.path=='/home'">
                        欢迎登录
                    </div>
                    <router-view class="homeRouterView"/>
                </el-main>
<!--                    <el-footer>Footer</el-footer>-->
                </el-container>
        </el-container>
    </div>
</template>

<script>
    export default {
        name: "Home",
        data(){
            return{
                user:JSON.parse(window.sessionStorage.getItem("user")),
            }
        },
        computed:{
            routes(){
                return this.$store.state.routes;
            }
        },
        methods:{
            commandHandler(command){
                if (command=='logout'){
                    this.$confirm('此操作将注销登录, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        this.getRequest('/logout');
                        window.sessionStorage.removeItem("user");
                        this.$store.commit('initRoutes',[]);
                        this.$router.replace("/");
                    }).catch(() => {
                        this.$message({
                            type: 'info',
                            message: '已取操作'
                        });
                    });
                }
            }
        }
    }
</script>

<style>
.homeHeader{
    background-color: #409EFF;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0px 15px;
    box-sizing: border-box;
}
    .userInfo{
        cursor: pointer;
    }
    .el-dropdown-link img{
        width: 48px;
        height: 48px;
        border-radius: 24px;
    }
    .el-dropdown-link{
        color: white;
        display: flex;
        align-items: center;
    }

</style>
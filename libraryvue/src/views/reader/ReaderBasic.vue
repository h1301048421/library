<template>
    <div>
        <div style="margin-top: 10px;display: flex;justify-content: space-between" >
            <div>
                <el-input v-model="keyword"
                          style="width: 250px"
                          size="small"
                          clearable
                          @clear="initReader"
                          @keydown.enter.native="initReader"
                          placeholder="请输入读者..."></el-input>
                <el-button
                        icon="el-icon-search"
                        @click="initReader"
                        size="small"
                        type="primary"
                        style="margin-left: 10px">搜索</el-button>
            </div>
            <div>
                <el-button @click="showAddView" size="small" type="primary" icon="el-icon-plus">添加读者</el-button>
            </div>
        </div>
        <div style="margin-top: 5px">
            <el-table
                    v-loading="loading"
                    :data="readers"
                    stripe
                    size="small"
                    @selection-change="handleSelectionChange"
                    style="width: 90%">
                <el-table-column
                        type="selection"
                        align="center"
                        width="50">
                </el-table-column>
                <el-table-column
                        prop="id"
                        label="编号"
                        align="center"
                        width="50">
                </el-table-column>
                <el-table-column
                        prop="name"
                        label="姓名"
                        align="center"
                        width="80">
                </el-table-column>
                <el-table-column
                        prop="sex"
                        label="性别"
                        align="center"
                        width="80">
                </el-table-column>
                <el-table-column
                        prop="birth"
                        label="出生日期"
                        align="center"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="email"
                        label="邮箱"
                        align="center"
                        width="150">
                </el-table-column>
                <el-table-column
                        prop="phone"
                        label="手机号"
                        align="center"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="address"
                        label="地址"
                        align="center"
                        width="200">
                </el-table-column>
                <el-table-column
                        prop="isenable"
                        label="状态"
                        align="center"
                        width="100">
                    <template slot-scope="scope">
                        <el-tag type="success" v-if="scope.row.isenable">已启用</el-tag>
                        <el-tag type="danger" v-else>未启用</el-tag>
                    </template>
                </el-table-column>
                <el-table-column
                        fixed="right"
                        label="操作"
                        align="center">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="showUpdateReaderView(scope.row)">编辑</el-button>
                        <el-button size="mini" type="primary">查看详情</el-button>
                        <el-button size="mini" type="danger" @click="deleteReader(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div style="margin-top: 8px;display: flex;justify-content: space-between;margin-right: 150px">
                <el-button
                        @click="deleteMany"
                        :disabled="multipleSelection.length==0"
                        size="mini"
                        type="danger" >批量删除</el-button>
                <el-pagination
                        background
                        @current-change="currentChange"
                        @size-change="sizeChange"
                        layout="sizes, prev, pager, next, jumper, ->, total, slot"
                        :total="total">
                </el-pagination>
            </div>
        </div>
        <el-dialog
                    :title="title"
                    :visible.sync="dialogVisible"
                    width="60%">
                <el-form :model="reader" :rules="rules" ref="readerForm">
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="姓名:" prop="name">
                                <el-input size="mini" style="width: 160px" prefix-icon="el-icon-collection"
                                          placeholder="请输入姓名..." v-model="reader.name"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="性别:" prop="sex">
                                <el-radio v-model="reader.sex" label="男">男</el-radio>
                                <el-radio v-model="reader.sex" label="女">女</el-radio>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="出生日期" prop="birth">
                                <el-date-picker
                                        v-model="reader.birth"
                                        type="date"
                                        size="mini"
                                        style="width: 180px"
                                        placeholder="选择日期">
                                </el-date-picker>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="邮箱:" prop="email">
                                <el-input size="mini" style="width: 160px" prefix-icon="el-icon-collection"
                                          placeholder="请输入邮箱..." v-model="reader.email"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="手机号码:" prop="phone">
                                <el-input size="mini" style="width: 160px" prefix-icon="el-icon-collection"
                                          placeholder="请输入手机号码..." v-model="reader.phone"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="地址:" prop="address">
                                <el-input size="mini" style="width: 205px" prefix-icon="el-icon-collection"
                                          placeholder="请输入联系地址..." v-model="reader.address"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="24">
                            <el-form-item label="状态:" prop="isenable">
                                <el-switch
                                        v-model="reader.isenable"
                                        active-color="#13ce66"
                                        inactive-color="#ff4949"
                                        active-text="启用"
                                        inactive-text="禁用">
                                </el-switch>
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
                <span slot="footer" class="dialog-footer">
                    <el-button @click="dialogVisible = false" size="mini">取 消</el-button>
                    <el-button type="primary" @click="doAddReader" size="mini">确 定</el-button>
                </span>
        </el-dialog>
    </div>
</template>

<script>
    export default {
        name: "ReaderBasic",
        data(){
            return{
                loading:false,
                keyword:'',
                title:"",
                multipleSelection: [],
                dialogVisible:false,
                total:null,
                page:1,
                size:10,
                readers:[],
                reader:{
                    name: "",
                    sex: "",
                    birth: "",
                    email: "",
                    phone: "",
                    address: "",
                    isenable: true
                },
                rules:{
                    name: [{ required: true, message: '请输入读者名称', trigger: 'blur' }],
                    sex: [{ required: true, message: '请输入读者性别', trigger: 'blur' }],
                    birth: [{ required: true, message: '请输入读者出生日期', trigger: 'blur' }],
                    email: [{required:true,message:'请输入邮箱',type:'email',message:'邮箱格式不正确',trigger:'blur'}],
                    phone: [{ required: true, message: '请输入读者手机号码', trigger: 'blur' }],
                    address: [{ required: true, message: '请选择读者联系地址', trigger: 'blur' }],
                    isenable: [{ required: true, message: '请输入读者 状态', trigger: 'blur' }],
                }

            }
        },
        mounted() {
            this.initReader();
        },
        methods:{
            deleteMany(){
                this.$confirm('此操作将永久删除【'+this.multipleSelection.length+'】条, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    let ids='?';
                    this.multipleSelection.forEach(item=>{
                        ids+='ids='+item.id+'&';
                    })
                    this.deleteRequest("/reader/basic/"+ids).then(resp=>{
                        if (resp){
                            this.initReader();
                        }
                    })
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },
            deleteReader(data){
                this.$confirm('此操作将永久删除【'+data.name+'】, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.deleteRequest("/reader/basic/"+data.id).then(resp=>{
                        if (resp){
                            this.initReader();
                        }
                    })
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },
            doAddReader(){
                if (this.reader.id){
                    this.$refs['readerForm'].validate((valid)=>{
                        if (valid){
                            this.putRequest("/reader/basic/",this.reader).then(resp=>{
                                if (resp){
                                    this.initReader();
                                    this.emptyReader();
                                    this.dialogVisible=false;
                                }
                            })
                        }
                    })
                }else {
                    this.$refs['readerForm'].validate((valid)=>{
                        if (valid){
                            this.postRequest("/reader/basic/",this.reader).then(resp=>{
                                if (resp){
                                    this.initReader();
                                    this.emptyReader();
                                    this.dialogVisible=false;
                                }
                            })
                        }
                    })
                }

            },
            showAddView(){
                this.title="添加读者";
                this.dialogVisible=true;
            },
            currentChange(currentChange){
                this.page=currentChange;
                this.initReader();
            },
            sizeChange(currentSize){
                this.size=currentSize;
                this.initReader();
            },
            showUpdateReaderView(data){
                this.title="更新读者";
                this.dialogVisible=true;
                this.reader=data;
            },
            initReader(){
                this.loading=true;
                this.getRequest("/reader/basic/?page="+this.page+"&size="+this.size+"&keyword="+this.keyword).then(resp=>{
                    if (resp){
                        this.readers=resp.data;
                        this.total=resp.total;
                        this.loading=false;
                    }
                })
            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            emptyReader(){
                this.reader={
                    name: "",
                    sex: "",
                    birth: "",
                    email: "",
                    phone: "",
                    address: "",
                    isenable: true
                }
            }
        }
    }
</script>

<style>

</style>
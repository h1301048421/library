<template>
    <div>
        <div style="display: flex;justify-content: space-between">
            <div>
                <el-input size="small" placeholder="请输入书名进行搜索..." prefix-icon="el-icon-search"
                          clearable
                          @clear="initBooks"
                          style="width: 300px;margin:5px 10px 10px 2px " v-model="keyword"
                          @keydown.enter.native="initBooks"></el-input>
                <el-button icon="el-icon-search" size="small" type="primary" @click="initBooks">搜索
                </el-button>
<!--                <el-button icon="el-icon-search" size="small" type="primary">高级搜索</el-button>-->
            </div>
            <div>
                <el-button size="small" type="primary" icon="el-icon-plus" @click="showAddBookView">添加图书</el-button>
            </div>
        </div>
        <div style="margin-top: 10px">
            <el-table
                    :data="books"
                    stripe
                    size="small"
                    v-loading="loading"
                    @selection-change="handleSelectionChange"
                    style="width: 85%">
                <el-table-column
                        type="selection"
                        align="center"
                        width="50">
                </el-table-column>
                <el-table-column
                        prop="name"
                        align="center"
                        label="书名"
                        width="125">
                </el-table-column>
                <el-table-column
                        prop="author"
                        label="作者"
                        align="center"
                        width="125">
                </el-table-column>
                <el-table-column
                        prop="publish"
                        label="出版社"
                        align="center"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="isbn"
                        label="国际标准书号"
                        align="center"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="price"
                        label="售价"
                        align="center"
                        width="90">
                </el-table-column>
                <el-table-column
                        prop="bookClass.name"
                        label="类别"
                        align="center"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="number"
                        label="库存"
                        align="center"
                        width="90">
                </el-table-column>
                <el-table-column
                        label=" 操作"
                        align="center">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="showUpdateBookView(scope.row)">编辑</el-button>
                        <el-button size="mini" type="primary" @click="dialogLendBook(scope.row)"
                                   :disabled="scope.row.number==0">借阅图书</el-button>
                        <el-button size="mini" type="danger" @click="deleteBook(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div style="display: flex;justify-content: space-between;margin-right: 185px">
                <el-button size="mini" style="margin-top: 5px" type="danger" @click="deleteMany"
                           :disabled="multipleSelection.length==0">批量删除
                </el-button>
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
            <div>
                <el-form :model="book" :rules="rules" ref="bookForm">
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="书名:" prop="name">
                                <el-input size="mini" style="width: 160px" prefix-icon="el-icon-collection"
                                          placeholder="请输入书籍名..." v-model="book.name"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="作者:" prop="author">
                                <el-input size="mini" style="width: 160px" prefix-icon="el-icon-s-custom"
                                          placeholder="请输入书籍的作者..." v-model="book.author"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="出版社:" prop="publish">
                                <el-input size="mini" style="width: 160px" prefix-icon="el-icon-edit"
                                          placeholder="请输入书籍出版社..." v-model="book.publish"> </el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="国际标准书号:" prop="isbn">
                                <el-input size="mini" style="width: 140px" prefix-icon="el-icon-edit"
                                          placeholder="请输入编号..." v-model="book.isbn"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="6">
                            <el-form-item label="售价:" prop="price">
                                <el-input size="mini" style="width: 110px" prefix-icon="el-icon-shopping-bag-2"
                                          placeholder="请输入书籍的定价..." v-model="book.price"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="5">
                            <el-form-item label="类别:" prop="classId">
                                <el-select size="mini" style="width: 100px" v-model="book.classId" placeholder="请选择">
                                    <el-option
                                            v-for="item in bookClass"
                                            :key="item.id"
                                            :label="item.name"
                                            :value="item.id">
                                    </el-option>
                                </el-select>
                            </el-form-item>
                        </el-col>
                        <el-col :span="5">
                            <el-form-item label="库存:" prop="number">
                                <el-input size="mini" style="width: 80px" prefix-icon="el-icon-coin"
                                          placeholder="请输入该书籍的库存..." v-model="book.number"> </el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>

            </div>
            <span slot="footer" class="dialog-footer">
                <el-button size="mini" @click="dialogVisible = false">取 消</el-button>
                <el-button size="mini" type="primary" @click="doAddBook">确 定</el-button>
            </span>
        </el-dialog>
        <el-dialog
                title="借阅图书"
                :visible.sync="dialogVisibleLend"
                center
                width="50%">
            <div style="margin-left: 100px">
                <el-form :model="lendInfo" ref="lendInfoForm">
                    <div>
                        <el-row>
                            <el-col :span="10">
                                <el-form-item label="书籍名称:">
                                    <el-input size="mini" style="width: 180px" prefix-icon="el-icon-shopping-bag-2"
                                              :disabled="true" v-model="this.book.name"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="10">
                                <el-form-item label="读者编号:">
                                    <el-input size="mini" style="width: 180px" prefix-icon="el-icon-shopping-bag-2"
                                              placeholder="请输入读者编号..." v-model="lendInfo.rId"></el-input>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="15">
                                <el-form-item label="借阅日期:">
                                    <el-date-picker
                                            v-model="lendInfo.lendDate"
                                            value-format="yyyy-MM-dd"
                                            type="date"
                                            size="mini"
                                            placeholder="选择日期">
                                    </el-date-picker>
                                </el-form-item>
                            </el-col>
                        </el-row>
                        <el-row>
                            <el-col :span="15">
                                <el-form-item label="归还日期:">
                                    <el-date-picker
                                            v-model="lendInfo.backDate"
                                            value-format="yyyy-MM-dd"
                                            type="date"
                                            size="mini"
                                            placeholder="选择日期">
                                    </el-date-picker>
                                </el-form-item>
                            </el-col>
                        </el-row>
                    </div>
                </el-form>
            </div>
            <span slot="footer" class="dialog-footer">
                <el-button size="mini" @click="dialogVisibleLend = false">取 消</el-button>
                <el-button size="mini" type="primary" @click="doAddLendInfo">确 定</el-button>
            </span>
        </el-dialog>

    </div>

</template>

<script>
    import {getRequest} from "../../utils/api";

    export default {
        name: "BookBasic",
        data(){
            return {
                title:'',
                books:[],
                loading:false,
                total:0,
                page:1,
                size:10,
                keyword:'',
                multipleSelection: [],
                bookClass:[],
                lendInfo:{
                    bId:null,
                    rId:null,
                    lendDate:"",
                    backDate:"",
                    isback:false,
                },
                book:{
                    name: "",
                    author: "",
                    publish: "",
                    isbn: "",
                    price: null,
                    classId: '',
                    number: null
                },
                dialogVisible:false,
                dialogVisibleLend:false,
                rules:{
                    name: [{ required: true, message: '请输入书籍名称', trigger: 'blur' }],
                    author: [{ required: true, message: '请输入作者', trigger: 'blur' }],
                    publish: [{ required: true, message: '请输入出版社', trigger: 'blur' }],
                    isbn: [{ required: true, message: '请输入国际标准书号', trigger: 'blur' }],
                    price: [{ required: true, message: '请输入售价', trigger: 'blur' }],
                    classId: [{ required: true, message: '请选择类别', trigger: 'blur' }],
                    number: [{ required: true, message: '请输入库存量', trigger: 'blur' }],
                }

            }
        },
        mounted() {
            this.initBooks();
            this.initData();
        },
        methods:{
            deleteMany(){
                this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    let ids='?';
                    this.multipleSelection.forEach(item=>{
                        ids+='ids='+item.id+'&';
                    })
                    this.deleteRequest("/book/basic/"+ids).then(resp=>{
                        if (resp){
                            this.initBooks();
                        }
                    })
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            deleteBook(data){
                this.$confirm('此操作将永久删除【'+data.name+'】, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.deleteRequest("/book/basic/"+data.id).then(resp=>{
                        if (resp){
                            this.initBooks();
                        }
                    })
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },
            emptyLendInfo(){
                this.lendInfo={
                    bId:null,
                    rId:null,
                    lendDate:"",
                    backDate:"",
                    isback:false,
                }
            },
            emptyBook(){
                this.books={
                    name: "",
                    author: "",
                    publish: "",
                    isbn: "",
                    price: null,
                    classId: '',
                    number: null
                }
            },
            doAddBook(){
                if (this.book.id){
                    this.$refs['bookForm'].validate((valid)=>{
                        if(valid){
                            this.putRequest("/book/basic/",this.book).then(resp=>{
                                if (resp){
                                    this.dialogVisible=false;
                                    this.initBooks();
                                    this.emptyBook();
                                }
                            })
                        }
                    });
                }else {
                    this.$refs['bookForm'].validate((valid)=>{
                        if(valid){
                            this.postRequest("/book/basic/",this.book).then(resp=>{
                                if (resp){
                                    this.dialogVisible=false;
                                    this.initBooks();
                                    this.emptyBook();
                                }
                            })
                        }
                    });
                }
            },
            initData(){
                if (!window.sessionStorage.getItem("bookClass")){
                    this.getRequest("/book/basic/bookclass").then(resp=>{
                        if (resp){
                            this.bookClass=resp;
                            window.sessionStorage.setItem("bookClass",JSON.stringify(resp));
                        }
                    })
                }else {
                    this.bookClass=JSON.parse(window.sessionStorage.getItem("bookClass"));
                }
            },
            doAddLendInfo(){
                this.$refs['lendInfoForm'].validate((valid)=>{
                    if (valid){
                        this.postRequest("/book/basic/lendinfo",this.lendInfo).then(resp=>{
                            if (resp){
                                this.initBooks();
                                this.dialogVisibleLend=false;
                            }
                        })
                    }
                });
            },
            dialogLendBook(data){
                this.dialogVisibleLend=true;
                this.lendInfo.bId=data.id;
                this.book=data;
            },
            showAddBookView(){
                this.title='添加书籍'
                this.dialogVisible=true;
            },
            showUpdateBookView(data){
                this.title='更新书籍信息';
                this.book=data;
                this.dialogVisible=true;
            },
            sizeChange(currentSize){
                this.size=currentSize;
                this.initBooks();
            },
            currentChange(currentPage){
                this.page=currentPage;
                this.initBooks();
            },
            initBooks(){
                this.loading=true
                this.getRequest("/book/basic/?page="+this.page+"&size="+this.size+"&keyword="+this.keyword).then(resp=>{
                    this.loading=false;
                    if (resp){
                        this.books=resp.data;
                        this.total=resp.total;
                    }
                })
            }
        },

    }
</script>

<style scoped>

</style>
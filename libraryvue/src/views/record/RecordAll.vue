<template>
    <div>
        <div>
            <div style="margin-top: 10px;display: flex;justify-content: center" >
                <div>
                    <el-input v-model="keyword"
                              style="width: 250px"
                              size="small"
                              clearable
                              @clear="initRecord"
                              @keydown.enter.native="initRecord"
                              placeholder="请输入读者..."></el-input>
                    <el-button
                            icon="el-icon-search"
                            @click="initRecord"
                            size="small"
                            type="primary"
                            style="margin-left: 10px">搜索</el-button>
                </div>
            </div>
            <div style="margin-top: 5px">
                <el-table
                        :data="records"
                        stripe
                        v-loading="loading"
                        size="small"
                        style="width: 100%">
                    <el-table-column
                            prop="name"
                            label="书籍名称"
                            align="center"
                            width="100">
                    </el-table-column>
                    <el-table-column
                            prop="author"
                            label="作者"
                            align="center"
                            width="180">
                    </el-table-column>
                    <el-table-column
                            prop="publish"
                            label="出版社"
                            align="center"
                            width="150">
                    </el-table-column>
                    <el-table-column
                            prop="readers.name"
                            label="借阅者"
                            align="center"
                            width="100">
                    </el-table-column>
                    <el-table-column
                            prop="readers.sex"
                            label="性别"
                            align="center"
                            width="100">
                    </el-table-column>
                    <el-table-column
                            prop="readers.phone"
                            label="手机号"
                            align="center"
                            width="100">
                    </el-table-column>
                    <el-table-column
                            prop="lendInfo.lendDate"
                            label="借阅开始日期"
                            align="center"
                            width="180">
                    </el-table-column>
                    <el-table-column
                            prop="lendInfo.backDate"
                            label="借阅到期日期"
                            align="center"
                            width="180">
                    </el-table-column>
                    <el-table-column
                            prop="lendInfo.isback"
                            label="是否已归还"
                            align="center"
                            width="100">
                        <template slot-scope="scope">
                            <el-button :disabled="true" size="mini" v-if="scope.row.lendInfo.isback" type="success">已归还
                            </el-button>
                            <el-button size="mini" v-else type="danger" @click="doBack(scope.row.lendInfo)">未归还
                            </el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </div>
            <div style="float: right;margin-right: 100px">
                <el-pagination
                        background
                        @size-change="handleSizeChange"
                        @current-change="handleCurrentChange"
                        layout="sizes, prev, pager, next, jumper, ->, total, slot"
                        :total="total">
                </el-pagination>
            </div>

        </div>
    </div>
</template>

<script>
    export default {
        name: "RecordAll",
        data(){
            return{
                records:[],
                keyword:'',
                total:null,
                size:10,
                page:1,
                loading:false,
            }
        },
        mounted() {
            this.initRecord();
        },
        methods:{
            handleSizeChange(currentSize){
                this.size=currentSize;
                this.initRecord();
            },
            handleCurrentChange(currentPage){
                this.page=currentPage;
                this.initRecord();
            },
            doBack(date){
                this.putRequest("/record/all/",date).then(resp=>{
                    if (resp){
                        this.initRecord();
                        console.log(date);
                    }
                })
            },
            initRecord(){
                this.loading=true;
                this.getRequest("/record/all/?page="+this.page+"&size="+this.size+"&keyword="+this.keyword).then(resp=>{
                    if (resp){
                        this.records=resp.data;
                        this.total=resp.total;
                        this.loading=false;
                    }
                })
            }
        }
    }
</script>

<style scoped>

</style>
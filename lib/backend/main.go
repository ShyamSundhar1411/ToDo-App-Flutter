package main
import (
	"github.com/gin-gonic/gin"
	"time"
	"net/http"
)

type ToDo struct{
	Id string `json:"id"`
	Title string `json:"title"`
	IsCompleted bool `default:"false" json:"is_completed"`
	IsImportant bool `json:"is_important"`
	Creationdate time.Time `json:"creation_date"`
}
var todos =[]ToDo{
	{
		Id:"2022-08-12",
		Creationdate:time.Now() ,
		Title: "Walk a dog",
		IsImportant: false,
	},
	{
		Id:"2022-08-122",
		Creationdate: time.Now(),
		Title: "Test 1",
		IsImportant: true,
	},
	{
		Id:"2022-08-1223",
		Creationdate: time.Now(),
		Title: "Test 2",
		IsImportant: false,
	},
	{
		Id:"2022-08-12321",
		Creationdate: time.Now(),
		Title: "Test 3",
		IsImportant: true,
	},
	{
		Id:"2022-08-1231",
		Creationdate: time.Now(),
		Title: "Test 4",
		IsImportant: true,
	},
}
func todoHandler(context *gin.Context){
	context.IndentedJSON(http.StatusOK,todos)
}
func addtodoHandler(context *gin.Context){
	var newTodo ToDo
	if err:= context.BindJSON(&newTodo);err!=nil{
		return 
	}
	todos = append(todos,newTodo)
	context.IndentedJSON(http.StatusCreated,newTodo)

}
func getTodoByIdHandler(context *gin.Context){
	id:=context.Param("id")
	for _,item:=range todos{
		if item.Id == id{
			context.IndentedJSON(http.StatusOK,item)
			return
		}
	}
	context.IndentedJSON(http.StatusNotFound,gin.H{"message":"ToDo Not Found"})
}

func main(){
	router := gin.Default()
	router.GET("/todos",todoHandler)
	router.POST("/todos/create",addtodoHandler)
	router.GET("/todo/:id",getTodoByIdHandler)
	router.Run(":5000")
}
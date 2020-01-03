package com.example.springbootproject.controller;


import com.example.springbootproject.pojo.Category;
import com.example.springbootproject.pojo.Post;
import com.example.springbootproject.repository.PostRepository;
import com.example.springbootproject.service.CategoryService;
import com.example.springbootproject.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/posts")
public class PostRestController
{
    @Autowired
    private PostService  postService;
    @Autowired
    private CategoryService categoryService;
//
//    @GetMapping
//    public List<Post> getPosts()
//    {
//        System.out.println("kjnhj");
//         //return "Hello world";
//         return postService.findAll();
//
//    }

    @GetMapping("/{id}")
    public Post getPost(@PathVariable int id)
    {
        return postService.get(id);
    }

    @GetMapping("/")
    public List<Post> getPosts()
    {     Pageable page= PageRequest.of(0,3);
        return postService.sortByPid(page);
    }


    @DeleteMapping("/{id}")
    public void deletePost(@PathVariable int id)
    {
        postService.delete(id);
    }

    @PostMapping("/")
    public void createPost(
                          @RequestParam(required = false,defaultValue = "",name ="title")String title,
                           @RequestParam(required = false,defaultValue = "",name ="content")String content,
                          @RequestParam(required = false,defaultValue = "",name ="category")String category
                           )
    {  Post post=new Post();
      post.setTitle(title);

        Pageable page= PageRequest.of(0,3);


      String arr[]=category.split(",");


      List<Category> categories=new ArrayList<>();
        for(String s:arr)
        {
           categories.add(categoryService.findCat(s));

        }
        post.setCategories(categories);
      post.setContent(content);

        postService.save(post);
    }
    @PutMapping("/{id}")
    public void update(@RequestParam int id,
                       @RequestParam(required = false,defaultValue = "",name ="title")String title,
                       @RequestParam(required = false,defaultValue = "",name ="content")String content,
                       @RequestParam(required = false,defaultValue = "",name ="category")String category
    )
    {
        Post post=postService.get(id);
        System.out.println(post.getPid());
        post.setTitle(title);
        post.setContent(content);
        //Pageable page= PageRequest.of(0,3);


        String arr[]=category.split(",");


        List<Category> categories=new ArrayList<>();
        for(String s:arr)
        {
            categories.add(categoryService.findCat(s));

        }
        post.setCategories(categories);

        postService.save(post);
    }


//
//    @GetMapping("posts")
//    public ModelAndView filteringSortingSearching(@RequestParam(required = false,name ="category")String cat,
//                                                  @RequestParam(required = false,name ="search")String search,
//                                                  @RequestParam(required = false,name ="sortBy")String sortBy,
//                                                  @RequestParam(required = false,defaultValue = "0",name = "page")int page,
//                                                  @RequestParam(required = false,defaultValue = "3",name = "size")int size) {
//
//        if (search != null) {
//            if (cat != null) {
//                Pageable pageable = PageRequest.of(page, size);
//
//                ModelAndView mv = new ModelAndView("home");
//                List<Post> listPostSearch = service.searchBy(search, pageable);
//                Category category = serviceCat.findCat(cat);
//
//                List<Post> listPostCategory = service.getByCat(category, pageable);
//                List<Post> listPostSearchCategory = new ArrayList<>();
//                for (Post post : listPostCategory) {
//                    if (listPostSearch.contains(post)) {
//                        listPostSearchCategory.add(post);
//                    }
//                }
//
//                //listPostCategory.retainAll(listPostSearch);
//                mv.addObject("listPost", listPostSearchCategory);
//                mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//                mv.addObject("pageNo", page);
//
//                return mv;
//            }
//            else if (sortBy != null)
//            {
//                System.out.println("Inside null");
//                if (sortBy.equals("createdAt")) {
//                    System.out.println("createdAt");
//                    Pageable pageable = PageRequest.of(page, size);
//                    ModelAndView mv = new ModelAndView("home");
//                    List<Post> listPostSearch = service.searchBy(search, pageable);
//                    List<Post> listPost = service.sortByCreatedDate(pageable);
//                    List<Post> listPostSearchCreatedAt=new ArrayList<>();
//
//
//                    for (Post post : listPost) {
//                        if (listPostSearch.contains(post)) {
//                            System.out.println(post.getPid());
//                            listPostSearchCreatedAt.add(post);
//                        }
//                    }
//                    System.out.println(listPost.size());
//                    mv.addObject("listPost", listPostSearchCreatedAt);
//                    mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//                    mv.addObject("pageNo", page);
//
//                    return mv;
//
//
//                }
//                else{
//                    System.out.println("updated");
//                    Pageable pageable = PageRequest.of(page, size);
//                    ModelAndView mv = new ModelAndView("home");
//                    List<Post> listPostSearch = service.searchBy(search, pageable);
//                    List<Post> listPost = service.sortByUpdateDate(pageable);
//                    List<Post> listPostSearchUpdatedAt=new ArrayList<>();
//                    for (Post post : listPost) {
//                        if (listPostSearch.contains(post)) {
//                            listPostSearchUpdatedAt.add(post);
//                        }
//                    }
//                    mv.addObject("listPost", listPostSearchUpdatedAt);
//                    mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//                    mv.addObject("pageNo", page);
//
//                    return mv;
//
//                }
//
//
//            } else {
//                Pageable pageable = PageRequest.of(page, size);
//
//                ModelAndView mv = new ModelAndView("home");
//                List<Post> listPost = service.searchBy(search, pageable);
//                mv.addObject("listPost", listPost);
//                mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//                mv.addObject("pageNo", page);
//
//                return mv;
//
//            }
//
//        } else {
//            Pageable pageable = PageRequest.of(page, size);
//            ModelAndView mv = new ModelAndView("home");
//
//            List<Post> listPost = service.sortByPid(pageable);
//            mv.addObject("listPost", listPost);
//            mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//            mv.addObject("pageNo", page);
//
//            return mv;
//
//        }
//    }
//       if (cat != null)
//          {
//        Pageable pageable = PageRequest.of(page, size);
//        Category category = serviceCat.findCat(cat);
//        ModelAndView mv = new ModelAndView("home");
//        List<Post> listPost = service.getByCat(category, pageable);
//        mv.addObject("listPost", listPost);
//        mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//        mv.addObject("pageNo", page);
//
//        return mv;
//
//    }

//        if (cat != null)
//        {
//            Pageable pageable = PageRequest.of(page, size);
//            Category category = serviceCat.findCat(cat);
//            ModelAndView mv = new ModelAndView("home");
//            List<Post> listPost = service.getByCat(category, pageable);
//            mv.addObject("listPost", listPost);
//            mv.addObject("lastPage", (service.sortByPid(pageable).size()) / size);
//            mv.addObject("pageNo", page);
//
//            return mv;
//
//        } else if (search != null) {
//
//            Pageable pageable = PageRequest.of(page, 3);
//
//            ModelAndView mv = new ModelAndView("home");
//            List<Post> listPost = service.searchBy(search, pageable);
//            mv.addObject("listPost", listPost);
//            mv.addObject("lastPage", (service.sortByPid(pageable).size()) / 3);
//            mv.addObject("pageNo", page);
//
//            return mv;
//
//        }
////        else
////            if(sortBy.equals("createdAt"))
////         {
////             System.out.println("jjjjjjjjjjj");
////            Pageable pageable=PageRequest.of(page,3);
////            ModelAndView mv = new ModelAndView("home");
////            List<Post> listPost = service.sortByCreatedDate(pageable);
////            mv.addObject("listPost", listPost);
////            mv.addObject("lastPage",(service.sortByPid(pageable).size())/3);
////            mv.addObject("pageNo",page);
////
////            return mv;
////
////           }
////            else
////            if(sortBy.equals("updatedAt"))
////            {Pageable pageable=PageRequest.of(page,3);
////                ModelAndView mv = new ModelAndView("home");
////                List<Post> listPost = service.sortByUpdateDate(pageable);
////                mv.addObject("listPost", listPost);
////                mv.addObject("lastPage",(service.sortByPid(pageable).size())/3);
////                mv.addObject("pageNo",page);
////
////
////                return mv;
////
////            }


}

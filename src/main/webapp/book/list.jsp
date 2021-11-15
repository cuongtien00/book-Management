<%--
  Created by IntelliJ IDEA.
  User: Phong Vu
  Date: 11/12/2021
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        #carouselExampleInterval, #carouselExampleFade,#carouselExampleCaptions {
            width: 300px;
        }
        a {
            text-decoration: none;
            color: black;
        }
        .slides {
            display: flex;
            margin-left: 300px;
        }
        body {

            background-image: url("https://cdn11.bigcommerce.com/s-ka7ofex/images/stencil/2000x1000/uploaded_images/how-rfid-is-making-libraries-smarter.jpg?t=1580145106");
        }
    </style>
</head>
<body>

<div align="center">
    <h1><a href="/books" style="color: red">Book management</a></h1>
    <h3><a href="/books?action=create" style="color: red">Create new Book</a></h3>
    <table border="1" class="table table-warning table-striped table-hover">
        <tr>
            <th><a href="/books?action=sort">Name</a></th>
            <th>Description</th>
            <th>Category</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${bookList}" var="book">
            <tr>
                <td><a href="/books?action=view&id=${book.id}">${book.name}</a></td>
                <td>${book.description}</td>
                <td>${book.getCategory().name}</td>
                <td><a href="/books?action=edit&id=${book.id}">Edit</a></td>
                <td><a href="/books?action=delete&id=${book.id}">Delete</a></td>
            </tr>

        </c:forEach>
    </table>
</div>
<div class="slides" align="center">
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="https://i.ytimg.com/vi/SpOcGsmGpQI/maxresdefault.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="https://sachnoi.com.vn/wp-content/uploads/2020/03/dac-nhan-tam.jpg" class="d-block w-100"
                     alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://i.ytimg.com/vi/Xi3KI6w536A/maxresdefault.jpg"
                     class="d-block w-100" alt="...">
            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
            <img src="https://chonlatot.com/wp-content/uploads/2020/02/nhung-cuon-sach-hay-nhat-moi-thoi-dai-chonlatot-com.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="2000">
            <img src="https://minhkietcafe.vn/wp-content/uploads/2020/09/cafe-sach-hay-o-ha-noi-1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="https://data2.1freewallpapers.com/download/macbook-camera-coffee-1280x720.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgVFhYZGBgaHBwcGhwcHRwcHx8hHh4aHBoaHBwcIy4lHCErHxgYJjgnKy8xNTU1HCQ7QDs0Py40NTEBDAwMEA8QHhISHjErISM0NDQ0NDE0MTQxNDQ0NDQ0NDQ0MTE0NDE0NDQ0NDQxNDQ0NDQ0NDQ0NDQ0NDQ0NDE0NP/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAQIDBQYABwj/xABAEAACAQIEAwYDBgQFBAIDAAABAhEAAwQSITEFQVEGImFxgZETobEyQlLB0fAUI2JyBxWS4fEWgqKyM8I0Q2P/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAAlEQACAgICAQQCAwAAAAAAAAAAAQIREiEDMUEEEyJRYXGRscH/2gAMAwEAAhEDEQA/ANnd0HkaVINBJxK0wEtlY8jPyodMZmYqmrDmdhPOuFyR3qEvJdFo0FNN6KGRXiAATzJ2p64EEy7ZvAaCqTk+iMYrsRseTooLnw1qn4zcvgK+RsoZWMCSACJ2rV2FUCAAB4aU261UoPtsWa8IynabDqyGOk15djcI7E5BoOdeyY20rnIQASDB8uVeZMnwr16w7AEPKHcFT3hp6xXS3cbRlxr5UzG4rCuh1mo0et3j8LZ+G7uRJBMCdI1mf3vWGsgZjG3Kpi7HOOLHgE9acb2QQohjzNG27P70oXGp31J20+RqqJDMHhsSRnDukbGWHrpyq+4V20xeFdBcYXUnUH7Uc4befOgLWNOhJJjYdJ50JxPEB0gwWzSDUxcrNJQjifQvD8ctxEuIcyOoZT4ETRqmsP8A4f4g/wAHaQnUA/NiR9a2Fp60aOVhNdSK1PJpARtpTBcrN9pu0z2nNq0neVQzuwOUAzAXYMRGpnSRoeQnBOPXHP8AM7wbYwANuRAjkd6dFYurNh8SlFyg7V0MJBmnzSJCQ4pTQbUqXCKBkuKuOEbIAWjugmBPKazWD7KIXN6+xvXSS0vqoJ/Cu2nyjSK0hekmkVGTiml5A/4MDeR4qSKntrAjNPnvUpM1CUjanZJ11JFZjjmJ+GMoMF/p+9K0btArA8cwvx7xdnYICAFBiQOR9da5/USUY91Z1ekg5T6uifCX0jU+HlUtjEDMY9DVbY4NkOdLjLPJhmAnwJ+tLh8BfR80K0khnLHblCwAvoDXlYxfTPWcvtGitAlc1VvG8Il5IiHGzRUd3HXLZPcZ18J/SPSaiXiouGMjrpMssem+pqo3DaJxUnTKPhGNKMcPcJVgTkB8fuz8xV3e1UjaqzjPC1uDMD31+y3MRqJ6ipcPii694Q4EMOh8PA7inyYzeS78mnEnD4vpdP8AwmwAi2NzM+tC4niORioV2jcrsD0+nvSXuJIihA4D6AnkvUk7T4b+FV13HkGEJK8jB16nfrTjwuW2iZ+ojHV/wRcQ4l8F2RXLhToYIn05VqOxuNdiP5RCkGSNZ10Mn1qLG9mviurBQve2A67knnW44bgltIEUDTfxPU12qKfRwS5KjvySER90n50x8TG8iilapPPWtMfo5svsBTFA7Uy/iI1oy9g0YbR4jQ1Q8VwlxFJRs46HQ/oazlkkaQxkxqYrNiLYIG7T5ZWrL/4ocMnJft6MNDA3HjR/Cr38wM2h1/Srri/DzfRk0IMcyPoK6uFfHZjzOp6PCrt52EMxjpVv2Y4Sb1wKAfGBOlX+J7A4nM2RQV5HMB9a1fZLsi2GBdnOcj7uUge43q0qZm5BeE7GIoEgHzAqp7WdjA1svbUBl5ARNeiYcGNTP78K5BMgjTx/SnZFs+bmtOvdkiNIovhvDXuuqKMxJ5Vtu3fFMKt1sPh8Oj4gEB7hHdSfugTDOJEzoPEyBW8E4riMN30YtGrW3VIcc4KDMh6HakkjVXI9I7P8AW3bVWRC0a90H8qv7WHUbKB6CheAcZtYqyt63sdGU7qw3U/rzo8tQ3Zk1vYqqB0rmao2emTNIDPf5M65sr51uO7utySSXMwrD7IHLSisFwtUGUfY/C2seR51bqD50rJ4RTsqyK3aA2EVIBSAGn5qkREwppNStrUbLQMTNSBq4qaaFoAmQ1zCmqacTQBW8Wv5EY+BisZhrkSCJrR9qGhRrEkf8V55f4wlpyT9qTtrttPpXD6qMptRXg9L0bjCDk/JtMM45iRRTFTtPlWHt9rl0CKzkzoBB20gedWGEv424CcqWwYgtJIHkPziuP2XFb1+zpc4t63+jRZQNRJHTlVfxDiSIe8D6AfrUI4Mxhr193HRe4p/06mpjg0SCqKD1gFvUnWk1FebLi230VtziFo6gtJ/CjN9NKyHaLHd/RHQxAzSoI6x68q29+6F1IljsOZP5CqrjXDxctkv9qVCxyJYDT3rThlGMk2h80JSg0mZHg3DWxDGXChYmd/+0Vr7fC0AiTWbThT230kRswq0TH3VENbzn8StE+nWujllKT+D0Y8HHGC+cdnry2Y9Kdm1qe4NDQ6NXSzzFsdekd4etPsYlSKcHEa7VneKXDZbNrkJ9j41MpY7LhHLRoLlzpVPxDFkDTWar04xPSOnPzoLH8REEk6ASahyydGq4sNsDuMWvKFyzGYzPpt61q0uOqAhVc6SJyjxiTWR7M8OxN12xGQhG+yTAnplB1IjntWxbRGDLMbjY/Wu2KqKRxcjuRaYZ8yZ2WJGw29Kbh7ytPdIjrHSiMMwKCNo5VJAOkCggSwAQCNjrUPEbjJausn21Ryv9wUlfnFEYdAohQAOQAiosQJkcjvQB804O4+fOrd8mSxOsnUtPM6mjsRfdGDNcznKR78qf2n4QbOIuIBADEr0ynUR9PSqhcOx3pb6N00enf4O32zYgT3CEIH9Ut+VenOaw3+HvB/hYf4hEFu94xyrTjFAmJ/WnRlJ3KywU09VoW04NFpFSxUL612Y04gU00DoUGnBajk0+aVhQpWKiY08moynjRY6OBpGWaUJ404CiwohnrTi1OZRSBB0osKMP2+LFJXSIrBYjhKIVe42YMCSF0M7jr+Ves9puHI9lyZBAJHn5GvLkvB1A5mCZ5Eb61z8zaejt9NCMo7LfhRS2gy21SefNtTzOu1aC1czLppIrM4HEtJDoQumXxjqPT51epiB1E153Jd7PRilWgi1ZO7MzdJ5eVJisQqiBqx2HM1RcT401liASxYd3umAdY1567jpUnZzDtBuODneTPKCZ9PKj22o5MnNZYhGBwDLLuc7nduQ/pUchQ3GbmVUkwDcQfOfyq7uuBWS7SXJewvMuGjwH/NPjuc9lSljB0WWIoUkUTeBM+VVueSdNiR7UkrN7o9SbHgiJqk/zpVMEwRp61nl4i/lQWKvrmzs0TvrXf8AOT2eSowibUcYB50l/Gq6lTrI2rBJxu0m7SPCabiO1qEZbaGT94/pTwkDlBdBeKxYtMRuAasux3DnxV03bg/k2yIU/fbcSPwjQ+MiszwThF7GXQAGyA9947qj8z4V7NwvCJaQW0EKogD6k9STW3Hx1tmHNzWqQdMVH9qRFSGqi/bdr6BXKgCWHXePPX6VschbWbYUQoAFPK0lpI5zTyKhspCKIpCgmYE03M3Qe9cM3Qe9MegLH8Ew96Ddso5GxYa+9CW+yeCVgy4ZARqPtfSYq8pDUjGKIEAQKrOI8LV9R3W6j/arQ0wii2JGb4bhLuZw9wwrZYG50BmTygir60sU1V1bz/IVKopItscKoV7WWQ7KwZEVzbZzEI+bKA4GqBtCpOh16GrnGYlbaM7mFUSeZ8gBqSToANSSBWV/6b+O73rrZLjgEqApgAQqsfvEDcjnOsRQ78BHHyXw7Q4fNGeFnLnPdQk7AMdx/V9nxq2ke9ZDgmPay/8AB4ltTpZcsYccrZPXTQnfY673D4JEOayyow1yE9xv7l+6d+8uvXNEU0Ekl0W1dQWE4kjyNVcGHQjVT6bg8mGh96n/AIgdG/0mgklrqgbER9xyNdh09aU3W5I3PoOnj4/KgCWkpqMSNRHhM0poAF4hazo69Qa8Rk2rz2z+IkTz1r3VxpXj3bnh2W8HGk5tR4EfrUSjlo24Z4uwK3jSJnrPlT8RxsIAxTMw2Pn48qpLuLYaECfxUEtksQDMT/z4Vj7Ku5HXL1Lqo9l9wi42KuH4znKskKNN+UjlGnWtrhnS2gQMzdMxk+AnoKxWBvC2Ao5UaOJ8prn5U5Ol19G/CklcnvyaTEYjTesXxnElsUgH3cvzbX5VYXuIaSToKpOGsGdrzGTm0B+Rp8PHjcn9BzSyqK8v+jXO+g9aqcQAGOu+tSLixUn8Cz96DrUwgzWc0jPITtJ96RknxohMI51CMR4KTV72R4WWxdoujKFbN3lMErqBrzmCPKvVxPEsL4R/hnduqHv3PhAicoGZ/WdF+dazhf8Ah1grJDMj3WHN20/0rCn1rWg+FIT+xrQZOTIrdpUUKihFGyqAAPIDakttqaW4fT6020ddo00HP1piJyeXpVVw13a8+bQKAvSTJJI02iNasjUbiGzATP7FAE966V5aAST0rlvSJzD0BNDtdBBQ6yO8dh86mtHugS3tUtDTHFz1/wDGkzHq3+mkIP8AX8q4gz973FAxQx6t7Ujv4t7UpU9G96aQejf6hQAup1B08RXLmnUiPUU3KZ+/5yDTUmd29QPy2qRobdaM0EDUanXkOVBYy64R3tsCwGmcFU8ZI12nWjLx3gkajYSdvlQ2JwocZHV3XnLAA+0UIb7PPeJ9oMUSq3Fw7ZIchMRlDHULJZoBUjNAnUA1X/8AVrBsxwwBiO7fB3318q2f+TYf4zp/D2iAqNDHQT8QNy11XX0o1eD4YCDZwoP9qn30oHaMDj+0qYhPhthiDplKsjMrdREGr3st21ECzi2+G4gJcdCM4nZzsG21Oh86vL3ZzCPBNu0J07qRJ05iIM1Q8Z7FWnQ/CdxzCZGZT0idRuaAtPRsMUSYvWmLOg7oCwHTdrZMbNup5GORIJWGxAuIrqbhDCZjL8jsZ5eFeWdm+0l3Av8Aw2JL/BBhTzTfqNUM+kCOlei8L0e6iZmWVuIMwACXQ8kQYMulxp/qqhNUWRtyNVfTYZtTr4Hx9Kb8PTVPHV+fTeka31TlpL/X2FMZf6bYjbM09J5fuKBBWGELEAa8jI8fLWdPCpDUeH0kd0Qdl8ddfenmpGc1ZztFwdboUxrr+X6VpKixFuQKF2Kzx/jHZ8oTpI8qoBnt6DVeh/KvdMRgVdIIrGcZ7LEyyiiUbNYclHn/APFIftKV8RqKZnTk/wAm/SrjEcBcE9w+1DrwdiTCyQYMawd4PTes/bN/dZWP32OU7iDO0eFF4LhxMAHSrzBdmrhiUrSYDs4VjNpTwfRPupO/JT8F4DmIkTW3w3BlCgRRWAwYQaCj5q1BI5580pMnNtQNFAHhULweQ0NCJxRYgsu3UHSgcRjGX7rFesQR5zWtGRfenvTXuAfeHkKrsNjkdQ0trplHX+1dfeig7xoAg/q39ht70UA4seSx4tv7b0wEAzmzHntUF4qd2L+C7ey/maFVyT3lAA+yJHrIGlFAWwukjuj16e+p9qR1IIJMx50KvErYbLmDMY0Xve8bepotmcjQAaef08KAGX7qMsE7+lOwqEKBqfHNv41E2EJQgQGI7syQDGm0aTUPBrDogS5lzCZMkzqSTr51LGiwZPD/AMqRh1A/1V2n9PpqacUP9PtSGIE5wPc+lIbZ/CvuaeA3Ue1NIb8Q9qAGuhIGg08TTEtwdiP+4/SpCG6j2/3pBm01HjoflUjRDiBvAJ22McuvSoWXTVVH9zn99KnvBTmzRGm5jrQ4ZRvkG5+yfDWmgkUnEHFq4l0/CCjuPGujEGfHKVnyLVcZwDo6f9qT+dJirIdcucAkCCqbGdSPn71R28bcwx+G+dkmVISNDyVj3R/aY8Dypgtl8bvR2jXZBp4bU60C33nEGdQADtpt5/OgW4ggjPcdZ17wCDf+sa6cwSKa/FLUQC7nX7BDk7TOSTG2tA6BO0HZS3iVOYtnjRiZ9x0rKdjOJthr4w99Wa2/ct3STlUW2cAAnQoHdxIOhI5Vf4G5cusfiEKhY90OQzLrAOsIIiYljJ2ovGdnrDglUtoYYQrlFJM9AQCNO9lO5BBGhn9FfhmnFpByXmP1FMZrf9Gs9OW/1rEdm+0Xwn/hbzKoDMqO41U6Ao5Bg6RlaToQCSIY7J70/ZcCBrCk+cdOdNOyXFphdt1Oqx6UpqDDOTmOYtsNVy8tSP3yqY0MBRUhGlRrTb9+BQgJUSmugoZcVTbmK8aZB16ynMCslwhkXimKsQIdLbgeKhVb1h19q0DYuSfKvLMXxwWeLG/uisqvzlSoV48pmOq0xpHsK2xyFcbYmltX1dVdCCrAFSOYOoIri1BI4tFMzUmXrXRQBNCTsNY+W1OZlYEGKr5dicq6DST+QmldSmp/2qqAhyhGITTNqSOsbxz8qnTX7rOfxNAX0B/IUNjEzgZdSTp6cz5UQbqQA7MCfugnU+mppgdiCQO86oPAT/7fpVXicMrgjLcfxJYD3JVemwqxJj7FsLzltD8pb3iq+/iwT3r0nogBP/3Y0IDsCgsjuoqk9CD7t1q3tYnbUfX18OlZ27iE1Krdd+rZvbvEAD0qBHun+gHlpHPQx9KKHVmwGMBaOmh2/ZqcPO3/ABWawt8DdvIeGu+ui/SrJOIBUbwEx5dOtJoRZB/H/wAaQserf6aHwNxmRS2eYG8A1OQej+4qCjixndvQUjMf6/YdK6DvlafMU0p4HbbNQAjE/wBfsPnTEcyJz+yx69K4r/T/AOdNUajSIP4/ypMY7EMBMx93cT15VD8Un756aJRFx4JME6DbU86Gk/8A9D7CiIMJ+Gx3dvTKI+VJiMKrgq5Yg7id6hAY/dfrGYDfypWQwe4SNjmfpEc9P9qYiufsyq//AA3btv8ApzllPmrflTLvBrrAq163rucjA68/txVoRoO6mhI1c/vcmmlFna2AN+o2B38Z38KB2yrt9m7AEuVdoALEgE+Z66Udbezb0lBAmNNvzohnAkyigzHdn326j3rL9q8dOTDo85gWuBVIOUAZV02zGdfA7RS6Grkyt7VYdMX/ADLVvNllbkHLnK6oEYKZYEkHSIJE70zsb2vd4wzultxC2wUZ80aZGJfMW8Z1+t7wS49m0qBGygSB3j9ojTXnLbfpWM7bcJJf+ItWriE6toQMwMgjpPUbGki39HpScVdJ+NaKoP8A9iSyDxdSM6DxhlHNhVmjggEEEESCDIIOxBG4rHdie1X8QiW7p/mQQrmBnygSCOVwaz+IDMOYF1dsNYLPZUlCSz2hrvq1y0OTcyg0bU/aMkIouC0UFinFMF9mVXRldGAZSNiCJBB5yKBxV4xBU0WNRsnZxyoV3M7UXYt9yTpUTgVaJIXfKjNzgmvCMVdZndmMsWJPmTrXt3FXPw3I/Ca8PxC99v7j9aJBE9R/wr43nRsK7HMktbmT3NAyzsMpIgaaN4V6DFfP/ZXiX8PirV2YUNDydMr91ifINPoK+gEcEAjUHUHlHI0kKSH5aWKRTSfEFMkVbwUaiPlQ2L4jbjKXTXqR9AZqrx3EcKxi44VuoIBoP+I4fbOZryueWZs0ei/pVUFFlaZtWDrtEQdRvOsa+FUT9oXS5lhoJ1OWI5T41W8c7U2z3bIJPIiQPmKy17i99zq5A6D9zTcki4x+z0x8QHAIV7s9SFQHxG0/6qGuYhzJJVAOQ2HmTp8hWKw9m9kzZ3C/3HX51LYtXrhy99/CSR86jMv26LjE8aVe6pdyOYzBffY+lV/+c3DqFIE6gDU+ZJou32ZxLaG3A5HMBRP/AEddHIGd5by/39qMmxfFFaONXfwDwkD9aKwWLvXnVGVskyQpCj66+VH2uxb/AHso6d4+taHh/Z+3a1yITtJJNLYriWWCtkIJUzzl5+dGC2vP6zUIQdEnnTkI0Hc9KCSTKnh701lSfuzvy96j9UjfamzIjMPHu/vwoAcxtj8Py8xTA9sn7p9P34V2eTox6xk38NajDEndxrtljx6UDJbrQTAnRdJjmeZoZUj7hH/f8vWibiAkgiRA09TQS5dV/lhZ2k6bjYwORFKIMlVZPeRQJJ+3OpiNPOKWz/agmBGaZM6zURZQCP5QUnYncA6E+oqRXVTr8PKDsoJIkSDptoJnwpiFlQYPwhEZp/Ka5ro1Oe2Ovdn97VMl9NYjQSYH7nnXLil0jNv+Fv0igZCl7Qw5MdE5kEj17pqisPOJvMWuEqEX7GpUBmA1EgSzx51pPj6EhWMGIgifKeXjWfx942sSLxRxbuqtu4xgBXUzaY66Kc7r5laARZLYMSXfw1AgaeHgN/Ghcfw5HRgxcyObtyAGwPhPrUrYp4n4bT0LKPz8vehcTingiLYYDm/hOwE0DML2c4ILiYjJIe3fYIQSDACkQeTA6g9a3vZ7jBuAWrul5RMxAdRoXUcmGgZeRIOxBrL/AOHl0kYiSvfvu0c9l1H9NX3GOGyPiJIZSGBXdWGzr4xII2IJB3qJaNIpPTLXBRavPakBLgN22NNDP81VHTMVfzduUUnE8UqjMFDbfUD86ouF8QfFXbauqq9lS1xlP9aZSg3GcJqDsrEcxWnxOERkbTp9QaIuxSWPZVWsQz7k/lROTqPf9KfZRRoPYCi2UASYHnFaIzkzP8aR2RgBOh8BXivEki4w8a9z4ljrZDILqF8s5Q65o2mJmK8Nx7ZrrkbZjr5aUSHEDr6A7P8AF1fB2r7wkoC5buiV0Y6n7MgkGdq8Cy0bf4jca0lgv/LScqDQSSSS3UyTSTBqz1rjfbnDWlOS4Lr8lQhh6sO6B615zje3GMdywuZByVQIA8yJPnVAiFqJGBPX6UWwxSPTsH2CWJuXGn+kD86IPYGzyuP8v0rX5xpqKkArQzyZj07CWBu7n1A/Kik7HYcEQjEjqZrT5KdZigMmAYbg6j7SgiNqscNg0X7KhfSpQx2/SR71IGqKHk2Mayu8Cd6QIOg+VTbioEaTB5eH50xD8g6CKUIOgppHT2P1+tIG1AmdKBWOKdI9qa6kaz8hSiZ8OtdeeKVDsYW8TPl12qFpjd/QD3jlUtq/m5HzqQmkUCPJ5P13A9KjZCT9ljHV/wBzRbuBuRULYlPxD3/fUUDQl9okzGg1ieZ5UGrqdM66DfJ086OcSSJI0Go8zQRdtsziJ+501EaRy+dKIM74w/Gnoh6+dSNd0kPy5IeoAPprUyXxtDcvunnrSDFaTkflpl8D+lMCJrxOzvOmydInlzrmY9bhkAmBHKIGgg+H61McUYkI530iNo6+fyNct9j9xhpIkj23oAGgmO7dJ3EsAN43nTQmmYjBhwyvYlXkMC+hDDWQDEE/lRXx35oAI5uN9fDbamPiXGp+GoMbsTv6dQaAMziMBew6nNb+Pa3Uhme4g/C6kj4igH7Q73VTvUC8QtuhKPh5A0BJDDQDVXAYaCIjkK1T4rTW4g/tGaNp35VR9oOEJdR2AY3AhIZEykmCVkjUzIEa1I0/spuwOIRMOc7jMXdsiqS+rbwssdulaTE4l3GVf5Sn7zQXP9qahfNtf6aouw3BWGHtZ/4hGl8yaKglmI0InaPWteeEWzuCfEk0Oyk0Zrs9wsriXuh2KiQAdZJ3E815685rWYpv5bnoKS3gktrCCBNQcQuRZuHojH2BNEVQTlk7A7eJg1V9r+GWcVahzluIDkf8JO4Yc1MCR7UAvFTyEfX1NVPEuIu8ifQbVo9ERjbPPsXhGtuUYAEHlqD4g1EGrQ4zDZwZqkXDsWywZnpUWaURg0pWN/aprlkjVQfX9KYuHM97ShbCUaH2pjTnRWHwd91zLZdxtmCSD60NcupEAN5kn6Vb4Ttvi7aKiuuVRAlFJjziqJPRlzhgxxar3TMlCC0CO7P2RHnvUuGx19Q5N228vCEldtNysDr5dTR3/TmFXbDWwf7F/Smf5FhZ/wDx7U/2L+lWRl+A5OIPA/8AjJjUB/LaR0n2pt/G5e8confXNt5Uz+Ctja2kf2r+lDth0HdVEWdNFUfSgkJHHUB1dB/q/fSjsNxRH+y2Y67DT3rNXuAWyZjTShbnAQkFCQZ2BOnj5UUh0jfWr0/7114EjSsdgWa3p92YgkwCOYnlzq/wfEM0BvX50nETRZAyKVRr6VAMRJ5UxrrBiAQRG3vzooAhm9v341U47FRpoAf3O+tT3HMEHvT15aGhriqsaDQFp8SD77iihIh4fc7zEJI/Fngba6T4dKtwiRqAJ3kzVJwlLeXXJqZ3FXLPbETl8NB++VQaMa7W10OX5Uz46DUAnyX/AGp74pAY59Ap6x0poxE7I/qI+tADr/Pc93kYO/XlQmUjQLdHPRgemm9E39ZGn2ee2/OhAm3cXX8LkdBy3qYjZIJna8deojfzpyWzG13eNXgjbXQ60wWSMpyNPPv66RE6wdJ9vGsLgOMvcxl66GYWE/lohZirQdW33JB18YpykkrZXHxym6XZvHsH8DnXm/8Av4U17c/atjfSX6xPWNfpXZRoyoo5glzOvh5ae9I6KsqVtLtueRnXUb6fI0yaGsgJMra2+8xbmTsdN6VHGsNaAEDRCdSJ3mN5rkcDvTbHeglUJmZkTzOs04XTB77Hplt+I2kGd/rQBy3TJh3PPS34cpHh86c+Yna7A6FVmdddoImKfbw5IDF39SBv4RI8qkOCQ/azHzdv1oEMwyNmBKP5l5HhpOtWAFDJZtiNt9NZ196KFADbv2TVXxJZs3BzyP8A+pq0ubGgmEggzBBmN9uUUkDPM1VzuD5AV38K55e/6Vu7nDkCZgLjGNBmMnw1Onmaq0wtsgDKykyInUQY1Ykk7b1poLM9a4PJ1NX1nhqhIgbaCPyriQphRr71ZYN13beiiW2eOcWwjrddSdmPtQAwz8pr0ztvwEufjJCmIgbnxjnXn9y3dXRgRUtGidgJw55mmfCqxwGFF24tsKzMx+6RI6kzpFaR+wLzpc08qKE3R6+6AidulVmNu3E3VfPNH5eVLXVZmMRrhSWyTO4JAjn61VXMKxuozhN5UhydIOiqfTWurqBotrTyADvUywfMj6f8V1dQSyHE4cHU9B/zQotkEwdCNI0HvXV1Aw7C3CIOnroOdSq/fOu4G09Tt711dQBzDQj1386A4k+VGOghNztJy711dQC7GcKy5dDaGnJZOm89as0u798eGVD5866urMtiFjGhc8tFy8xJEjTf5VA682SNPvvp6gb11dQCC3YAydsvyoNyp2+EVmQCY2jXQb0tdUoqRVcYxyD+WoSSoLFdY3Ag+X1rOFBK20gFiAOQ18q6urnluWz1eKKhwZLs24tqFA/kzGoMHz5SZNOa4CSc9sTMEKSfr0Brq6uo8oebx2Dty+zb6DvRIP7FK2YkCbpgRpCg6b0ldQIb8Mk5ijaa99/GRsfM+FSJaWYyW4HLMSdPCOhJrq6gRIoA2+F+c/8ANWE0tdQBE7UFNdXUkDK25w5VUOy3GYuCyo7EdD3SYyiDoOsa0LZyWmf4ltLaAgqzuGM6wQswPL60ldVsUdopeJ8fsvcIR1BOmYzl9J2HsKTAY0mSjqx5kMGb0HIV1dWc5tFwimXlq8oEEFmO5P6n8qq8XZts3eVSegikrqqMnJbCUVF6H4PCKhlVAmrO2xiurq0M2f/Z" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://www.teahub.io/photos/full/190-1906053_studying-history.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/proxy/Z5Nda7Envk0nzNV5aYnqH9VhW6bMZp_lVeaVxsltMN4NOMaNrQ5Q7NixZ-JHka89ftmwcXTgzE-UpXMX-36brfOvQzfTm2IQuBN8eGYqLFl2dCiTCahzWfXG5qp_1eLdYJG6" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>

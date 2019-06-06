(function () {
    var root = this;

    var Social = function (obj) {
        if (obj instanceof Social) return obj;
        if (!(this instanceof Social)) {
            return new Social(obj)
        };
        this._wrapped = obj;
    };

    root.Social = Social;

    if (typeof $ !== 'undefined') {
        Social.$ = $ = root.$;
    }   

    //글로벌 변수설정
    var $domain = document.domain;

    //기본설정
    var $config = {};

    Social.config = function (config) {
        $config = config;
    }

    // 회원가입 후 이력서 등록 페이지로 이동하도록
    var iframe = false;

    Social.iframe = function () {
        iframe = true;
        return iframe;
    }

    //***************************************** 네이버 *********************************** //
    Social.naver = function (selector, callbackUrl) {
        this._naverselector = selector;
        this.naverStart(callbackUrl);        

        this.MemExists(function (res) {
            if (!res) {
                alert('존재하지 않는 계정 정보입니다.');
                window.location.href = '/Login/Logout.asp';
            }
        });
    };

    Social.naverStart = function (clb) {
        var obj = this;
        var re_url = Social.getParams()['re_url'] || "";
        var error = Social.getParams()['error'] || "";
        var oemNo = Social.getOemNo();

    //alert(re_url);
    if (re_url == "") {
      re_url = encodeURIComponent("/user/mypage");
    }

        if (error == "access_denied") {
            window.close();
        }

        if (oemNo && !re_url) {
            re_url = Social.getOemReturnUrl(oemNo);
        }

        if (re_url) {
            re_url = "?Re_Url=" + re_url;
        }

    //if (decodeURIComponent(re_url).indexOf("https:")) {
    //  re_url = re_url + encodeURIComponent("&ishttps=1");
    //} else {
    //  re_url = re_url + encodeURIComponent("&ishttps=0");
    //}

        if (oemNo) {
            re_url += Social.makeParams("oem_code", oemNo, re_url);
        }

        var callbackUrl = obj.getPcDomain() + clb + re_url;

        this.naver_id_login = new naver_id_login(obj.getNaverClientId(), callbackUrl);
        var state = this.naver_id_login.getUniqState();
        this.naver_id_login.setButton("white", 3, 40);
        this.naver_id_login.setDomain(".jobkorea.co.kr");
        this.naver_id_login.setState(state);
        this.naver_id_login.setPopup();
        if (this.naver_id_login.getAccessToken()) {
            this.naver_id_login.get_naver_userprofile('Social.naverCallback()');
        }        
        $(document).on("click", this._naverselector, function (e) {            
            obj.MemExists();
            var token = obj.generateState();
            obj.naver_id_login.login();            
        });

    }
    // 2018-09-11 LMJ
    // Naver는 실섭앱은 www,m 도메인만 가능
    // 나머지는 전부 테섭ID
    Social.getNaverClientId = function () {        
        var clientId = "rnFGkEdmw21IFaUBnMEC";    
        var obj = this;
        var serverName = obj.getPcServerName();
        // real 서버 아닐 때만 개발 키 연결
        if (serverName !== 'real') {
            $.ajax({
                url: '/net/SLSNS/GetSNSKey',
                data: { sns: 'naver' },
                type: 'GET',
                async: false,
                cache: false
            }).done(function (id) {
                clientId = id;
            }).error(function (err) {
                clientId = '';
            });

            if (clientId === '') {
                if (serverName == 'local') {
                    clientId = 'Wn2tPvCxVCUoFmgL3dgY';
                } else if (serverName == 'test') {
                    clientId = 'Hhg7RnD9buL9n2DIqILK';
                } else if (serverName == 'test104') {
                    clientId = 'HuGqhtB3HkEAd1ynuG5y';
                } else {
                    clientId = 'rnFGkEdmw21IFaUBnMEC';
                }
            }
        }
        return clientId;
    }    

    Social.naverCallback = function () {
        var obj = this;
        var id = this.naver_id_login.getProfileData('id');
        var email = this.naver_id_login.getProfileData('email');
        var name = this.naver_id_login.getProfileData('name');
        var gender = this.naver_id_login.getProfileData('gender');
        var re_url = this.naver_id_login.re_url || "";
        var token = encodeURIComponent(this.naver_id_login.getAccessToken());

        var oemNo = Social.getOemNo();

        // 이름 확인
        if (typeof name === 'undefined') {
            name = '';
        }
        // 이메일 확인
        if (typeof email === 'undefined') {
            email = '';
        }

        var data = { Acstkn: token, Id: id, Name: name, Gender: gender, Email: email, Mem_Type: "JK", RE_URL: re_url };

        if (oemNo) {
            data.oem_code = oemNo;
        }

        if (id) {
            if (typeof $config !== 'undefined' && $config.connect === true) {
                obj.load("/naver/isConnect", "GET", { id: id }).done(function (response) {

                    if (response.return_code > 0) {
                        obj.load("/join/M_EasySns_Regist", "GET", { Sns_Id: id, Acstkn: token, Sns_Code: "NV", email: email }).done(function (res) {
                            if (res.return_code == 1) {
                                opener.parent.Social.easyConnectText.call($(".btnNvConnect", opener.parent.document), ".connectNVText", "btnNvDissConnect", res.return_date);
                                self.close();
                            } else {
                                //연동실패
                                alert(res.return_msg);
                            }
                        });
                    } else {
                        alert(response.return_msg);
                        if (window.opener) {
                            self.close();
                        }
                    }
                });
            } else {
                obj.load("/naver/isjoin", "GET", { id: id, email: email }).done(function (response) {
                    var hostname = $(location).attr('hostname');
                    var params = "?RE_URL=" + re_url + "&acstkn=" + token + "&key=" + email + "&snscode=NV&uid=" + id + "&name=" + name + "&gender=" + gender;

                    if (oemNo) {
                        params += "&oem_code=" + oemNo;
                    }

                    if (response.return_code > 0) {
                        Social.FacebookPixel('AddPaymentInfo', function () {
                            obj.naverLogin(id, token, re_url, email);
                        });
                        
                    }
                    else if (response.return_code == -1) {
                        Social.FacebookPixel('InitiateCheckout', function () {
                            obj.naverJoin(data, obj.iframe());
                        });
                        
                    }
                    else if (response.return_code == -2) {
                        location.href = "https://" + hostname + "/Login/M_Login_Conn_Id" + params;
                    }
                    else {
                        alert(response.return_code);
                    }

                });
            }
        }
    }

    // TVC 광고유입 (2019 TVC 종료 후 삭제)

    //쿠키값 얻기
    function getLayerCookie(name) {
        var nameStr = name + "=";
        var nameLen = nameStr.length;
        var cookieLen = document.cookie.length;   //쿠기값이 없을시 기본적으로 45이다.  document.cookie.length >= 45

        //  a로 지정시 : document.cookie ==> lucya=a; ASPSESSIONIDQGQQGLDC=GKDDHCPDJBOBAONCMJLHBCCN
        var i = 0;
        while (i < cookieLen) {
            var j = i + nameLen;
            if (document.cookie.substring(i, j) == nameStr) {
                var end = document.cookie.indexOf(";", j); // ;의 위치   
                if (end == -1) end = document.cookie.length;
                return unescape(document.cookie.substring(j, end)); //쿠키값 반환
            }
            i = document.cookie.indexOf(" ", i) + 1;
            if (i == 0) {
                break;
            }
        }
    }

    //쿠키 삭제
    function deleteCookie(cookieName) {
        var expireDate = new Date();
        //어제 날짜를 쿠키 소멸 날짜로 설정한다.
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + ";path=/;domain=albamon.com;";
    }

    var mCookie = document.cookie;
    var cName = getLayerCookie("LayerName"); 

    //네이버회원가입
  Social.naverJoin = function (data, isIframe) {
        var agreeStat = 0;
        var oemNo = Social.getOemNo();

        if (oemNo && oemNo.indexOf("#") > -1) {
            oemNo = oemNo.split('#')[0];
        }

        if (!confirm('네이버 로그인으로 잡코리아를 시작할까요? \n\n회원가입 시, 잡코리아의 이용약관과\n개인정보처리방침에 따라 정보가 관리됩니다.')) {
            //alert("간편");
            window.close();
            return;
        }
        agreeStat = confirm('혹시, 놓치고 있지 않으세요? \n\n채용정보, 이벤트 정보에 수신동의 하시겠어요?') ? 1 : 0;
        var reurl = Social.DecodeUrl(data.RE_URL);

        // TVC 이벤트용 레이어 유입 (2019 TVC 종료 후 삭제)
        if (mCookie.indexOf("ClickLayer=done") > 0) {
            if ((mCookie.indexOf("MainLayer=done") > 0) && (cName != null && cName != "")) {
                var reurl = "/User/Resume/Write?cmpid=" + cName;
            }
            else {
                var reurl = "/User/Resume/Write";
            }
        } else {
            deleteCookie("ClickLayer");
            var reurl = "/User/Resume/Write";
        }
        

        if (this.getOemReturnUrl(oemNo) != "") {
            reurl = this.getOemReturnUrl(oemNo, true);
        }

        var qstring = Social.getPcDomain() + "/Join/M_NV_Regist?Id=" + data.Id + "&Acstkn=" + encodeURIComponent(data.Acstkn) + "&Re_Url=" + encodeURIComponent(reurl);
        qstring += "&Name=" + encodeURIComponent(data.Name) + "&Gender=" + data.Gender + "&Email=" + data.Email + "&isIframe=" + isIframe + "&agree=" + agreeStat;

        if (oemNo) {
            qstring += "&oem_code=" + oemNo;
        }

        //location.href = qstring;
        if (typeof isIframe !== 'undefined' && isIframe !== "") {  //iframe실행됐을 때
            if (opener == null) {
                //alert("레이어에서 뜰 때 1");
                parent.location.href = qstring;
            } else {
               // alert("레이어에서 뜰 때 2");
            opener.location.href = qstring;
            self.close();
            }
        } else {
            //소셜 간편 로그인 창 하나 더 뜰 때
            if (opener == null) {
               // alert("본창에서 뜰 때 1");
                parent.location.href = qstring;
            } else {
              //  alert("본창에서 뜰 때 2");

                opener.location.href = qstring;
                self.close();
            }
        }
    }

    //네이버회원체크
    Social.naverJoinCheck = function () {
        var that = this;
    var id = this.naver_id_login.getProfileData('id');
        this.load("/naver/isjoin", "GET", { id: id }).done(function (response) {
            return response.return_code;
        });
    }

    //네이버로그인
  Social.naverLogin = function (id, token, reurl, email) {
        var reurl = reurl;
        if (!id) {
            alert('네이버 고유아이디를 가져오지 못했습니다.');
            return;
    }

    location.href = "/Login/M_Login/Naver?Id=" + id + "&Acstkn=" + token + "&email=" + email + "&Re_Url=" + encodeURIComponent(reurl);
    //self.close();
    }

    //***************************************** 네이버 *********************************** //

    //****************************************** 구글 ************************************ //
    Social.google = function (selector) {
        this.googleUser = {};
        this._googleselector = selector;
        this.googleStart();
    };
    // google 인증 후
    Social.googleSignInChanged = function (auth) {
        var user = auth.currentUser.get();
        if (typeof user.getBasicProfile() !== 'undefined') {
            var token = user.getAuthResponse().access_token;
            var email = user.getBasicProfile().getEmail();
            var id = user.getBasicProfile().getId();
            var name = user.getBasicProfile().getName();
            var gender = 0;
            var re_url = Social.getParams()['re_url'] || "";
            var oemNo = Social.getOemNo();

            if (oemNo && !re_url) {
                re_url = Social.getOemReturnUrl(oemNo);
            }

            var data = { Acstkn: token, Id: id, Name: name, Email: email, Mem_Type: "JK", RE_URL: re_url };

            if (id) {
                if (typeof $config !== 'undefined' && $config.connect === true) {
                    Social.load("/google/isConnect", "GET", { id: id }).done(function (response) {
                        if (response.return_code > 0) {
                            Social.load("/join/M_EasySns_Regist", "GET", { Sns_Id: id, Acstkn: token, Sns_Code: "GL", email: email }).done(function (res) {
                                if (res.return_code == 1) {
                                    Social.easyConnectText.call($(Social._googleselector), ".connectGLText", "btnGlDissConnect", res.return_date);
                                    //연동성공
                                } else {
                                    //연동실패
                                    alert(res.return_msg);
                                }
                            });
                        } else {
                            alert(response.return_msg);
                            if (window.opener) {
                                self.close();
                            }
                        }
                    });
                } else {
                    Social.load("/google/isjoin", "GET", { id: id, email: email }).done(function (response) {
                        var hostname = $(location).attr('hostname');
                        var params = "?RE_URL=" + re_url + "&acstkn=" + token + "&key=" + email + "&snscode=GL&uid=" + id + "&name=" + encodeURIComponent(name) + "&gender=" + gender;

                        if (oemNo != "") {
                            params += "&oem_code=" + oemNo;
                        }

                        if (response.return_code > 0) {
                            Social.FacebookPixel('AddPaymentInfo', function () {
                                Social.googleLogin(id, token, re_url);
                            });
                        }
                        else if (response.return_code == -1) {
                            Social.FacebookPixel('InitiateCheckout', function () {

                                data.RE_URL = Social.getOemReturnUrl(oemNo, true);
                                Social.googleJoin(data);
                            });

                        }
                        else if (response.return_code == -2) {
                            window.open("https://" + hostname + "/Login/M_Login_Conn_Id" + params, "popup", "width = 500,height=590,left=0,top=0, toolbar=no,location=no,directories=no,status=no,menubar=no, resizeable=no,copyhistory=no");
                            //location.href = "https://" + hostname + "/Login/M_Login_Conn_Id" + params;
                        }
                        else {
                            alert(response.return_code);
                        }
                    });
                }
            }
        }
    };
    Social.googleStart = function () {
        $(document).on("click", this._googleselector, function (e) {
            Social.MemExists();

            gapi.load('auth2', function () {
                auth2 = gapi.auth2.init({
                    client_id: '751392317978-jjc5ov9kf0tgnr4anlbe2crbfjk3it1c.apps.googleusercontent.com',
                    fetch_basic_profile: true,
                    cookiepolicy: 'single_host_origin',
                    scope: 'profile'
                });
                // Sign the user in, and then retrieve their ID.
                auth2.signIn().then(function () {
                    Social.googleSignInChanged(auth2);
                });
            });
        });
    };

    //구글회원체크
    Social.googleJoinCheck = function (id) {

        this.load("/google/isjoin", "GET", { id: id }).done(function (response) {
            return response.return_code;
        });
    }

    //구글회원가입
    Social.googleJoin = function (data, isIframe) {
        var agreeStat = 0;
        var oemNo = Social.getOemNo();

        if (!confirm('구글 로그인으로 잡코리아를 시작할까요? \n\n회원가입 시, 잡코리아의 이용약관과\n개인정보처리방침에 따라 정보가 관리됩니다.')) {            
            return;
        }
        agreeStat = confirm('혹시, 놓치고 있지 않으세요? \n\n채용정보, 이벤트 정보에 수신동의 하시겠어요?') ? 1 : 0;
       // var reurl = Social.DecodeUrl(data.RE_URL);
        var reurl = "/Text_User/Resume/Resume_Step1.asp";

        if (this.getOemReturnUrl(oemNo) != "") {
            reurl = this.getOemReturnUrl(oemNo, true);
        }

        var qstring = Social.getPcDomain() + "/Join/M_GL_Regist?Id=" + data.Id + "&Acstkn=" + encodeURIComponent(data.Acstkn) + "&Re_Url=" + reurl;
        qstring += "&Name=" + encodeURIComponent(data.Name) + "&Gender=" + data.Gender + "&Email=" + data.Email + "&agree=" + agreeStat;

        if (oemNo) {
            qstring += "&oem_code=" + oemNo;
        }

        if (typeof isIframe !== 'undefined') { //소셜간편로그인
            if (opener == null) {
             //   alert("1");
                parent.location.href = qstring;
            } else {
             //   alert("2"); //홈 > 간편로그인 a
            opener.location.href = qstring;
            self.close();
            }
            //opener.location.href = qstring;
            //self.close();
        } else { //등록된 메일 없을 때
            if (opener == null) {
              //  alert("3");
                parent.location.href = qstring;
        } else {
             //   alert("4");
                //  alert("본창에서 뜰 때 2");
                if (typeof opener.location.href !== 'unknown') {
                opener.location.href = qstring;
                self.close();
                } else {
                    window.location.href = qstring;
                }                
            }

            //location.href = qstring;
        }
    }

    //구글로그인
    Social.googleLogin = function (id, token, reurl) {
        var reurl = reurl;
        location.href = Social.getPcDomain() + "/Login/M_Login/Google?Id=" + id + "&Acstkn=" + token + "&Re_Url=" + encodeURIComponent(reurl);
    }
    //****************************************** 구글 ************************************ //


    //***************************************** 카카오 *********************************** //
    Social.kakao = function (selector) {
        this._kakaoselector = selector;
        this.kakaoStart();
    }
    Social.kakaoStart = function () {
        var obj = this;
        var clientId = '570f835c538b328e7401aa1c452a6dc9';
        var serverName = obj.getPcServerName();
        // 2018-09-11 LMJ
        // real 서버 아닐 때만 개발 키 연결
        if (serverName !== 'real') {
            $.ajax({
                url: '/net/SLSNS/GetSNSKey',
                type: 'GET',
                data: { sns: 'kakao' },
                async: false,
                cache: false
            }).done(function (id) {
                // jts1~, stg1~ 만 id를 가짐
                if (id !== '') clientId = id;
            }).error(function (err) {

            });
        }
        Kakao.init(clientId);
        $(document).on("click", obj._kakaoselector, function (e) {
            obj.MemExists();
            obj.kakaoAuth(this);
        });
    }

    Social.kakaoAuth = function ($this) {
        var obj = this;
        Kakao.Auth.login({
            success: function (authObj) {
                Kakao.API.request({
                    url: '/v1/user/me',
                    success: function (data) {
                        var nickname = "";
                        var id = "";
                        var kakao = "kakao";
                        var email = "";
                        var gender = "";
                        var token = "";

                        if (data !== undefined) {
                            id = data.id;
                            email = "";
                        }
                        if (data.properties !== undefined) {
                            nickname = data.properties.nickname;
                        }

                        if (nickname != "") {
                            nickname = encodeURIComponent(nickname);
                        }
                        token = authObj.access_token;

                        var re_url = Social.getParams()['re_url'] || "";
                        var oemNo = Social.getOemNo();

                        if (oemNo && !re_url) {
                            re_url = Social.getOemReturnUrl(oemNo);
                        }

                        var data = { Acstkn: token, Id: id, Name: nickname, Gender: gender, Email: email, Mem_Type: "JK", RE_URL: re_url };
                        if (id) {
                            if (typeof $config !== 'undefined' && $config.connect === true) {
                                obj.load("/KkaTalk/isConnect", "GET", { id: id }).done(function (response) {
                                    if (response.return_code > 0) {
                                        obj.load("/join/M_EasySns_Regist", "GET", { Sns_Id: id, Acstkn: token, Sns_Code: "KA", email: email }).done(function (res) {
                                            if (res.return_code == 1) {
                                                obj.easyConnectText.call($this, ".connectKAText", "btnKaDissConnect", res.return_date);
                                            } else {
                                                //연동실패
                                                alert(res.return_msg);
                                            }
                                        });
                                    } else {
                                        alert(response.return_msg);
                                        if (window.opener) {
                                            self.close();
                                        }
                                    }
                                });
                            } else {
                                obj.load("/KkaTalk/isjoin", "GET", { id: id }).done(function (response) {
                                    var hostname = $(location).attr('hostname');
                                    var params = "?RE_URL=" + re_url + "&acstkn=" + token + "&key=" + email + "&snscode=KA&uid=" + id + "&name=" + name + "&gender=" + gender;

                                    if (oemNo) {
                                        params += "&oem_code=" + oemNo;
                                    }

                                    if (response.return_code > 0) {
                                        Social.FacebookPixel('AddPaymentInfo', function () {
                                            obj.kakaoLogin(id, token, re_url); //로그인
                                        });
                                    }
                                    else if (response.return_code == -1) {
                                        Social.FacebookPixel('InitiateCheckout', function () {
                                            obj.kakaoJoin(data, obj.iframe()); //회원가입
                                        });
                                    }
                                    else if (response.return_code == -2) {
                                        window.open("https://" + hostname + "/Login/M_Login_Conn_Id" + params, "popup", "width = 500,height=590,left=0,top=0, toolbar=no,location=no,directories=no,status=no,menubar=no, resizeable=no,copyhistory=no");                                        
                                    }
                                    else {
                                        alert(response.return_code);
                                    }
                                });
                            }
                            
                        }
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error));
                    }
                });

                //alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                //alert(JSON.stringify(err));
            }
        });
    }

    //카카오회원체크
    Social.kakaoJoinCheck = function (id) {
        this.load("/KkaTalk/isjoin", "GET", { id: id }).done(function (response) {
            return response.return_code
        });
    }

    //카카오회원가입
    Social.kakaoJoin = function (data, isIframe) {
        var agreeStat = 0;
        var oemNo = Social.getOemNo();

        if (!confirm('카카오 로그인으로 잡코리아를 시작할까요? \n\n회원가입 시, 잡코리아의 이용약관과\n개인정보처리방침에 따라 정보가 관리됩니다.')) {            
            return;
        }

        agreeStat = confirm('혹시, 놓치고 있지 않으세요? \n\n채용정보, 이벤트 정보에 수신동의 하시겠어요?') ? 1 : 0;

        //var reurl = Social.DecodeUrl(data.RE_URL);
        //var reurl = PathInfo.jkURLHttps + "/Text_User/Resume/Resume_Step1.asp";

        var reurl = "/Text_User/Resume/Resume_Step1.asp";

        if (this.getOemReturnUrl(oemNo) != "") {
            reurl = this.getOemReturnUrl(oemNo, true);
        }

        var qstring = Social.getPcDomain() + "/Join/M_KA_Regist?Id=" + data.Id + "&Acstkn=" + encodeURIComponent(data.Acstkn) + "&Re_Url=" + reurl;
        qstring += "&Name=" + data.Name + "&Gender=" + data.Gender + "&Email=" + data.Email + "&agree=" + agreeStat;

        if (oemNo) {
            qstring += "&oem_code=" + oemNo;
        }

        //location.href = qstring;
        if (typeof isIframe !== 'undefined' && isIframe !== "") {  //iframe실행됐을 때
            if (opener == null) {
            //    alert("카카오1"); // ie 홈 > 간편로그인 x > a
                parent.location.href = qstring;
            } else {
              //  alert("카카오2"); // 즉시지원 > 회원가입 > 카카오
                opener.top.location.href = qstring;
                self.close();
            }
        } else {
            if (opener == null) {
            //    alert("카카오3");
                parent.location.href = qstring;
        } else {
             //   alert("카카오4");
                opener.top.location.href = qstring;
                self.close();
            }
        }


    }

    //카카오로그인
    Social.kakaoLogin = function (id, token, reurl) {
        var reurl = reurl;
        location.href = Social.getPcDomain() + "/Login/M_Login/Kakao?Id=" + id + "&Acstkn=" + token + "&Re_Url=" + encodeURIComponent(reurl);
    }

    //카카오로그아웃
    Social.KakaoLogout = function () {
        Kakao.Auth.logout();
        Kakao.API.cleanup();
    }
    //***************************************** 카카오 *********************************** //

    //***************************************** 페이스북 *********************************** //
    Social.facebook = function (selector) {
        this._facebookselector = selector;

        this.FacebookStart();
    }

    Social.dissConnect = function (selector, selectortext, snscode, context) {
        var args = arguments;
        var obj = this;
        var snsname = "";

        if (snscode == "FB") {
            snsname = "페이스북";
        }
        else if (snscode == "NV") {
            snsname = "네이버";
        }
        else if (snscode == "GL") {
            snsname = "구글";
        }
        else if (snscode == "KA") {
            snsname = "카카오톡";
        }
        else {
            snsname = "소셜";
        }

        $(document).on("click", selector, function (e) {
            var $this = this;
            var confirmTxt = snsname + " 아이디 연결을 해지할까요?";
            if (!confirm(confirmTxt)) {
                return;
            }
            obj.load("/join/M_EasySns_UnRegist", "GET", { Sns_Code: snscode }).done(function (response) {
                if (response.return_code == 1) {
                    if (typeof context === 'function') {
                        obj.easyDisConnectText.call($this, selector, selectortext);
                        var clss = selector.replace(/[\.\#]/gi, "");
                        $($this).removeClass(clss);
                        context.apply(context, $($this));
                        alert("간편로그인 연동이 해제되었습니다.");
                    }
                } else {
                    alert(response.return_msg);
                }
            });
        });
    }

    Social.FacebookStart = function () {
        fncSNSDelCookie('fb_reurl');
        fncSNSDelCookie('fb_oemno');

        $(document).on("click", this._facebookselector, function () {
            Social.MemExists();
            var params = "";
            var oemNo = Social.getOemNo();
            if (window.location.href.split("?")[1] !== undefined) {
                params = "&" + (window.location.href.split("?")[1]);
                // reurl 캐쉬 저장
                var objUrlParam = this.getUrlParams();
                var fb_re_url = objUrlParam.RE_URL;

                if (objUrlParam.OEM_CODE && !fb_re_url) {
                    fb_re_url = Social.getOemReturnUrl(oemNo);
                }

                if (fb_re_url) {
                    fncSNSSetCookie('fb_reurl', fb_re_url, 1);
                }

                if (objUrlParam.OEM_CODE) {
                    fncSNSSetCookie('fb_oemno', objUrlParam.OEM_CODE, 1);
                }
                
            }

            if (typeof $config !== 'undefined' && $config.connect === true) {                
                //window.open("/FaceBook/GetLogin?Acstkn_Type_Code=4&Redirect_Stat=Y" + params, "FaceBookLogin", "width=500,height=300");
                window.open("/FaceBook/GetLogin?Acstkn_Type_Code=4", "FaceBookLogin", "width=500,height=300");
            } else {
                window.open("/FaceBook/GetLogin?Acstkn_Type_Code=4", "FaceBookLogin", "width=500,height=300");
            }
            
        }.bind(this));
    }


    Social.FacebookJoin = function (data) {
        var agreeStat = 0;
        var oemNo = Social.getOemNo();
        //var reurl = Social.DecodeUrl(data.RE_URL);
        if (!confirm('페이스북 로그인으로 잡코리아를 시작할까요? \n\n회원가입 시, 잡코리아의 이용약관과\n개인정보처리방침에 따라 정보가 관리됩니다.')) {            
            return;
        }
        agreeStat = confirm('혹시, 놓치고 있지 않으세요? \n\n채용정보, 이벤트 정보에 수신동의 하시겠어요?') ? 1 : 0;
        var reurl = "/Text_User/Resume/Resume_Step1.asp";

        if (this.getOemReturnUrl(oemNo) != "") {
            reurl = this.getOemReturnUrl(oemNo, true);
        }

        var qstring = Social.getPcDomain() + "/Join/M_FB_Regist?Acstkn=" + encodeURIComponent(data.Acstkn) + "&Re_Url=" + reurl + "&agree=" + agreeStat;

        if (oemNo) {
            qstring += "&oem_code=" + oemNo;
        }
        //location.href = qstring;
        //opener.parent.location.href = qstring
        //parent.opener.location.href = qstring
        //self.close();

        opener.location.href = qstring;
       self.close();
    }

    //***************************************** 페이스북 *********************************** //

    //***************************************** 간편로그인 연동 *********************************** //
    var EasySocial = {}
    var EasyForm
        , EasyData = {};

    _.extend(Social, EasySocial, {
        _BtnEls: {},
        easyLogin: function (obj) {
            var args = Array.prototype.slice.call(arguments, 1);
            this._BtnEls = obj;
            this.btnEvent(args);
        },
        easyLoginForm: function (f) {
            EasyForm = $(f);
        },
        easyData: function (data) {
            EasyData = data
        },
        easyConnectText: function (selector, dissselector, conndate) {
            var msg = "";
            if (conndate) {
                msg = conndate + "에 연결되었습니다.";
                $(selector).addClass("contact");
                $(selector).removeClass("noContact");
                $(selector).text(msg);
                $(this).parents("span").addClass("mbrSoct2");
                $(this).parents("span").removeClass("mbrSoct1");
                $(this).find("span").text("해제하기");
                $(this).removeClass();
                $(this).addClass(dissselector);
            }
        },
        easyDisConnectText: function (selector, selectortext) {
            var msg = "간편 로그인 연결 정보가 없습니다.";
            $(selectortext).addClass("noContact");
            $(selectortext).removeClass("contact");
            $(selectortext).text(msg);
            $(selector).parents("span").addClass("mbrSoct1");
            $(selector).parents("span").removeClass("mbrSoct2");
            $(selector).find("span").text("연결하기");
        },
        btnEvent: function (args) {
            var $this = this;
            $.each($this._BtnEls, function (k, v) {
                if (_.has($this._BtnEls, k)) {
                    $(document).on("click", v, function (e) {
                        EasySnsObj[k]($(this), args);
                    });
                }
            });
        },
    });

    var EasySnsObj = {
        connect: function (selector, args) {
            var mid = selector.attr("value");
            $("#mid").val(mid);
            EasyForm.submit();
        },
        disconnect: function (selector, args) {
            alert('연동삭제');
        },
        join: function (selector) {
            var type = selector.attr("snstype");
            switch (type) {
                case "FB":
                    Social.FacebookPixel('InitiateCheckout', function () {
                        Social.FacebookJoin(EasyData);
                    });
                    
                    break;
                case "NV":
                    Social.FacebookPixel('InitiateCheckout', function () {
                        Social.naverJoin(EasyData);
                    });
                    break;
                case "KA":
                    Social.FacebookPixel('InitiateCheckout', function () {
                        Social.kakaoJoin(EasyData);
                    });
                    break;
                case "GL":
                    Social.FacebookPixel('InitiateCheckout', function () {
                        Social.googleJoin(EasyData, "popup");                        
                    });
                    
                    break;
                default:
                    alert('접근오류'); return;
                    break;
            }
        }
    }

    Social.MemExists = function (cb) {
        var obj = this;
        obj.load('/login/GetMemExists', 'GET', {}).done(function (res) {
            if (typeof cb !== 'undefined' && typeof cb === 'function') {
                (cb)(res)
            }
        })
    }

    //****************************************** 공통 ************************************ //
    //ajax호출처리
    Social.load = function (req, method, data, type) {
        var obj = this;
        var option;
        if (req.toLowerCase().indexOf('isjoin') > -1)
        {
            option = {
                type: method,
                url: req,
                data: data,
                dataType: type,
                cache: false
            }
        }
        else
        {
            option =  {
                type: method,
                url: req,
                data: data,
                dataType: type
            }
        }
        var callback = $.ajax(option);
        return callback;
    };

    Social.DecodeUrl = function (url, i) {
        if (!i) { i = 0 }
        if (url) {
            var pattern = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;

            if (pattern.test(url)) {
                url = "";
            }
            if (url.indexOf("%") > -1 && i < 3) {
                i = i + 1;
                url.replace(/&/gi, "&amp;");
                url = unescape(url);
                return Social.DecodeUrl(url, i);
            } else {
                url = url.replace(/.*?:\/\/[a-z0-9.]+/g, "");
                return url;
            }
        } else {
            return "";
        }
    }


    Social.getMobileServerName = function () {
        if ($domain.toLowerCase().indexOf("dev.mts.jobkorea.co.kr") > -1) {
            return "local";
        }
        return ($domain.toLowerCase().indexOf("mts.jobkorea.co.kr") > -1 ? "test" : ($domain.toLowerCase().indexOf("m104.jobkorea.co.kr") > -1 ? "test104" : "real"));
    }

    var regex = {
        dev: /^(dev)(.?)(jts)(.jobkorea.co.kr)$/i,
        tst: /^(jts)([0-9]+)?(.jobkorea.co.kr)$/i,
        stg: /^(stg||www104)([0-9]+)?\-?(www)?(.jobkorea.co.kr)/i,
    }

    Social.getPcServerName = function (strDomain) {
        var domain = typeof strDomain === 'undefined' ? $domain.toLowerCase() : strDomain;
        var returnName = "real";
        if (regex.dev.test(domain)) {
            returnName = "local";
        } else if (regex.tst.test(domain)) {
            returnName = "test";
        } else if (regex.stg.test(domain) && domain != "www.jobkorea.co.kr") {
            returnName = "test104";
        } else {
            returnName = "real";
        }
        return returnName;
    }

    Social.getPcDomain = function () {
        var obj = this;
        var serverName = obj.getPcServerName();
        var domain = $domain.toLowerCase();
        var protocol = "http://";

        var hostname = "";
        if (serverName == "local") {
            var matchs = regex.dev.exec(domain);
            hostname = (matchs != null && typeof matchs[2] == ".") ? "dev.jts.jobkorea.co.kr" : "devjts.jobkorea.co.kr";
        }
    else if (serverName == "test") {
      protocol = "https://";
            var matchs = regex.tst.exec(domain);
            hostname = (matchs != null && (typeof matchs[2] !== "undefined" && matchs[2] != "")) ? "jts" + matchs[2] + ".jobkorea.co.kr" : "jts.jobkorea.co.kr"
        }
        else if (serverName == "test104") {
            protocol = "https://";
            var matchs = regex.stg.exec(domain);
            hostname = (matchs != null && (typeof matchs[2] !== "undefined" && matchs[2] != "")) ? "stg" + matchs[2] + "-www.jobkorea.co.kr" : "www104.jobkorea.co.kr";
        } else {
            protocol = "https://";
            hostname = "www.jobkorea.co.kr";
        }
        domain = protocol + hostname;

        return domain;
    }

    var regexm = {
        dev: /^(dev)(.?)(mts)(.jobkorea.co.kr)$/i,
        tst: /^(mts)([0-9]+)?(.jobkorea.co.kr)$/i,
        stg: /^(stg||m104)([0-9]+)?\-?(m)?(.jobkorea.co.kr)/i
    }

    Social.getMobileServerName = function () {
        var domain = $domain.toLowerCase();

        var returnName = "real";
        if (regexm.dev.test(domain)) {
            returnName = "local";
        }
        else if (regexm.tst.test(domain)) {
            returnName = "test";
        }
        else if (regexm.stg.test(domain)) {
            returnName = "test104";
        }
        else {
            returnName = "real";
        }
        return returnName;
    }

    Social.getMobileDomain = function () {
        var obj = this;
        var serverName = obj.getMobileServerName();
        var domain = $domain.toLowerCase();
        var protocol = "http://";

        var hostname = "";
        if (serverName == "local") {
            var matchs = regexm.dev.exec(domain);
            hostname = (matchs != null && typeof matchs[2] == ".") ? "dev.mts.jobkorea.co.kr" : "devmts.jobkorea.co.kr";
        }
        else if (serverName == "test") {
            var matchs = regexm.tst.exec(domain);
            hostname = (matchs != null && (typeof matchs[2] !== "undefined" && matchs[2] != "")) ? "mts" + matchs[2] + ".jobkorea.co.kr" : "mts.jobkorea.co.kr"
        }
        else if (serverName == "test104") {
            protocol = "https://";
            var matchs = regexm.stg.exec(domain);
            hostname = (matchs != null && (typeof matchs[2] !== "undefined" && matchs[2] != "")) ? "stg" + matchs[2] + "-m.jobkorea.co.kr" : "m104.jobkorea.co.kr:444";
        } else {
            protocol = "https://";
            hostname = "m.jobkorea.co.kr";
        }
        domain = protocol + hostname;

        return domain;
    }

    Social.generateState = function () {
        var oDate = new Date();
        return oDate.getTime();
    }

    Social.getParams = function () {
        var p = [],
            hash;
        var hashes = (String(window.location.href).toLowerCase()).slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            p.push(hash[0]);
            p[hash[0]] = hash[1];
        }
        return p;
    }

    Social.makeParams = function (k, v, p) {
        var params = "";
        var prefixCode = (p == "") ? "?" : "&"
        if (v) {
            params = prefixCode + k + "=" + v;
        }
        return params;
    }

    Social.makeParamsObj = function (obj) {
        if (_.isObject(obj)) {
            return;
        }        
        var params = "",
      i = 0,
      l = 0;
        l = _.size(obj);
        var result = "";
        $.map(obj, function (v, k) {
            var prefixCode = (params == "") ? "?" : "&"
            if (_.has(obj, k) && typeof v !== 'undefined') {
                params += prefixCode + k + "=" + obj[k];
            }
            if (l == ++i) result = params;
        });
        return result;
    }

    Social.getUrlParams = function () {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) { params[key.toUpperCase()] = value; });
        return params;
    }

    Social.NsmConversionClick = function (NsmCode, callback) {
        var nsmX = new Image();
        nsmX.src = "https://ntracker.nsm-corp.com/c/rcv.php?code=" + NsmCode;
        callback();
    }

    Social.delay = function (func, wait) {
        var args = Array.prototype.slice.call(arguments, 2);
        return setTimeout(function () { return func.apply(null, args); }, wait);
    }

    Social.FacebookPixel = function (str, callback) {
        $.ajax({
            type: "GET",
            url: "/Include/Criteo/Facebook_Pixel.asp",
            data: { keyword: str },
            contentType: 'application/json; charset=utf-8',
            cache: false,
            success: function (html) {
                var obj = $(html);
                $(document.body).append('<div id="wp_tg_cts" style="display:none"></div>');
                $('#wp_tg_cts').html(obj.html());
                obj.filter('script').each(function () {
                    var text = this.text || this.textContent || this.innerHTML || '';
                    if (text != "") {
                        $.globalEval(text);
                    } else {
                        var src = $(this).attr("src");
                        if (src != "") {
                            $.getScript(src);
                        }
                    }
                });
            }
        }).done(function () {
            Social.delay(function () {
                callback();
            }, 1000);

        });
    }

    Social.getOemNo = function ()
    {
        var result = Social.getParams()['oem_code'] || "";

        if (result) {
            if (result.indexOf("#") > -1) {
                result = result.split('#')[0];
            }

            if (result.indexOf("m") > -1) {
                result = result.replace("m", "");
            }

            if (isNaN(result)) {
                result = "";
            }
        }

        return result;
    }

    Social.getOemReturnUrl = function (oemNo, isJoin) {
        var result = "";

        if (oemNo == "260") {
            if (this.getPcServerName() == "local" || this.getPcServerName() == "test") {
                result = "http://test.campusmon.jobkorea.co.kr"
            } else {
                result = "http://campusmon.jobkorea.co.kr"
            }
        } else if (oemNo == "313") {

            if (isJoin)
            {
                result = encodeURIComponent("https://" + location.host + "/learning/sso?returnUrl=Account/FirstLogin");
            }
            else
            {
                result = "https://" + location.host + "/learning/sso";
            }

        }

        return result;
    }

    Social.extend = function (obj) {
        _.each(Array.prototype.slice.call(arguments, 1), function (source) {
            if (source) {
                for (var prop in source) {
                    obj[prop] = source[prop];
                }
            }
        });
        return obj;
    };

    Social.chain = function (obj) {
        return Social(obj).chain();
    };

    var result = function (obj) {
        return this._chain ? Social(obj).chain() : obj;
    };

    Social.extend(Social.prototype, {

        chain: function () {
            this._chain = true;
            return this;
        },
        value: function () {
            return this._wrapped;
        }
    });

}).call(this, (jQuery || $), _);



//기존소스 유지함
var facebookLogin = function () {
    fncSNSDelCookie('fb_reurl');
    var params = "";
    if (window.location.href.split("?")[1] !== undefined) {
        params = "&" + (window.location.href.split("?")[1]);
    }
    // param 삭제 2018-08-30 LMJ
    params = '';

    if (Social) {
        var objUrlParam = Social.getUrlParams();
        var oemNo = Social.getOemNo();


        var fb_re_url = objUrlParam.RE_URL;

        if (objUrlParam.OEM_CODE && !fb_re_url) {
            fb_re_url = Social.getOemReturnUrl(oemNo);
        }

        if (fb_re_url) {
            fncSNSSetCookie('fb_reurl', fb_re_url, 1);
        }
        
        if (oemNo) {
            fncSNSSetCookie('fb_oemno', oemNo, 1);
        }
    }

    window.open("/FaceBook/GetLogin?Acstkn_Type_Code=4" + params, "FaceBookLogin", "width=500,height=300");
}

function fncSNSSetCookie(name, value, days) {
    try {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "") + expires + "; path=/";
    } catch (e) {
        console.log(e);
    }
}

function fncSNSDelCookie(name) {
    document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
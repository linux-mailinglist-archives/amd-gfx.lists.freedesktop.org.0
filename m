Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4D47F2CE
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Dec 2021 10:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846810E4B8;
	Sat, 25 Dec 2021 09:57:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sonic302-2.consmr.mail.bf2.yahoo.com
 (sonic302-2.consmr.mail.bf2.yahoo.com [74.6.135.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C089E10E457
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Dec 2021 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1640337470; bh=/YH3Kj6CuNSR8h6JUba3NPtRz1keZVV6uKGDqoU/5mE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=qtNmYkTMg9pvPSl8Xr987VHpk7YhD8fZpQ5huP3LOqtdKnVptGo7+YmZaKe9ctKYo0GaUAXsGgQPBOs7PmC3zzKsInHpLbbsRcL9gX++4JefKUMHvV5PLT+4XbNRD+s4oeJ8/goIUVzj9THAtxrr4ksi+Qn+YhH1VXt7WX2eMEjNenbGTH3FRpovk2Vhoclf5drqWvzo1X225gH1tegr/D8E3/b1jPtPMRRxBiaed+L1UDwBOieZmsVDVCsctKKbZI/+uCEXA6H8OqC9E/0BbIBRFc9bEXf6dWdbutOpiTkvlJfNW1Q2+QqzfGDd5lPfmmf4/uxJ8TOup7957hK3oQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1640337470; bh=FZpPf/tSBJ89oqDX8BHcMYvMAKtGLWhjJXvjz0P8HMZ=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=hyaugS+MgajBe77tmrbTgWItJRNo7+sGA9s2sHxkiV60QF+E53L1Hr7jpND3Rzu6lJfs94ApendMgZ4o06lFrBGo+PHsv29woGdSU5HXsQutDYzIdeDkhqUEg+QjQsHXrtArghPMgP1HFXa756S/M01N4+54edAiZGohBgJlA3ClXDdRFKuxZsjQdC4qnazVK/Pq2nbjdh+J8xgpmykGi9jmRaszssR0Gtq6qnpjcoZ3mAXYiBxnAymrkKNebVXPWPUhvI6f1qDxMqe36kxwn06/dakbP1SD3556XJA4pRmDJV+nVZ0uXOGIV7H518b1LMXfcdmfk0z7bGMy1QxV5g==
X-YMail-OSG: 1ffdlW4VM1kB1EHIbM3hjciWxe9DICznq3j0ckeEvgVpdbYN7m3gDUSwrnvAgjN
 Vi9wPJgkkMDybLvS6bcFdDCp8.hjDovq8cIy52Awhtf.sodEwGSE1g3XSvpZKJtzNwiBTI1Agdwp
 pawSSQT_YhQolWFh_lPa52cHRFRt6lsEMK_7UpzghilhVoEauX.v6gRgZDgPDoP2EehgGw1huQi8
 Zg4rY_RpjiahjZr036XD188E6d8MxQqeDmZ_vicr7iTmMTxzLknblgpQA1Hql7qFEwdNAonemvgJ
 fWTtCXsJ_x5MJ.aNYIIiKqhD_oWxvTr3_zL88oJ3nY4fw0y1dit5.h4Z7fT1UoivLmhnpCdSsZwn
 ddUoyhardPxLARtoQCFQ3maPyNd7D8B8vzA0_VNDuHUVbYPTZeHuyNBq0u6dxnFkbWnoH0KDBGh8
 ZA.KU0aV7rGQjPj_Uwx8bHQ1RPB_5dikNugjFts5ThRxs4G1CTJmcnU53vMCM0CM77ceCPuYzVCd
 dSfW.EmYzgIAkgQnLISSlm9mjNndo68HKE22YIDrO2Y0jPlaC7VCiwTGsn8Yjg30wyL0XClLc4Pm
 229zS8Qlei.I8oxIY9EAIKJmgq_xwCDY3bgSpPaGSpG0GIb3S0CuKajLoHppEcdpLjdkKpCgUO1B
 8R60g5D2Tbo87zaFZVtxYljhG2KoDOnxSIMSyDiZpaYQEbibEsNuWE8Xex3hwM6b8v9bisM9u6vD
 KvwVmL6.W3PL3T3lefJ_QoBbTb.Ihe0SyDthY.eDV5dDKgcbZ.QD3YQ5ZC.2fbPSWSiYFD4aNqx4
 xRVeDbgUkVJHic4rhUEQ8_yYc4ovNgrjzSUENzzD7CBwMhg5XNTAvXReneGVknk85XzADjxJK4tD
 j56IS06PSqxYpgd6mTYHtgk9iH9vKmuo.ZaOfscMAlv60e9xVHCchMz_O8_FYofWDC3VcdeQlaFH
 f4BgPvicfCLsPenTI4Xe1UZ.HzjpN79Rx4dVUepCU3R78X2047q4jQk7Vq9wOBWfrA8xM3HfiY5Z
 Ph2UB6YWSuX_rO9thINb8Z5oRlvGQ_slSHCZoof_LOQLZkk6YUWeecm1KWi0liTNygV_BkaeHuvo
 uqNk0rdPOYktLfi5JJ7ABLN1aGO2QtjgF6QkdJSh6y1Obhbuai00tJb10qT2Qb266f6DJatgiRxm
 cjLxSDiyO7me1anU0Qw5FJWT6B6eaq4_iIQ5k6tiPVuaENqbbpyPyyUFr7JsSe.Kp6nL8hfKH3p1
 tsvZ.mCcMu2b1z0LCzEHHQvKHO85WUkWCvN5Gf1S.25Ow90vj1wQlpz2qOK4JfE30d4dNNaJT7n7
 SXfBtbp8BIhJWNGUgsmnfAQQnTpxIzRlqKq5HAx215n0fv2yaZGrLs10V54_9MzlStPc0XolmVs0
 jKc8l7f3O0ZPyhXFBzIvcq9JGBvPGeYFTBrtRvq0tY3cYOAYxy9j3nrc_38nbe9TjLIVfgqsVMA4
 _zvS4Rji52FWGRnqJyJSWgZS0aR3bZ.WJvzTOzXGIr9NEMh1tN_y8M788GtM0lUmhYtxff5CiUeQ
 NjqcoNVmOVW4zszdqLF_YWYle7gq7mnwswGr3QneDQBevy42bW4GulKfzZjqn2TjNXzImQFCnqvT
 N2RnvrKYeQIQuD7JaN6qRlDf6iZrKAVyBVt5y_JkhP67Fa.ITPjBuGcnsd3ztUDwmGQWARsWeNi.
 P13bvzEEn2qiZKXRyJldp_zgtwIK_RlmGKsBHdYM79zqQmzP1HMV40IrKCC5vRPeU5JNHLc3VrlT
 QdopzpJTWhZ1pZbzDllqmGWLflT4Ko28Y.WvdBDbrmWfdG_6BA_79Opk183NYxtNR7JiaJJ0ncJw
 iHmxSyQtU_FSGOR4It4DU1iuChCNOlSFUtK4Bx5EkHpvm87AfizQjVJXiPVNEsTAs3x4txzwjXuN
 W3Revp8G6ehivk9.KxuL7LJlFr3sXctxZy.VhQ7eGd18qJbhS7q2H6iONvpi33rg25V9pEZV1Wyy
 N5WPguelOzrpEF0Iqw_nRw3iSgDa1buRO5ukJInyRoWzP9l4NnAwC6u4ovggmNC7UH1w55YoCvEP
 zj5M7WvbjEN1aUnFKnZIVP7EYa.a9KACFFDJ7FMPO.8LB5k7BTixIWZOagGYEtybA8Hn_WDpOWzQ
 qjF_aaXIys2.uphRcQKTHzQwzFVnzyy4sMg7VZ0DkoPH8zbUlaO_KrLUY_x5XyRygGcvEUYTyofK
 Q5ruybtLxCCIFilB1hImxMMgGjmwVzvvqSqpP4HWqNAla
X-Sonic-MF: <tarequemd.hanif@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.bf2.yahoo.com with HTTP; Fri, 24 Dec 2021 09:17:50 +0000
Date: Fri, 24 Dec 2021 09:17:31 +0000 (UTC)
From: "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
To: Alex Deucher <alexdeucher@gmail.com>
Message-ID: <372828143.652377.1640337451830@mail.yahoo.com>
In-Reply-To: <CADnq5_Ohep6ZY4UyMJTs8ELP+Sq4Mjff_AMcEA7AzR36WYR6ug@mail.gmail.com>
References: <1240565206.508633.1640262607606.ref@mail.yahoo.com>
 <1240565206.508633.1640262607606@mail.yahoo.com>
 <CADnq5_Ohep6ZY4UyMJTs8ELP+Sq4Mjff_AMcEA7AzR36WYR6ug@mail.gmail.com>
Subject: Re: [bisected][regression] drm: amdgpu: system hangs on tty login
 prompt
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_652376_228777767.1640337451829"
X-Mailer: WebService/1.1.19498 YMailNorrin
X-Mailman-Approved-At: Sat, 25 Dec 2021 09:57:59 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: xinhui.pan@amd.com, "christian.koenig@amd.com" <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

------=_Part_652376_228777767.1640337451829
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 Hi,
Thanks Alex. The attached patch fixes the issue.
Tareque
    On Friday, December 24, 2021, 01:21:23 AM GMT+6, Alex Deucher <alexdeucher@gmail.com> wrote:  
 
 The attached patch should fix this.

Alex

On Thu, Dec 23, 2021 at 2:04 PM Tareque Md.Hanif
<tarequemd.hanif@yahoo.com> wrote:
>
> Hi,
>
> I have been testing the 5.16-rc6 kernel and it hangs on tty login prompt on my laptop. Sometimes it lets me to login but "startx" hangs the system. The system is booting fine in 5.15.7.
>
> So I bisected the bug.
>
> first bad commit: [f7f12b25823c0dce1165b390522d29f99c4585b4] drm/amdgpu: default to true in amdgpu_device_asic_has_dc_support
>
> Reverting this commit fixes the issue.
>
> Device Information:
> Laptop model: Dell Inspiron 15 5567
> GPU 0: Intel HD Graphics 620
> GPU 1: AMD ATI Radeon R7 M445
>
> Regards,
> Tareque.
>
  
------=_Part_652376_228777767.1640337451829
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpf17c423eyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div id=3D"ydpf17c423eyiv3723750686"><div><div style=3D"font-family:Helv=
etica Neue, Helvetica, Arial, sans-serif;font-size:13px;" class=3D"ydpf17c4=
23eyiv3723750686ydp2d03f4ebyahoo-style-wrap"><div></div>
        <div dir=3D"ltr">Hi,</div><div dir=3D"ltr"><br clear=3D"none"></div=
><div dir=3D"ltr">Thanks Alex. The attached patch fixes the issue.</div><di=
v dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">Tareque<br clear=3D=
"none"></div>
       =20
        </div></div></div></div><div id=3D"yiv3723750686yqt13419" class=3D"=
yiv3723750686yqt6452926366"><div id=3D"yiv3723750686yahoo_quoted_1116422592=
" class=3D"yiv3723750686yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, December 24, 2021, 01:21:23 AM GMT+6, Alex D=
eucher &lt;alexdeucher@gmail.com&gt; wrote:
                </div>
                <div><br clear=3D"none"></div>
                <div><br clear=3D"none"></div>
                <div><div dir=3D"ltr">The attached patch should fix this.<b=
r clear=3D"none"><br clear=3D"none">Alex<br clear=3D"none"><div id=3D"yiv37=
23750686yqtfd30579" class=3D"yiv3723750686yqt9878445760"><br clear=3D"none"=
>On Thu, Dec 23, 2021 at 2:04 PM Tareque Md.Hanif<br clear=3D"none">&lt;<a =
rel=3D"nofollow noopener noreferrer" shape=3D"rect" ymailto=3D"mailto:tareq=
uemd.hanif@yahoo.com" target=3D"_blank" href=3D"mailto:tarequemd.hanif@yaho=
o.com">tarequemd.hanif@yahoo.com</a>&gt; wrote:<br clear=3D"none">&gt;<br c=
lear=3D"none">&gt; Hi,<br clear=3D"none">&gt;<br clear=3D"none">&gt; I have=
 been testing the 5.16-rc6 kernel and it hangs on tty login prompt on my la=
ptop. Sometimes it lets me to login but "startx" hangs the system. The syst=
em is booting fine in 5.15.7.<br clear=3D"none">&gt;<br clear=3D"none">&gt;=
 So I bisected the bug.<br clear=3D"none">&gt;<br clear=3D"none">&gt; first=
 bad commit: [f7f12b25823c0dce1165b390522d29f99c4585b4] drm/amdgpu: default=
 to true in amdgpu_device_asic_has_dc_support<br clear=3D"none">&gt;<br cle=
ar=3D"none">&gt; Reverting this commit fixes the issue.<br clear=3D"none">&=
gt;<br clear=3D"none">&gt; Device Information:<br clear=3D"none">&gt; Lapto=
p model: Dell Inspiron 15 5567<br clear=3D"none">&gt; GPU 0: Intel HD Graph=
ics 620<br clear=3D"none">&gt; GPU 1: AMD ATI Radeon R7 M445<br clear=3D"no=
ne">&gt;<br clear=3D"none">&gt; Regards,<br clear=3D"none">&gt; Tareque.<br=
 clear=3D"none">&gt;<br clear=3D"none"></div></div></div>
            </div>
        </div></div></body></html>
------=_Part_652376_228777767.1640337451829--

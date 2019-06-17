Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8FD48AB9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 19:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E34B89191;
	Mon, 17 Jun 2019 17:44:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F6789191
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 17:44:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m3so10941605wrv.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 10:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=EolXqHpApmcBJk38MZX3UaARR2pyNoEmVTx5/duWD9U=;
 b=U3S0+PcegUzp21AHeyI+D1KjyFeCQTVwM+Xs5/J9dX9WHkhbvEbUbM++gqRcQbCUwy
 E8fRGBGv0BLtyCyZwJsqRl+qs49krxL0r2SQeODkrNnnOTOkUzH3ENhmosWksfGRvl67
 tY/xLbB6oEal8kiwRjH07tdfFdqCI8ueALgEkE29nMFK8D+vOrKeVDGPVBucxjjOcJip
 zy3Vj9cbwR3pYGE2Gvl6Yvbc6cQtOgRZuQj34xuwuuBTW0yQk32dW/zKK+2qOCXKf5ik
 SxzPEUkR6Sknba9x4xOwYS989W6zCVG9jTtPZV/9tKCIJe7VNbPOWYp93Mr1oQesY71w
 N90w==
X-Gm-Message-State: APjAAAWlnlshpVw1JzF93sBLETTNHG/V2zxj3sMTqBVdcahlrpA/fbQf
 T2Rc4lk/U4ZhMkEABBzg+Qm6ciRS
X-Google-Smtp-Source: APXvYqzZu/agnvACRjNpFWqLH9oFDDMHvAHGNJOMwo85hX0nVRZX8uI+OufSiAPaq1QLkgV6OX30IQ==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr219284wrs.183.1560793485916;
 Mon, 17 Jun 2019 10:44:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r3sm14617908wrr.61.2019.06.17.10.44.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:44:45 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: wait to fetch the vbios until after common
 init
To: "Russell, Kent" <Kent.Russell@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190617144500.29491-1-alexander.deucher@amd.com>
 <BN6PR12MB161858B2EF2FDE6983B8AF8085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
 <BN6PR12MB1809772C53A7C9BB535D0012F7EB0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <BN6PR12MB1618690F5B4843CD5E0CC31085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c9fa7da-92c1-953a-0ca9-5054ac2ebc92@gmail.com>
Date: Mon, 17 Jun 2019 19:44:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <BN6PR12MB1618690F5B4843CD5E0CC31085EB0@BN6PR12MB1618.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=EolXqHpApmcBJk38MZX3UaARR2pyNoEmVTx5/duWD9U=;
 b=BYaptxupvJwJn1J6R5pDWQTVz9wOpBal/els6JWh/DhornHQb94f5lHz6ZEhBdd8jY
 e/ggJdp/7uS4q/K+t36pcqTkc2UkZHG97TXBn2C+akvuj3H7L9ZJHuP4ny1NHiPe8wju
 A+80D9we/muS6SIB8R94oyuMhk7AgXv44RkZhhncLHJfGufuprnH1d+vFStEggDoyk7/
 i34nWc33If9vQk6+wq9TRMHx0xMVw05beYVNiWdcPiAdpun7zIn4B7t3rSaDjtRz9Jay
 0bgiSJCjnwQNE0A9PBUyNVe6MRSyLUaHG+AHloIzK0DSsQDopO8I6p02ZA39wetqK/Zp
 //MA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0829768532=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0829768532==
Content-Type: multipart/alternative;
 boundary="------------C2F865CC793A51507E42F081"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C2F865CC793A51507E42F081
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

A quick guide to the different tags:

Signed-off-by: I'm somehow responsible that the code is in the mainline 
tree. E.g. either the Author of a patch or some maintainer who forwarded 
the stuff to Linus.
Tested-by: I tested the code and found it working good.
Reviewed-by: I'm familiar with both the code and the hardware and judged 
that this looks like it should work as intended.
Acked-by: It looks good to me in general, but I'm not familiar with 
either the code or the hardware to judge if that is correct or not. 
Usually used to note general agreement to a design or piece of code 
without looking to deeply into it.

NAK means a fundamental disagreement on how a piece of code implements 
something and what a reviewer things is the right thing to do. It is 
something which needs to sorted out before some code can be committed.

A NAK does NOT mean general rejection, but rather that you need to 
retreat and start discussion things on a higher level.

Christian.

Am 17.06.19 um 17:26 schrieb Russell, Kent:
>
> Thanks, I need to get familiar with all of the tags 😊
>
> Kent
>
> *From:* Deucher, Alexander <Alexander.Deucher@amd.com>
> *Sent:* Monday, June 17, 2019 11:24 AM
> *To:* Russell, Kent <Kent.Russell@amd.com>; Alex Deucher 
> <alexdeucher@gmail.com>; amd-gfx@lists.freedesktop.org
> *Subject:* Re: [PATCH] drm/amdgpu: wait to fetch the vbios until after 
> common init
>
> I'll make that a tested-by.  Thanks!
>
> Alex
>
> ------------------------------------------------------------------------
>
> *From:*Russell, Kent
> *Sent:* Monday, June 17, 2019 11:14 AM
> *To:* Alex Deucher; amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>
> *Cc:* Deucher, Alexander
> *Subject:* RE: [PATCH] drm/amdgpu: wait to fetch the vbios until after 
> common init
>
> This also worked. I don't think that I'm qualified enough to RB it, 
> but you can add my
>
> Verified-By: Kent Russell <kent.russell@amd.com 
> <mailto:kent.russell@amd.com>>
>
>  Kent
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org 
> <mailto:amd-gfx-bounces@lists.freedesktop.org>> On Behalf Of Alex Deucher
> Sent: Monday, June 17, 2019 10:45 AM
> To: amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com 
> <mailto:Alexander.Deucher@amd.com>>
> Subject: [PATCH] drm/amdgpu: wait to fetch the vbios until after 
> common init
>
> We need the asic_funcs set for the get rom callbacks in some cases.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com 
> <mailto:alexander.deucher@amd.com>>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 ++++++++++++----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 4a836db1000f..e26303bc567e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1534,17 +1534,6 @@ static int amdgpu_device_ip_early_init(struct 
> amdgpu_device *adev)
>          if (amdgpu_sriov_vf(adev))
>                  adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
>
> -       /* Read BIOS */
> -       if (!amdgpu_get_bios(adev))
> -               return -EINVAL;
> -
> -       r = amdgpu_atombios_init(adev);
> -       if (r) {
> -               dev_err(adev->dev, "amdgpu_atombios_init failed\n");
> -               amdgpu_vf_error_put(adev, 
> AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0, 0);
> -               return r;
> -       }
> -
>          for (i = 0; i < adev->num_ip_blocks; i++) {
>                  if ((amdgpu_ip_block_mask & (1 << i)) == 0) {
>                          DRM_ERROR("disabled ip block: %d <%s>\n", @@ 
> -1566,6 +1555,19 @@ static int amdgpu_device_ip_early_init(struct 
> amdgpu_device *adev)
> adev->ip_blocks[i].status.valid = true;
>                          }
>                  }
> +               /* get the vbios after the asic_funcs are set up */
> +               if (adev->ip_blocks[i].version->type == 
> AMD_IP_BLOCK_TYPE_COMMON) {
> +                       /* Read BIOS */
> +                       if (!amdgpu_get_bios(adev))
> +                               return -EINVAL;
> +
> +                       r = amdgpu_atombios_init(adev);
> +                       if (r) {
> +                               dev_err(adev->dev, 
> "amdgpu_atombios_init failed\n");
> +                               amdgpu_vf_error_put(adev, 
> AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0, 0);
> +                               return r;
> +                       }
> +               }
>          }
>
>          adev->cg_flags &= amdgpu_cg_mask;
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------C2F865CC793A51507E42F081
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">A quick guide to the different tags:<br>
      <br>
      Signed-off-by: I'm somehow responsible that the code is in the
      mainline tree. E.g. either the Author of a patch or some
      maintainer who forwarded the stuff to Linus.<br>
      Tested-by: I tested the code and found it working good.<br>
      Reviewed-by: I'm familiar with both the code and the hardware and
      judged that this looks like it should work as intended.<br>
      Acked-by: It looks good to me in general, but I'm not familiar
      with either the code or the hardware to judge if that is correct
      or not. Usually used to note general agreement to a design or
      piece of code without looking to deeply into it.<br>
      <br>
      NAK means a fundamental disagreement on how a piece of code
      implements something and what a reviewer things is the right thing
      to do. It is something which needs to sorted out before some code
      can be committed.<br>
      <br>
      A NAK does NOT mean general rejection, but rather that you need to
      retreat and start discussion things on a higher level.<br>
      <br>
      Christian.<br>
      <br>
      Am 17.06.19 um 17:26 schrieb Russell, Kent:<br>
    </div>
    <blockquote type="cite"
cite="mid:BN6PR12MB1618690F5B4843CD5E0CC31085EB0@BN6PR12MB1618.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Thanks, I need to get familiar with all of
          the tags <span style="font-family:&quot;Segoe UI
            Emoji&quot;,sans-serif">
            😊</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Kent<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Deucher, Alexander
              <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a> <br>
              <b>Sent:</b> Monday, June 17, 2019 11:24 AM<br>
              <b>To:</b> Russell, Kent <a class="moz-txt-link-rfc2396E" href="mailto:Kent.Russell@amd.com">&lt;Kent.Russell@amd.com&gt;</a>;
              Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a>;
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
              <b>Subject:</b> Re: [PATCH] drm/amdgpu: wait to fetch the
              vbios until after common init<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div>
          <p class="MsoNormal"><span
              style="font-size:12.0pt;color:black">I'll make that a
              tested-by.  Thanks!<o:p></o:p></span></p>
        </div>
        <div>
          <p class="MsoNormal"><span
              style="font-size:12.0pt;color:black"><o:p> </o:p></span></p>
        </div>
        <div>
          <p class="MsoNormal"><span
              style="font-size:12.0pt;color:black">Alex<o:p></o:p></span></p>
        </div>
        <div class="MsoNormal" style="text-align:center" align="center">
          <hr width="98%" size="2" align="center">
        </div>
        <div id="divRplyFwdMsg">
          <p class="MsoNormal"><b><span style="color:black">From:</span></b><span
              style="color:black"> Russell, Kent<br>
              <b>Sent:</b> Monday, June 17, 2019 11:14 AM<br>
              <b>To:</b> Alex Deucher; <a
                href="mailto:amd-gfx@lists.freedesktop.org"
                moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
              <b>Cc:</b> Deucher, Alexander<br>
              <b>Subject:</b> RE: [PATCH] drm/amdgpu: wait to fetch the
              vbios until after common init</span>
            <o:p></o:p></p>
          <div>
            <p class="MsoNormal"> <o:p></o:p></p>
          </div>
        </div>
        <div>
          <div>
            <p class="MsoNormal">This also worked. I don't think that
              I'm qualified enough to RB it, but you can add my<br>
              <br>
              Verified-By: Kent Russell &lt;<a
                href="mailto:kent.russell@amd.com"
                moz-do-not-send="true">kent.russell@amd.com</a>&gt;<br>
              <br>
               Kent<br>
              <br>
              -----Original Message-----<br>
              From: amd-gfx &lt;<a
                href="mailto:amd-gfx-bounces@lists.freedesktop.org"
                moz-do-not-send="true">amd-gfx-bounces@lists.freedesktop.org</a>&gt;
              On Behalf Of Alex Deucher<br>
              Sent: Monday, June 17, 2019 10:45 AM<br>
              To: <a href="mailto:amd-gfx@lists.freedesktop.org"
                moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
              Cc: Deucher, Alexander &lt;<a
                href="mailto:Alexander.Deucher@amd.com"
                moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;<br>
              Subject: [PATCH] drm/amdgpu: wait to fetch the vbios until
              after common init<br>
              <br>
              We need the asic_funcs set for the get rom callbacks in
              some cases.<br>
              <br>
              Signed-off-by: Alex Deucher &lt;<a
                href="mailto:alexander.deucher@amd.com"
                moz-do-not-send="true">alexander.deucher@amd.com</a>&gt;<br>
              ---<br>
               drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24
              ++++++++++++----------<br>
               1 file changed, 13 insertions(+), 11 deletions(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
              b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
              index 4a836db1000f..e26303bc567e 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
              @@ -1534,17 +1534,6 @@ static int
              amdgpu_device_ip_early_init(struct amdgpu_device *adev)<br>
                       if (amdgpu_sriov_vf(adev))<br>
                               adev-&gt;pm.pp_feature &amp;=
              ~PP_GFXOFF_MASK;<br>
               <br>
              -       /* Read BIOS */<br>
              -       if (!amdgpu_get_bios(adev))<br>
              -               return -EINVAL;<br>
              -<br>
              -       r = amdgpu_atombios_init(adev);<br>
              -       if (r) {<br>
              -               dev_err(adev-&gt;dev,
              "amdgpu_atombios_init failed\n");<br>
              -               amdgpu_vf_error_put(adev,
              AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0, 0);<br>
              -               return r;<br>
              -       }<br>
              -<br>
                       for (i = 0; i &lt; adev-&gt;num_ip_blocks; i++) {<br>
                               if ((amdgpu_ip_block_mask &amp; (1
              &lt;&lt; i)) == 0) {<br>
                                       DRM_ERROR("disabled ip block: %d
              &lt;%s&gt;\n", @@ -1566,6 +1555,19 @@ static int
              amdgpu_device_ip_early_init(struct amdgpu_device *adev)<br>
                                              
              adev-&gt;ip_blocks[i].status.valid = true;<br>
                                       }<br>
                               }<br>
              +               /* get the vbios after the asic_funcs are
              set up */<br>
              +               if (adev-&gt;ip_blocks[i].version-&gt;type
              == AMD_IP_BLOCK_TYPE_COMMON) {<br>
              +                       /* Read BIOS */<br>
              +                       if (!amdgpu_get_bios(adev))<br>
              +                               return -EINVAL;<br>
              +<br>
              +                       r = amdgpu_atombios_init(adev);<br>
              +                       if (r) {<br>
              +                               dev_err(adev-&gt;dev,
              "amdgpu_atombios_init failed\n");<br>
              +                               amdgpu_vf_error_put(adev,
              AMDGIM_ERROR_VF_ATOMBIOS_INIT_FAIL, 0, 0);<br>
              +                               return r;<br>
              +                       }<br>
              +               }<br>
                       }<br>
               <br>
                       adev-&gt;cg_flags &amp;= amdgpu_cg_mask;<br>
              --<br>
              2.20.1<br>
              <br>
              _______________________________________________<br>
              amd-gfx mailing list<br>
              <a href="mailto:amd-gfx@lists.freedesktop.org"
                moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
              <a
                href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C2F865CC793A51507E42F081--

--===============0829768532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0829768532==--

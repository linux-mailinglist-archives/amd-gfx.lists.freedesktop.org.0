Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEF048E75
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0A089003;
	Mon, 17 Jun 2019 19:25:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E391089003
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:25:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x4so11255832wrt.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=5gdjgkFV9tLk8tNN3gRVq53moBQm+zQC2Qe0n6LjaN8=;
 b=kyq9+mYbv4aw28pYOP/fYKorOcQuP7buInqlbADKxxi/rA5fUT/+XoHvN+6Lzx7WEj
 XBWLMCrbA5QwL0qD1mgUTc7ibYchT62XCsU9c62HGI2Tsdv89I7prvudMKxuu4JO5B0J
 Mkz86B59xbNv3q75dUj81xajz+AtjXyGWqP3SXArIDvbhRtHbA9/iwT1eyuQwiF5GFKq
 UuWBvO+d17uoqnZ2KOrj+Gg2/DRxrvF9aFEcP/3YO6QF6hQMTXJ/yftD8bbfNwWmTMet
 jnyXY62Vrvd7p5UuTNM/E+lKmHk1CmdF6ONWb7dd1XGD3nkh0pgymUdczU05xsR9sLBt
 tahg==
X-Gm-Message-State: APjAAAV5U9kCD9yPtjHZqmkwxj+6ImH5usxdc7Xegqru/XHM8gUcS/+K
 YicMRQyg7RLaO+ABjzqOOaSmgWgF
X-Google-Smtp-Source: APXvYqy0G85V5wk5zHx8zutvHgUPNP4okPoFIDktrwwf4d8YQmOh6Mj1dWCW7D3md1EZUGWWUURIAQ==
X-Received: by 2002:adf:e691:: with SMTP id r17mr23925619wrm.67.1560799544414; 
 Mon, 17 Jun 2019 12:25:44 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f2sm18484554wrq.48.2019.06.17.12.25.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:25:43 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
To: Tom St Denis <tstdenis82@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
References: <20190614165108.23011-1-tom.stdenis@amd.com>
 <CAAzXoRK9vy-qC36mSzJ3aJr6YB8kuWMujxfuNFAqAzbWEk+gTA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <82551bf2-c88d-d1fe-652f-535562154d0d@gmail.com>
Date: Mon, 17 Jun 2019 21:25:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAAzXoRK9vy-qC36mSzJ3aJr6YB8kuWMujxfuNFAqAzbWEk+gTA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=5gdjgkFV9tLk8tNN3gRVq53moBQm+zQC2Qe0n6LjaN8=;
 b=cY+CTgsyiMP2fWJFnLE7sdyUK3lQ2ePF1JAQxoB1/XThdVud1d6yUURSKexS9nfUjU
 Zlq6Na/cmHvDOfdTvTdkwQeOP31BPeMW6uJydPFjqW6anY+Q7W2I/sa5HP6FKgiCMWvI
 bhg6T7lhekJBYSRtY7trAHYRcVGfOjIKGJez03S+++bkhepLVDny/dat3X3OV6n3oiJ2
 GGrJruMkjhb4j75fEMY5XFaEgPY5je4tlMaGui+wAfZiPX3l7XJWPTVkPQOzGNDnQbRa
 yrbhHOnnr/QlmAGe8o5/lA26FTgdJf+CmXmn9iK5EA9uKjZYAliYKf8rJdGGjr+cmgnu
 6eog==
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
Content-Type: multipart/mixed; boundary="===============0473789738=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0473789738==
Content-Type: multipart/alternative;
 boundary="------------28542C742B8D47BEA3B84677"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------28542C742B8D47BEA3B84677
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Christian König <christian.koenig@amd.com>

Am 17.06.19 um 20:21 schrieb Tom St Denis:
> ping?
>
> On Fri, Jun 14, 2019 at 12:51 PM StDenis, Tom <Tom.StDenis@amd.com 
> <mailto:Tom.StDenis@amd.com>> wrote:
>
>     On 32-bit hosts mem->num_pages is 32-bits and can overflow
>     when shifted.  Add a cast to avoid this.
>
>     Signed-off-by: Tom St Denis <tom.stdenis@amd.com
>     <mailto:tom.stdenis@amd.com>>
>     ---
>      drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 8 +++++---
>      1 file changed, 5 insertions(+), 3 deletions(-)
>
>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     index c963ad86072e..31895d3c33de 100644
>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>     @@ -279,14 +279,16 @@ static int amdgpu_vram_mgr_new(struct
>     ttm_mem_type_manager *man,
>             uint64_t vis_usage = 0;
>             unsigned i;
>             int r;
>     +       uint64_t mem_bytes;
>
>             lpfn = place->lpfn;
>             if (!lpfn)
>                     lpfn = man->size;
>
>             /* bail out quickly if there's likely not enough VRAM for
>     this BO */
>     -       if (atomic64_add_return(mem->num_pages << PAGE_SHIFT,
>     &mgr->usage) > adev->gmc.mc_vram_size) {
>     -               atomic64_sub(mem->num_pages << PAGE_SHIFT,
>     &mgr->usage);
>     +       mem_bytes = (u64)mem->num_pages << PAGE_SHIFT;
>     +       if (atomic64_add_return(mem_bytes, &mgr->usage) >
>     adev->gmc.mc_vram_size) {
>     +               atomic64_sub(mem_bytes, &mgr->usage);
>                     mem->mm_node = NULL;
>                     return 0;
>             }
>     @@ -308,7 +310,7 @@ static int amdgpu_vram_mgr_new(struct
>     ttm_mem_type_manager *man,
>             nodes = kvmalloc_array((uint32_t)num_nodes, sizeof(*nodes),
>                                    GFP_KERNEL | __GFP_ZERO);
>             if (!nodes) {
>     -               atomic64_sub(mem->num_pages << PAGE_SHIFT,
>     &mgr->usage);
>     +               atomic64_sub(mem_bytes, &mgr->usage);
>                     return -ENOMEM;
>             }
>
>     -- 
>     2.21.0
>
>     _______________________________________________
>     amd-gfx mailing list
>     amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
>     https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------28542C742B8D47BEA3B84677
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Reviewed-by: Christian König
      <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
      <br>
      Am 17.06.19 um 20:21 schrieb Tom St Denis:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAzXoRK9vy-qC36mSzJ3aJr6YB8kuWMujxfuNFAqAzbWEk+gTA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">ping?</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Jun 14, 2019 at 12:51
          PM StDenis, Tom &lt;<a href="mailto:Tom.StDenis@amd.com"
            moz-do-not-send="true">Tom.StDenis@amd.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          32-bit hosts mem-&gt;num_pages is 32-bits and can overflow<br>
          when shifted.  Add a cast to avoid this.<br>
          <br>
          Signed-off-by: Tom St Denis &lt;<a
            href="mailto:tom.stdenis@amd.com" target="_blank"
            moz-do-not-send="true">tom.stdenis@amd.com</a>&gt;<br>
          ---<br>
           drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 8 +++++---<br>
           1 file changed, 5 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
          b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
          index c963ad86072e..31895d3c33de 100644<br>
          --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
          +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
          @@ -279,14 +279,16 @@ static int amdgpu_vram_mgr_new(struct
          ttm_mem_type_manager *man,<br>
                  uint64_t vis_usage = 0;<br>
                  unsigned i;<br>
                  int r;<br>
          +       uint64_t mem_bytes;<br>
          <br>
                  lpfn = place-&gt;lpfn;<br>
                  if (!lpfn)<br>
                          lpfn = man-&gt;size;<br>
          <br>
                  /* bail out quickly if there's likely not enough VRAM
          for this BO */<br>
          -       if (atomic64_add_return(mem-&gt;num_pages &lt;&lt;
          PAGE_SHIFT, &amp;mgr-&gt;usage) &gt;
          adev-&gt;gmc.mc_vram_size) {<br>
          -               atomic64_sub(mem-&gt;num_pages &lt;&lt;
          PAGE_SHIFT, &amp;mgr-&gt;usage);<br>
          +       mem_bytes = (u64)mem-&gt;num_pages &lt;&lt;
          PAGE_SHIFT;<br>
          +       if (atomic64_add_return(mem_bytes, &amp;mgr-&gt;usage)
          &gt; adev-&gt;gmc.mc_vram_size) {<br>
          +               atomic64_sub(mem_bytes, &amp;mgr-&gt;usage);<br>
                          mem-&gt;mm_node = NULL;<br>
                          return 0;<br>
                  }<br>
          @@ -308,7 +310,7 @@ static int amdgpu_vram_mgr_new(struct
          ttm_mem_type_manager *man,<br>
                  nodes = kvmalloc_array((uint32_t)num_nodes,
          sizeof(*nodes),<br>
                                         GFP_KERNEL | __GFP_ZERO);<br>
                  if (!nodes) {<br>
          -               atomic64_sub(mem-&gt;num_pages &lt;&lt;
          PAGE_SHIFT, &amp;mgr-&gt;usage);<br>
          +               atomic64_sub(mem_bytes, &amp;mgr-&gt;usage);<br>
                          return -ENOMEM;<br>
                  }<br>
          <br>
          -- <br>
          2.21.0<br>
          <br>
          _______________________________________________<br>
          amd-gfx mailing list<br>
          <a href="mailto:amd-gfx@lists.freedesktop.org" target="_blank"
            moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
          <a
            href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></blockquote>
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

--------------28542C742B8D47BEA3B84677--

--===============0473789738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0473789738==--

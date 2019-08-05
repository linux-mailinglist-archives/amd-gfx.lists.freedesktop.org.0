Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2981F0C
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 16:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF95489D30;
	Mon,  5 Aug 2019 14:27:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CE289D30
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 14:27:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c2so81410038wrm.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 05 Aug 2019 07:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=lxZTPGZVomCyVzchtGr22K0lHvi0lzCFtgKjSVQMTFI=;
 b=cKydi8A3bGR7SUzeD6Fan91N1/2EynBoxOYa51YGYWX0kvGtaZJJb42Sz+HLAAZhY6
 KphL+hsMYfHhliHN/HG11x1f5/tPyyg9jVSseGdtqzDiUkXzAdPCilqyAZt/A9pLb80G
 KZg7AUH7apbXvhugVHn2TW5OQo0t976SZmcesXewu4jcBU2leBwatuF20ddW4ycRfS0J
 NN5OBFcyZRmFvuMHcEF8w5iFV7Ao9eoK31waOul/WCAbP5vOz5QLW6Emt0YH5ea4k8d1
 EHqqUVubztv42YnhMRUo2IPKVA8ChTDTIhrW8rjCZVdoPC3IfMK+mMnwD4CKUBwVKU1o
 HDZw==
X-Gm-Message-State: APjAAAXA/vXacxkILwsjWpZYRNmGsBjQTgtWKE6yXDREcrGAsE2t+ri4
 Cr7Xk4YwOFbvWARf2q/BzOsaGaSQ
X-Google-Smtp-Source: APXvYqy4NbR7T3s0YBnkXbAU0wnvyDcwchpwS7jhNCOqKIv5/+osNFqJfhfd/CeimTgQc3wr7rxH1A==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr609779wro.33.1565015245966;
 Mon, 05 Aug 2019 07:27:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j33sm194227854wre.42.2019.08.05.07.27.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 07:27:25 -0700 (PDT)
Subject: Re: [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]] *ERROR* ctx
 00000000189dec14 is still alive
To: =?UTF-8?B?5a2Z5Y2X5YuH?= <497141801@qq.com>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
References: <tencent_03E0C311B11B64CA539D74F7174F5059E008@qq.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <057fc7ff-2b22-970b-992f-cfc818aadf7a@gmail.com>
Date: Mon, 5 Aug 2019 16:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <tencent_03E0C311B11B64CA539D74F7174F5059E008@qq.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=lxZTPGZVomCyVzchtGr22K0lHvi0lzCFtgKjSVQMTFI=;
 b=t5pqypGe/rhj1taUqmucNbFLUukYZ9SMwhPj2rViBgLjp8SQIt4gtEef7SawfIxzPe
 FIREcD6AikYKpouzvNEpZebnvUCxCGQsPWkiDhFesBY/QuPoki14SlHIe5bliC0VFH9B
 6l5OlpYML0lGhLNLwTUUHQnFUUaq/JyDtv1EtLrzj7CbnzV4lHVtZEfbOUW1txasOafM
 FMblHF9ilDGxFq8fWiXVeDGU/EWo3QXy+ZJ+TPkT+BBk1D1HX+TbmyYGBlhdKFmRgzyS
 aC6OwttvwKLdZvoZe/Y5xQJjyuk3gaIAF9N4Sgw3kRmHIKNORdnLv+9AibzVN9L1burb
 wHUQ==
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
Content-Type: multipart/mixed; boundary="===============1473584011=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1473584011==
Content-Type: multipart/alternative;
 boundary="------------EF078863894CBD0E26679AC7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------EF078863894CBD0E26679AC7
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.08.19 um 14:53 schrieb 孙南勇:
> Hi All,
>     Sometime dmesg show this log:
> [10407.720988] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]] *ERROR* ctx 
> 00000000189dec14 is still alive
> [10407.721054] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]] *ERROR* ctx 
> 00000000189dec14 is still alive
> [10407.721120] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]] *ERROR* ctx 
> 00000000189dec14 is still alive
> [10407.721187] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]] *ERROR* ctx 
> 00000000189dec14 is still alive
> [10407.721418] [drm:amdgpu_ctx_mgr_fini [amdgpu]] *ERROR* ctx 
> 00000000189dec14 is still alive
>
> What are the side effects?
> Does this error will occur GPU hung(such as gfx timeout)?
> How to fix this?
>
> My kernel : 4.19.36

That is hopelessly outdated code, please try to switch something newer 
and re-test.

Christian.

> Mesa: 18.3.6
>
> And I find that in amdgpu_ctx.c, the 
> function:amdgpu_ctx_mgr_entity_flush doesn't check the
> ctx->refcount(the check is stopped in this patch: 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=48ad368a8a3ab2fd3c2bc2ccccc6e29b1acda1bb) 
> ,
>  why amdgpu_ctx_mgr_entity_fini still need check ctx->refcount?
> Can i stop check ctx->refcount in amdgpu_ctx_mgr_entity_fini ?
>
> Thanks!
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------EF078863894CBD0E26679AC7
Content-Type: text/html; charset=gb18030
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb18030">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 05.08.19 um 14:53 schrieb 孙南勇:<br>
    </div>
    <blockquote type="cite"
      cite="mid:tencent_03E0C311B11B64CA539D74F7174F5059E008@qq.com">
      <meta http-equiv="content-type" content="text/html;
        charset=gb18030">
      <div>Hi All,</div>
      <div>    Sometime dmesg show this log:</div>
      <div>
        <div>[10407.720988] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]]
          *ERROR* ctx 00000000189dec14 is still alive</div>
        <div>[10407.721054] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]]
          *ERROR* ctx 00000000189dec14 is still alive</div>
        <div>[10407.721120] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]]
          *ERROR* ctx 00000000189dec14 is still alive</div>
        <div>[10407.721187] [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]]
          *ERROR* ctx 00000000189dec14 is still alive</div>
        <div>[10407.721418] [drm:amdgpu_ctx_mgr_fini [amdgpu]] *ERROR*
          ctx 00000000189dec14 is still alive</div>
      </div>
      <div><br>
      </div>
      <div>What are the side effects?</div>
      <div>Does this error will occur GPU hung(such as gfx timeout)?</div>
      <div>How to fix this?</div>
      <div><br>
      </div>
      <div>
        <div>My kernel : 4.19.36</div>
      </div>
    </blockquote>
    <br>
    That is hopelessly outdated code, please try to switch something
    newer and re-test.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:tencent_03E0C311B11B64CA539D74F7174F5059E008@qq.com">
      <div>
        <div>Mesa: 18.3.6</div>
        <div><br>
        </div>
        <div>And I find that in amdgpu_ctx.c, the
          function:amdgpu_ctx_mgr_entity_flush doesn't check the </div>
        <div>ctx-&gt;refcount(the check is stopped in this patch:
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=48ad368a8a3ab2fd3c2bc2ccccc6e29b1acda1bb">https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=48ad368a8a3ab2fd3c2bc2ccccc6e29b1acda1bb</a>)
          , </div>
        <div> why amdgpu_ctx_mgr_entity_fini still need
          check ctx-&gt;refcount?</div>
        <div>Can i stop check ctx-&gt;refcount in 
          amdgpu_ctx_mgr_entity_fini ?</div>
        <div>
          <div><br>
          </div>
          <div>Thanks!</div>
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

--------------EF078863894CBD0E26679AC7--

--===============1473584011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1473584011==--

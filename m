Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B81B8740
	for <lists+amd-gfx@lfdr.de>; Sat, 25 Apr 2020 17:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD856E29A;
	Sat, 25 Apr 2020 15:03:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7096E29A
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Apr 2020 15:03:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y24so15114548wma.4
 for <amd-gfx@lists.freedesktop.org>; Sat, 25 Apr 2020 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=PbajBbPqY7DdWsb/hymkGEjWecsWl47sK8q3l04fWB8=;
 b=eRZPxl0DgoQ4nHqW55LzxBTNGxks3WqNrJaqh8Nrt6utvddDOC5Cdt0QVlo412+ADQ
 tV+mq7AfAXXyWjE7aEN+i3ixiFHpRMeDJulIDLPiHkXdxVxnQCFQQyM+lS/H2xKgxWp+
 uokY+aZv4t1LbeQnn1uxeD8cQp7/mKhyulX8qABTeb1cP/4CeNw5UGuj68juV6G+zYah
 4MfEOXUYu1QsOzyplHN5T3QJe/+7lyWfQtsRe8jCU5ZyrY3D0cVRt1ZmHgnVGV7Lr3U/
 II9YCQlNDZjUbuA5b8rv/PbCLFzkihBvX9SRRYN6cIMI70OCxjImhXIEwqobaRq1mOGS
 L6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=PbajBbPqY7DdWsb/hymkGEjWecsWl47sK8q3l04fWB8=;
 b=r73zqnB3aXhYcWnAx0U1LwNyNWN7/2749hG8js8+VHCf111z9xB9VJANF2CthjUovj
 yREMb/7l6ytsL3jtOki87Uu10WxpYams2iRszwACkLq4yOmMDKawJyb+wvQtBniPMy7q
 igcNFbTgHHZegLLL3H83boB/w/dmOpuyXgbdJ18R3gulyPu+fBs8nhhiHjj/XtZmkrkl
 xNmLhjdW9Ci3DEz0VaBCv34ipsZ7HKFDGitKy69XGJBCLoKXnrXjL6BVjf1cxdRPdeWZ
 G5TO60HH5PFj35pYO4DHP4YzwyJlCiuvs+dcCGLcI7o1kFpY/MmbYnDYlh9h3yVMU0Gt
 KGyQ==
X-Gm-Message-State: AGi0Pua41pQKAcW7kKTK2gB2Jx7GbUU49rwVMYc836wecKrsKDKZprJV
 aXvBp6ElMjCS9NuZMVas3FA=
X-Google-Smtp-Source: APiQypI5p/ZbtLmkfaeS8G8Q8e6m87IBKfXNAbKtx1lTg6Ff6Woec/nyXKfgtW2VGv4PZbq+EKj6/A==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr15774135wmi.98.1587827034521; 
 Sat, 25 Apr 2020 08:03:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x13sm8129094wmc.5.2020.04.25.08.03.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Apr 2020 08:03:54 -0700 (PDT)
Subject: Re: drm/amdgpu: apply AMDGPU_IB_FLAG_EMIT_MEM_SYNC to compute IBs too
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <CAAxE2A64Z91LiB9FduJf-8OO3He+1gZ9sxDfD+BVwc+-9Z7BnA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <64c5a883-1933-c494-7a93-dc19e0bd0445@gmail.com>
Date: Sat, 25 Apr 2020 17:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A64Z91LiB9FduJf-8OO3He+1gZ9sxDfD+BVwc+-9Z7BnA@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0751484354=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0751484354==
Content-Type: multipart/alternative;
 boundary="------------9008533160CDDB003427D19F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9008533160CDDB003427D19F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Was that patch set actually merged upstream? My last status is that we 
couldn't find a reason why we need to do this in the kernel.

Christian.

Am 25.04.20 um 10:52 schrieb Marek Olšák:
> This was missed.
>
> Marek
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------9008533160CDDB003427D19F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Was that patch set actually merged
      upstream? My last status is that we couldn't find a reason why we
      need to do this in the kernel.<br>
      <br>
      Christian.<br>
      <br>
      Am 25.04.20 um 10:52 schrieb Marek Olšák:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAxE2A64Z91LiB9FduJf-8OO3He+1gZ9sxDfD+BVwc+-9Z7BnA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>This was missed.</div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9008533160CDDB003427D19F--

--===============0751484354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0751484354==--

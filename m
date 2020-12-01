Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570B2C9E5A
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Dec 2020 10:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF716E4CA;
	Tue,  1 Dec 2020 09:50:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793C66E4CA
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 09:50:47 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id d17so2813571ejy.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Dec 2020 01:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=J6fJCdBKxrlzZMMN68vSXLHqxULdxNtNaACs6RCGgRE=;
 b=WxYtELr+xceitlky3N5hEzo/Bl9C8t6Tto8mpsE2/Z7bXetajMS4XrINnfRQIgTzKj
 bQc5KiL1UKLGwpMhJLGnNh16hCHUwtN/mrfzurazahzHDxHXr97ILILk8yCC21B9mp/o
 D+U1e3F9rmHr+xYv7RJov1UXCi5SvaHTJzH0ewhxUNC1szsT97ESO64XfwZM9lBoFJ4m
 Rnivgl5YzA2UETNJvzWL62uorewQ/GySFh82oIaAB7ZflAkAzYzHViUdsKSrj5KDE/As
 gJeRP+TT2OLalAA4tnnR0KphfJRu/s+PSo/ujJVsMS4dByKH6wjhDJkcZqD1CEE7vMbc
 sdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=J6fJCdBKxrlzZMMN68vSXLHqxULdxNtNaACs6RCGgRE=;
 b=W/ON1xVnK1XVWRVMPQUc+zfH1rroJCNJW844aOBzqqvmQIeTGjzQTMAOW6/4+x+hLn
 aRR6VDgXUN/NQVpq7HzqkvspuCQEnb7dyjxZ13kbqX7z4ft2qDEKVyOhxAhQkxo8COhB
 EsVaXVzynFLZHoMXZzbiScy40YlYR0e2RWYtp3kh07Qlk3uh0g+8mcnwbft9ITLZEgtz
 ADGS4psA8YC3ZhkGaFXzAMXXFVjQAkwPPxrSNbSQ7lUJROCPVqkHJAZ9LBgssAsKwXY/
 Uv++LxRoKgH08YVlNq3txDqj6ZziO1WHJLwEcNB/UUUtLCuEvvzafI2ZdCjpifkHIDAX
 MeIA==
X-Gm-Message-State: AOAM531/zDG74hpjWs9DGk94/8QJjXELtXLUoNzQDViVHoxfIYOqPXMY
 0zmI53vpSuvpsRJplTrBIMv+k9amjME=
X-Google-Smtp-Source: ABdhPJzBM156SSLxOE40+dPuCyi8ZxuzUUI6+wwL9b7VvC7ps+pyaUbF4HlDY45yG53khW4n5VT53A==
X-Received: by 2002:a17:907:6ea:: with SMTP id
 yh10mr1223650ejb.29.1606816245936; 
 Tue, 01 Dec 2020 01:50:45 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d14sm548369edu.63.2020.12.01.01.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 01:50:45 -0800 (PST)
Subject: Re: [amdgpu] Is it possible to disable page tables and use the
 physical address directly in amdgpu
To: Smith John <ls.cat.kth@gmail.com>, amd-gfx@lists.freedesktop.org
References: <CAGztBWUy6a8oB9PuF3YmqKN0DdqXixTmxThyK0+BwTMFWYtTww@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ee60c997-1c5c-cda1-74da-ed40c3ce6dcf@gmail.com>
Date: Tue, 1 Dec 2020 10:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGztBWUy6a8oB9PuF3YmqKN0DdqXixTmxThyK0+BwTMFWYtTww@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2057171500=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2057171500==
Content-Type: multipart/alternative;
 boundary="------------735C0D66BDB9ABD41EC4671D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------735C0D66BDB9ABD41EC4671D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 01.12.20 um 07:58 schrieb Smith John:
> Hello!
> I was trying to figure out the impact of gpu page tables on 
> applications' performance. I noticed that there are 16 vmids supported 
> by the hardware /Vega 10/. Is it possible to use physical address 
> directly in some vmids, or use physical address globally?

No. VMID0 is used by the kernel for jobs like copying things from A to B 
and even there we use the VM remapping functionality.

Regards,
Christian.

>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------735C0D66BDB9ABD41EC4671D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 01.12.20 um 07:58 schrieb Smith
      John:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGztBWUy6a8oB9PuF3YmqKN0DdqXixTmxThyK0+BwTMFWYtTww@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hello!
        <div>I was trying to figure out the impact of gpu page tables on
          applications' performance. I noticed that there are 16 vmids
          supported by the hardware <i>Vega 10</i>. Is it possible to
          use physical address directly in some vmids, or use physical
          address globally?</div>
      </div>
    </blockquote>
    <br>
    No. VMID0 is used by the kernel for jobs like copying things from A
    to B and even there we use the VM remapping functionality.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAGztBWUy6a8oB9PuF3YmqKN0DdqXixTmxThyK0+BwTMFWYtTww@mail.gmail.com">
      <div dir="ltr">
        <div><br>
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

--------------735C0D66BDB9ABD41EC4671D--

--===============2057171500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============2057171500==--

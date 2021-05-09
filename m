Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE5377773
	for <lists+amd-gfx@lfdr.de>; Sun,  9 May 2021 17:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9D76E226;
	Sun,  9 May 2021 15:53:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2066E226
 for <amd-gfx@lists.freedesktop.org>; Sun,  9 May 2021 15:53:09 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 u19-20020a0568302493b02902d61b0d29adso11481269ots.10
 for <amd-gfx@lists.freedesktop.org>; Sun, 09 May 2021 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dATx1wjj0Z53Rq4bLdtp/Zi4E4zS2rFOkCq9fFzzQIY=;
 b=dn4GHdJi5eXn+M3wbtv34RwqboyDSlhlj9dwuGVxycTj5Q3VJ8d0b/IplaMSWrlf34
 o0+2HS8Y5IU/r877bN0dXVN2Z0ZQUAInd+TZsdx2h477A6uDgkLR0mfQBjWYqeczv2iM
 CaeGdCuQXtEKTzmCUS00VN+yywDWkF2WPKkcG4ZVIP361+lkE7fWNkWsdEOTKt6+eHnC
 mKfNjiW852ffhnGqJKj/eckSTqyRhc3j525Lfrjh5T3sdKlim6m+kVU2LHjM5MfKCxF9
 2fO+331/HgixhursXJEcctnH3/wtX0qTTT8bo27uQdciMwdnD0kVBNTHR0dahuUI4krP
 kgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dATx1wjj0Z53Rq4bLdtp/Zi4E4zS2rFOkCq9fFzzQIY=;
 b=jYaARZpweqwGgBySQNG8yxZwvYnwZ8US6HOQOvAuGSOt+U80wZjQ1IajhFaF/YaO6Z
 fRJup+ZEMn0EhfQOcAF2WFstxlVw1CFFK3ONKmEFRdryrFguQXBr3P4givN2sqokPqsD
 bhhfkSObDugzLa7ctBZLPsYpLFACHajQevLVoAUjN16jPsfgw4PEkVxHy5Io8jssvMC+
 yJSnYRTzkeqhLkLjFdEwUoee6i/16GQkjSof1uEYtxzXrX+WQrI/Wb8Tb7+0IOiYqoTw
 r/Zyvy2pK1/xCvtPA3EqjinI8aknmXyVG+0iOhzY+pLC4l1da8+Jcwt9ZixhkWakjQxQ
 Wsdw==
X-Gm-Message-State: AOAM531GIx1OM6T/xpECqiSRPS4YBxNjSFQ0z1ptVWE4E0wkhsQRpAXC
 QePkOWpyw4VvvFFVTYf4oLRqc504VVAzxPBSe3s=
X-Google-Smtp-Source: ABdhPJy7YC3ELZGgsRsziWdYDQrUqAeDkBKLT/CKNXiru3bd60LWNuzmdtOAprAvGHg6y2w9TZjoTnUbLrYZnZGDAK8=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr1601380otl.132.1620575588643; 
 Sun, 09 May 2021 08:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210414233533.24012-2-qingqing.zhuo@amd.com>
 <20210509121055.24728-1-youling257@gmail.com>
In-Reply-To: <20210509121055.24728-1-youling257@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 9 May 2021 11:52:57 -0400
Message-ID: <CADnq5_MF0y0sHH6Vz8KZH5j=iXToq3WPw7+kW=BqMk=oNZ=Ppw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "Revert "drm/amdgpu: Ensure that the modifier
 requested is supported by plane.""
To: youling257 <youling257@gmail.com>
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
Cc: Mark Yacoub <markyacoub@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Wheeler,
 Daniel" <daniel.wheeler@amd.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, May 9, 2021 at 11:42 AM youling257 <youling257@gmail.com> wrote:
>
> I using amd 3400g running with android-x86, this patch is a bad commit when i use android-x86 on amdgpu.

Can you provide more details?  What sort of problem are you seeing?
Please provide your dmesg output.

Alex


> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

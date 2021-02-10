Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED2316907
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Feb 2021 15:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D99C6E328;
	Wed, 10 Feb 2021 14:24:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D4B6E05C
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Feb 2021 13:48:45 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id g84so2065574oib.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Feb 2021 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2QFXyBDxvFiVCA1VEEfR64iOGKZVu759kYcPbTKWOLQ=;
 b=ne5qQ6ANRPizw7WgLnae3b3D1twGdTv0y6Qs5I3HOXEj/aiiJo3p390fKwpBFDZF++
 1dNWfTQKxAnN3d8VqHvNIJdiiGuNpat4PDkAbJEN5eKJfKVSVcKcPQ3TkwN8PIrjGh0E
 kc5h6l4sFQXDDwZ1wNbMiwTpEz+FuXCRfBja5D650B7ltQe/VT+6E2SGBw1JUwvlW3Gv
 JJtYWCAmsy9jEsifiZuugO+Xkho0/+K9k7hf+3K678zIs09hiZXh70I+JdFM30+7d7p7
 716XYVtVQrgh8rnnextPycM8o3lv7QpIwEKCavC2DXwE1KTRQ5kBmPf1szurEMRJiMTZ
 RMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2QFXyBDxvFiVCA1VEEfR64iOGKZVu759kYcPbTKWOLQ=;
 b=qOfok9URImAHIcTJxcfuoLJK3hRB/3cZeHDlJEImdmvgRZEID9XKf6L3GdYnq4/U5h
 RupwhQbJBgKUl8mD3NkXdSrcx4vH5xw8ZuTImXLo5bvCFe4fPEx3Z99UzD8fgE5HteS3
 ephQUuHkImox+0rXs76WRdmi65ZEq+0fOlIMbM8eg8QbDmUOgnl81rVMRKBcU1z/AG7d
 mQ1tu3rrspShoJvcCydLroGTjEd0so4sGAi5EWbTuNLo6LN7AoK+7tRk9+mHnfZ96mOd
 +/X1+5p36wetCseLDFcNLHVLTqC76jMFL7pvyWlHTmvNZWVf5O5OTOFODUDIUX4408MS
 1QKQ==
X-Gm-Message-State: AOAM530LieCQjHK0VsIuIACPT3nlfaYJPYogCIuU5JCzBZjVjmDDjwAf
 CXq6eQiINAOnN/4ZVvOSydYuY01bnnlEs9wAuiQ=
X-Google-Smtp-Source: ABdhPJwUFMIq43j6+xe76YzpJ17DLVatBgMSzxfK7VODwDTUuEbcdcwFESe9vYW63Cp7gvLIuKKp6+bnwf76fVuo3Cg=
X-Received: by 2002:a54:480f:: with SMTP id j15mr2148525oij.50.1612964924887; 
 Wed, 10 Feb 2021 05:48:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1c7d:0:0:0:0 with HTTP; Wed, 10 Feb 2021 05:48:44
 -0800 (PST)
In-Reply-To: <CADnq5_NF=Q3V0FJNC5ev3XKoewm8bekSDEycXCwKTf6KX+xopg@mail.gmail.com>
References: <20210129212752.38865-6-Anson.Jacob@amd.com>
 <20210210025742.7855-1-youling257@gmail.com>
 <CADnq5_NF=Q3V0FJNC5ev3XKoewm8bekSDEycXCwKTf6KX+xopg@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Wed, 10 Feb 2021 21:48:44 +0800
Message-ID: <CAOzgRdZVKNT6VPD75P9Yjvo0_7SC6M8qGaKY21pnFoNAazCAQg@mail.gmail.com>
Subject: Re: [PATCH 05/27] drm/amd/display: reuse current context instead of
 recreating one
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Wed, 10 Feb 2021 14:24:37 +0000
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
Cc: Eryk Brol <Eryk.Brol@amd.com>, Anson Jacob <Anson.Jacob@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <Sunpeng.Li@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, Bindu Ramamurthy <bindu.r@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

test drm-next branch, can reproduce this problem.

2021-02-10 12:43 GMT+08:00, Alex Deucher <alexdeucher@gmail.com>:
> On Tue, Feb 9, 2021 at 11:02 PM youling257 <youling257@gmail.com> wrote:
>>
>> From: youling 257 <youling257@gmail.com>
>>
>> This patch cause replug hdmi blackscreen,
>> https://bugzilla.kernel.org/show_bug.cgi?id=211649
>
> Can you test with my drm-next branch:
> https://gitlab.freedesktop.org/agd5f/linux/-/commits/drm-next
> Are you able to repro the issue there?  I wonder if there is some
> additional commit missing from 5.11 that causes the issue compared to
> -next.
>
> Thanks,
>
> Alex
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271D328047
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Mar 2021 15:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0D6E038;
	Mon,  1 Mar 2021 14:08:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685126E038
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Mar 2021 14:08:16 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x62so3857427oix.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Mar 2021 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d22xQ4B/EpvdqSJUSmxmRA8jPVONHaX1K1mjEpXeWLs=;
 b=fnaDOxKaLhog6zovvdC06eEHgzxuwsvsmJx9sBElTlo5zNd+vw5oWXLPOis9JzCd9c
 UkYzUJEGxk8lWRSp+UtWt51Bj2t+oKah0DhMByRAzK6gXdDMmPQX4988/+kNah9AnGD8
 wm+Qml2QPY3qlc9/trkJ439S+Hd/PyE6EE5EEHBZN2PZ9Wj1JrzDh5QPueiZC6R1ccq1
 u90T0nTge29uCfa1+G4S9uR2VWRTjwjj4imeG31eO9zAtNjZ+6zOylC9pXG8i947t16/
 0Alne9CuF9WGn1FfEYk+6/8I0YkAS/Ili3ObkBUJJMgp8BV6u7WKa4YyIaMkYnrCYc3w
 52wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d22xQ4B/EpvdqSJUSmxmRA8jPVONHaX1K1mjEpXeWLs=;
 b=Necfr9DEoK0VCvviZPFSnwac01ZNBw7EmbDuzRwFymlvn7xFvAeiPfPWgHOyefssFX
 mkwp494CKAI0+hg9VP8uGSL86a9n9Uvx50rA7WiI23HOQYllhgrr833YFXQrU9rNqCxu
 yy9HWNmwy6hhMZNOfXemfxR5m/sRjCcyswEcV09FgLzaJndvHgvLcpWQd4cGZRZYBPdH
 II/NRSFDEDZhgDJsUCUGOGlXXA0+K2390KyE2O+BYlz+EIfC9bolzcO34wTRDDu71Uru
 0HOT/Dyk2jszmH5ccviFUfGDWVrwmp5+iX6oam0ZKEv2I7D6rvBq3WSpYacvMlqkzmQy
 K49A==
X-Gm-Message-State: AOAM533NIQUMP+wKLeahjUDxpaPaJmGtrqgZF5NUzNXZjVeHZkFAezW7
 3UzkAJjZT8oFUnsi5cLKDNqg1X5j4UATb1QmArQ=
X-Google-Smtp-Source: ABdhPJwDlWjmmLpVVPm3pR617at+gkkf/hSHWfLiKyeDOWUmaP1o26He1CgVWYNfBFAOwiPLc3NvJUwmGHQ05lDu5+I=
X-Received: by 2002:aca:f485:: with SMTP id
 s127mr11621077oih.120.1614607695730; 
 Mon, 01 Mar 2021 06:08:15 -0800 (PST)
MIME-Version: 1.0
References: <CA+gx7UpBhKc0uwLhtN6ZVjWbMJuJYSJ9mQwk_fHtEikh6t3oRQ@mail.gmail.com>
In-Reply-To: <CA+gx7UpBhKc0uwLhtN6ZVjWbMJuJYSJ9mQwk_fHtEikh6t3oRQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Mar 2021 09:08:04 -0500
Message-ID: <CADnq5_NKBP5LivfoSn=Cbc41peGinieJJn_Cr8OqDptrKOjW1Q@mail.gmail.com>
Subject: Re: 6900XT HDMI 2.1 -> Missing 4K120Hz
To: Adolfo Rodrigues <adolfotregosa@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 5:48 PM Adolfo Rodrigues
<adolfotregosa@gmail.com> wrote:
>
> Hi.
> I cannot find a way to enable 4K @ 120Hz over hdmi 2.1. It seams limited to HDMI 2.0b.. is it ?
>
> Under Windows 10 it works fine but not under linux. Why ?

See this article for more background:
https://www.phoronix.com/scan.php?page=news_item&px=HDMI-Closed-Spec-Hurts-Open

Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

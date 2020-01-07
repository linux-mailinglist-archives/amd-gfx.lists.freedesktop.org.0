Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF96132ABD
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jan 2020 17:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902396E0EB;
	Tue,  7 Jan 2020 16:06:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32C6E0F6
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jan 2020 16:02:09 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w127so43061284qkb.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jan 2020 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m5L2Z7dBLaHFaGhh6t90np+r+vB2C1fkHc9c1XkE5eA=;
 b=SRKTOX73kQ0C7bZJyVEQPX5lrHCfn6wtB+TUgnlKYaqAcPOJxRX9W33hvgPLf/Cqni
 20bWZcvpVtp+u3kVVCy8Pr6p5WX771zG/aaYNm3a43PBoZMEWPkVUdafi6z8zdNbP875
 wtMMQXxTZrS4EHq5APXk2wYx3oJy+7yGEHag0xh0L78KeLuZ6Up0ZEKAeisMiKKEo5bD
 GnoA9zsPeHtXte1J8C12L3Ve4R2yJhPrmNnqIh1xILeh06Iq5UCkFiirkFczmkS1Durt
 VPuB0v7XEVsThI6kRHNHza1+1T1XUR1zTV2kSimviYK2TK4yxqHmw1gQJk9t+jf8ah8+
 YhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m5L2Z7dBLaHFaGhh6t90np+r+vB2C1fkHc9c1XkE5eA=;
 b=suxNhH5dtn2vqa5jqs1YfWgCXS2tfKsa6NAsBI45mabsFL4Q4sKfIHpZiOtd9knxvU
 l+sLIjVjGi3tqdrV/m5n+WLDrinn/Bwha/v4ZoLmrgF9Zt6LhmqEB1CTnoaOySjxBF5b
 wmt+cZlciy4aDzBxqCL++kNW9zYCc1fXCSi6ewip9inv4WUhxMRsVYE+vZfG0dLnqffl
 SFFl6HB02QE1la+enpn26uBa7w4hlWrtNITkBIs/ZopzjippRuVeJUTuHXx39bnk8CGF
 9JOCSDgmNr1Zp8vS/fdVIG/krJqaRh9Qk1ynHKLWSl2dfmYW5EsR25JXa5zSeLY1ju0U
 yi4Q==
X-Gm-Message-State: APjAAAVsQmkcD6Wqhpo9MdkvGTjMUUM/eE7Lkqv+Tos3yx9ujd0IX2KL
 yzt6x6s7xlVMGmwVYZTzzhUUlBrTKJ15qLINttZSGA==
X-Google-Smtp-Source: APXvYqzUW7seMxUlfo6okJae/fU1ZwL/kM+/uzTVDw6txhjzZH1cXINZE4qkaz5ynFXQaozCcU2Y+HQm3/FNG88d/6Y=
X-Received: by 2002:a37:e312:: with SMTP id y18mr18264qki.250.1578412928223;
 Tue, 07 Jan 2020 08:02:08 -0800 (PST)
MIME-Version: 1.0
References: <00000000000082b80f059a56da1f@google.com>
 <0000000000002074ef059a5c86e2@google.com>
 <20200107154755.GB43062@phenom.ffwll.local>
In-Reply-To: <20200107154755.GB43062@phenom.ffwll.local>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 7 Jan 2020 17:01:56 +0100
Message-ID: <CACT4Y+arQyPjzHSFy1MkVF2jNPJbu262_FTL5ma9AnWkXosY1g@mail.gmail.com>
Subject: Re: INFO: task hung in fb_release
To: syzbot <syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com>,
 Rex.Zhu@amd.com, 
 David Airlie <airlied@linux.ie>, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, christian.koenig@amd.com,
 david1.zhou@amd.com, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
X-Mailman-Approved-At: Tue, 07 Jan 2020 16:06:15 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jan 7, 2020 at 4:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Dec 23, 2019 at 02:31:01AM -0800, syzbot wrote:
> > syzbot has bisected this bug to:
> >
> > commit e3933f26b657c341055443103bad331f4537b113
> > Author: Rex Zhu <Rex.Zhu@amd.com>
> > Date:   Tue Jan 16 10:35:15 2018 +0000
> >
> >     drm/amd/pp: Add edit/commit/show OD clock/voltage support in sysfs
>
> Pretty sure you don't even have that driver loaded ... from the config:
>
> # CONFIG_DRM_AMDGPU is not set
>
> :-)

Yes, it seems the bug is very flaky and flakiness changes over time.
And this is combined with non-deterministic kernel build bug:
https://github.com/google/syzkaller/issues/1271#issuecomment-559093018
It builds the same kernel, but gets a different result, so it's like
"nope, this commit very much affects the kernel so could be the root
cause"...




> Cheers, Daniel
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b5a799e00000
> > start commit:   c6017471 Merge tag 'xfs-5.5-fixes-2' of git://git.kernel.o..
> > git tree:       upstream
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b5a799e00000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=16b5a799e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=7f6119e2e3675a73
> > dashboard link: https://syzkaller.appspot.com/bug?extid=d130c4a0890561cfac5b
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b1925e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b9623ee00000
> >
> > Reported-by: syzbot+d130c4a0890561cfac5b@syzkaller.appspotmail.com
> > Fixes: e3933f26b657 ("drm/amd/pp: Add edit/commit/show OD clock/voltage
> > support in sysfs")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20200107154755.GB43062%40phenom.ffwll.local.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

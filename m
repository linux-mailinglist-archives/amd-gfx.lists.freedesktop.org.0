Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34623C95CB
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Jul 2021 04:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D996E44D;
	Thu, 15 Jul 2021 02:02:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DADE88BE3
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Jul 2021 01:42:36 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m68so3663589qke.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Jul 2021 18:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FUxAzHWKcppcqyozhSrS7WYW3XLWf8rHYlLyIX3foUY=;
 b=FheZM46DfKvLquIMlC/wTve1Wd6zDZcIsOUIQVdprhYm+TMBoYdPYbBmCp+0qFqzmT
 NwiCRxnDQ2n7JF6t4h5m/EeO6Q7hmJKFRAoECp0ygb0JkT757tiEN2ItouXqUmCvykBd
 kFdrT7jcK+/xqlygDhmWmMnemRszYVbG5gDuWs/g0viIm7r8+saMrIZm7evAyzEZVkXs
 6JC/Ti/41Sxl7x7d/gLjbcYbydTwNioSy51/6ammqxFHNqNsZ26UO9PAGggucviIAR4n
 HVLtTAohhL1CViuX3wVpLP1zXVuKaihzufXOjEVy8FUrq9zvr5uxRmF40WzHp1iYh7GG
 Gk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FUxAzHWKcppcqyozhSrS7WYW3XLWf8rHYlLyIX3foUY=;
 b=C2Ja07M2dMqJDf7K80fowUpI1eVf5wo2XLCVmU65MNLhT3bhPpwoCBkB52lvyWSr6Y
 /5MKUFGPtniTqsgeXIIZ4zgQhEN8Y6cXRXHTfH6wKVFdyHGkTIdsw/btG37Ybjx6Mtij
 h30sA0gqtSPKXZRAW9py5TlfH4fmkvqPN4HS1+RqJB4RdD2OtvrxmMXczJkRrXWN9Af8
 fKLBERqIvbsngfpR48eNb2PbVMccSWAzZR0WRAUXxg3Dm8Cvn18q8A4nWAqCFA+N/Ikn
 cyOKczlIA5XSNmXcFF4LVysvldfQechw+Mtv7KUtUAlKUYiOOOH/HbSKdm2JXzltThY3
 WSkQ==
X-Gm-Message-State: AOAM530K5AyLoQ7gh38kEgERMeTniwGtUswAvukiJC1LI35ajJfCL4Kb
 bBdxxMCBF8DdOPlyINMU0ZU=
X-Google-Smtp-Source: ABdhPJwYc5eMNDTT+FrAqVuGtuyXxh4hnFYzLwEFVH+NLDw/AVwTDLNxmT63RsZUzZVhZyuWwez/GQ==
X-Received: by 2002:a05:620a:410a:: with SMTP id
 j10mr1036631qko.185.1626313355285; 
 Wed, 14 Jul 2021 18:42:35 -0700 (PDT)
Received: from mainframe.localdomain ([139.193.230.49])
 by smtp.gmail.com with ESMTPSA id o126sm1809497qka.74.2021.07.14.18.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 18:42:34 -0700 (PDT)
Date: Thu, 15 Jul 2021 08:42:21 +0700
From: Ketsui <esgwpl@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: AMDGPU error: "[drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
 *ERROR* Waiting for fences timed out!"
Message-ID: <YO+SfRmqlFjWAORe@mainframe.localdomain>
References: <7f461adc-8868-0b76-cedb-d8be8d527218@daenzer.net>
 <YOqiQmAUTBWjbVb6@mainframe.localdomain>
 <CADnq5_OLvV9LoNTFsiCi_Cm1-zYZmRyLvyCK59Kn7rZzrndXPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_OLvV9LoNTFsiCi_Cm1-zYZmRyLvyCK59Kn7rZzrndXPA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 15 Jul 2021 02:02:25 +0000
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 10:40:30AM -0400, Alex Deucher wrote:
> On Mon, Jul 12, 2021 at 3:18 AM Ketsui <esgwpl@gmail.com> wrote:
> >
> > > So far, so good; no hang in a week. I'll try the rest of the new firmware as well now, will follow up if there's a hang again.
> >
> > I've noticed that the VM_L2_PROTECTION_FAULT_STATUS error doesn't always result in a hang, looking through my journal I can see
> > maybe a dozen of them spread out across multiple boots but my system only became non-functional like two times so far (I know
> > because I have the dmesg when the hangs happened saved, you can find them attached to this mail).
> >
> > To make myself clear, I haven't actually had a hang too with the new firmwares even though these messages still appear on my dmesg,
> > sorry if my feedback gave the wrong impression.
> 
> Were these issues mitigated with older firmware for you previously?

Yes, I'm currently staying with linux-firmware tagged on 15-03-2021[0], I just checked my journal and the last time
I got the error was 12 days ago when I was testing newer firmware.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tag/?h=20210315

> 
> Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E93E150280
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Feb 2020 09:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EF16EB56;
	Mon,  3 Feb 2020 08:27:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04766E162
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Feb 2020 02:52:07 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id a142so13346975oii.7
 for <amd-gfx@lists.freedesktop.org>; Sun, 02 Feb 2020 18:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=m3kqulB4MngJzin9Ox3IxUFiL7JWpnNyf3px828cI9I=;
 b=WEhZuzpr0zqxBfAdiMmo162jSEqkoSPQCtQuglEDK3KGMmdwPzUm1EVEpFSQJV/TYK
 khAAcxJF12aBLZ15oVreQ3WGBX/w01hiOfzQnqib+qgPv1VBnD6obDkblfyFz6Xjil++
 6dBXh0hXcpgEklWwGR+UxDP281nE4bF0MEBf3cM5M0inRnsckAxKqNeGAm+R+Zr5DAhO
 PaK56MTU3m5lIhoO7PKFxnwG/rZaVVs5tSotC+o/W4nlPKsUvNvC7f0yY8iH/gjo5oaI
 OjBRxeki0bssuup7c+Xcn8CKZwv6GdmGpQjZy7wWFCCycVAhUamsyVPuyMaPZvR7d6/g
 EtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m3kqulB4MngJzin9Ox3IxUFiL7JWpnNyf3px828cI9I=;
 b=FmsLKx1ujF9u1xitenLHiCDmYQlopw9taAi+FhIjkQZW4frvTbqo8P0sxTMzZmBp0k
 ryDOFv5bFkJ3oGHkY32QRi4ZIRnAKT0JZHXard3pM7kCkLgGDiRL5BZJJ76uwnutTycV
 iLuTlK+0ZEQTm6JVXPVKv8XtVG70UJg9/S6y2n1JiUxmQeE4jjIoRnOCpxphDZyWo0Qe
 +YndcD9Hpf4hiqrsyMMuj3TTKf02Img6u13xlY6ta0Ekv2JOAn2y2wvgEmNb/OIZEhV+
 8UMMtjQYufwPECkpgzYMOcm91hbRxlPsvI2mxlkdGAiI3jl6LIC/R1YoRCHlKOzYcO3l
 bU5w==
X-Gm-Message-State: APjAAAW+X3ijahWIINvyVMbzt4yI4z/KITTeryZ8s9T8mCdyB2CKFu2y
 r0eZHZfK2ISchs2B7ep9S50I4vhCubCMCfWoWtqJRQ==
X-Google-Smtp-Source: APXvYqzR4MJugY/OI14PtGDvJ0VO8gTgpvqDvh02A7Zez1TARi1UwJAAHQMpF36qjXeS4roAF5y840azkKd0Mk6+wHw=
X-Received: by 2002:aca:3017:: with SMTP id w23mr12757003oiw.152.1580698326953; 
 Sun, 02 Feb 2020 18:52:06 -0800 (PST)
MIME-Version: 1.0
From: Chris Chiu <chiu@endlessm.com>
Date: Mon, 3 Feb 2020 10:51:56 +0800
Message-ID: <CAB4CAwd6AanNEMyKDmkEPREbqUA_Q_iQ2oJ_UUw7rhFvk5eWfg@mail.gmail.com>
Subject: Fails to lauch X on laptop with Ryzen 7 4700U
To: Alexander.Deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Upstreaming Team <linux@endlessm.com>
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:27:45 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We are working with new laptops that have the Ryzen 7 4700U.

It fails to launch X so I can only access via the virtual terminal.
I tried with the latest mainline kernel and kernel from
https://cgit.freedesktop.org/~agd5f/linux but no luck. I also boot
the kernel with parameter amdgpu.exp_hw_support=1, but
the system freezes after loading amdgpu and I can't even switch
to the virtual terminal.

I post the bug description and related information on
https://gitlab.freedesktop.org/drm/amd/issues/1031.

Please kindly advise what I should do next.

Thanks
Chris
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

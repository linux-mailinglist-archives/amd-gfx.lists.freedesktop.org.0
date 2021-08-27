Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09D3F9AAE
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Aug 2021 16:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19589F2A;
	Fri, 27 Aug 2021 14:12:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E617D89F2A
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Aug 2021 14:12:55 +0000 (UTC)
Date: Fri, 27 Aug 2021 14:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630073573;
 bh=8Ls93cNCjrkdeJMDBZAgSWQK6+Ar2qSHrZ3tRbRzvxs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Y4MQW70xgCUDTJEQZMx+arERONlktyrzh3Gcmw6/EAfiXvsvS2sf/UhWMgt5L15ib
 kxQk3rcX4Dt2NH9dz+RXjPm5up/A4hYGqh2PXcd6AaQ4039Ti4PmZ3F/jhn7YZ8dk/
 YJcPCJs3+RgjWOtkAPDhIyrVg/bUlq8/nhG3W7hBGWvr8kELc6Tgoaw8zcneZqXqEU
 pWf4w9N71LDLQVy8LD5esS5li8kyJAfwczEVygjr25N9WHX5tHiGaTzEvlCH1rolSV
 KbzB41pixeCA8IFL9zck1bLw31cQTZ+OCnW6B2muPUi+Te5svgHX5CuKz+5AP0Dwww
 YNJLKuMacKxFw==
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Hersen Wu <hersenxs.wu@amd.com>,
 Louis Li <Ching-shih.Li@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: Fix two cursor duplication when using
 overlay
Message-ID: <3qY-QeukF_Q_MJeIXAuBjO4szbS4jRtqkTifXnbnN3bp88SxVodFQRpah3mIIVJq24DUkF6g0rOGdCmSqTvVxx9LCGEItmzLw8uWU44jtXE=@emersion.fr>
In-Reply-To: <92c13bba-b86b-b943-5433-b2b822283774@amd.com>
References: <20210414000604.3273048-1-Rodrigo.Siqueira@amd.com>
 <SrcUnUUGJquVgjp9P79uV8sv6s-kMHG4wp0S3b4Nh9ksi29EIOye5edofuXkDLRvGfvkkRpQZ9JM7MNqew2B3kFUhaxsonDRXprkAYXaQUo=@emersion.fr>
 <20210818131824.avczlw6ie3tfs76j@outlook.office365.com>
 <Hm33HvRokytajvNBSyeseBTVWScQu0mPJVLvRcABYsahB6j3DjJwvelk-WgnIA2AlG1AU0wnGV3gvAgzDf5nmWYRjIS58gMjtdrG0m_kjhA=@emersion.fr>
 <ffd29136-d0e3-17a9-f01f-e81c44ae0284@amd.com>
 <7a1d1909-cead-16ef-7b22-b2adc0cf3ee2@amd.com>
 <v7wPXeGl1gSs2otq7y-EJar0E_NLb4b6YxLZvzleaUPOy5jFuCOpuVFqTRWdGVJ7CP561cBXhfYy-TlQgIlX5vhxtqE64mBtt_cvtIyytXw=@emersion.fr>
 <92c13bba-b86b-b943-5433-b2b822283774@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Friday, August 27th, 2021 at 16:04, Harry Wentland <harry.wentland@amd.c=
om> wrote:

> > Is it possible to draw the cursor only on the overlay pipe (not on the =
primary
> > pipe), even though the overlay pipe doesn't cover the whole CRTC?
> >
> > Or will the overlay pipe crop the cursor image?
> >
>
> It will be cropped to the overlay rectangle.
>
> If you can allocate your overlay such that its destination rectangle
> always spans the entire CRTC you'd have no cursor issues. Unfortunately
> that means that you would use more memory bandwidth since you're
> scanning out an overlay that's larger than you really need.

Hm, yeah, unfortunately the buffers come from an X11 client, so it's
exactly the size of the visible area, I can't easily draw transparent
areas around it.

Thanks for all of the details, I'll think about all of this for a
while and try to come up with a plan.

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AD2DA8D3
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Dec 2020 08:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7CF6E162;
	Tue, 15 Dec 2020 07:58:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30166E162
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Dec 2020 07:58:28 +0000 (UTC)
Date: Tue, 15 Dec 2020 07:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608019106;
 bh=niwfFqsi/vR9UNnFy+D7dP3u1AwVgVD7WUzyN/Wfbuk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=TzEr3xo/f2mQ2n6/EOxTYYGkIUONkDeHVkoOOHI8/wwzz8lBcVpr5HmXpw3G9PTPm
 +ZA/B9cn5m1OU8yhHhgPteN0wITiFW0e56r0G6C4S40F+fSPRnHXYY1aLnQ0kB6tGC
 FXnG6bJAxwVaoxR29yXBj1prj41mbZliIEH5DW5eBrspX8pmYfxKHt0KEsknA7kICC
 WeecSMg+pbDy9pEybGHXNWf8qrHGWXRzT5+ErOzRvKJJ6oeinrcCzToLlccfEz1F+X
 1H2TB752v3a0nnO90FJpqrOb0W+6Pe+zeNJCET262AVRV1IlmG28NLp5+lZIDQmea6
 dtMZhnMwR4ImQ==
To: "Cornij, Nikola" <Nikola.Cornij@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Overlay issues
Message-ID: <05FNtjCma79AawCUxH3mqJ8sWHmoIXFXhQWW0N_b-mpl7QvuW3JN3AbtPUiR0y1LOf3tLhWFWv8YjuIEvJ3dci9y1EHk_D9a9L1BAyWyxRs=@emersion.fr>
In-Reply-To: <DM5PR12MB4679C807DB8DB502AC4793DCEEC60@DM5PR12MB4679.namprd12.prod.outlook.com>
References: <DM5PR12MB4679C807DB8DB502AC4793DCEEC60@DM5PR12MB4679.namprd12.prod.outlook.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexdeucher@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, December 15th, 2020 at 5:09 AM, Cornij, Nikola <Nikola.Cornij@amd.com> wrote:

> [AMD Public Use]
>
> Hi Simon,
>
> Just to keep you updated, I've reproduced issue '[1] - Overlay plane:
> position not updated when CRTC_X is negative' on Ubuntu using IGT.
> Seems to happen only with smaller FBs (so far tried 24x24 and I can
> repro, but 300x300 is OK).
>
> I'll look into fixing this.

Thanks for the update and for looking into this! Let me know if I can
help with anything. Nicholas replied on the issue tracker that overlay
planes couldn't have negative positions, so I was thinking of having a
look at the SRC_Y handling (see if we can do the same for SRC_X),
experimenting with FB sizes and SRC_W/H to figure out what's the
overlay max size still triggering the bug. If we really can't emulate
neg SRC_X we should fail atomic commits with negative SRC_X by
returning EINVAL (so that user-space can fall back to not using the
plane in this case).

Simon
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

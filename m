Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B212D2A1E
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Dec 2020 13:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF7D6E92D;
	Tue,  8 Dec 2020 12:00:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76176E161
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Dec 2020 12:00:19 +0000 (UTC)
Date: Tue, 08 Dec 2020 12:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607428817;
 bh=knWj8bm8IaBIqOaDY/k7t2Pl43RYoYrPLq7jc2SeGNY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=XjWZI+lbA4ZLL2zILP2n7Zg83H2Iz2m2zIRNxZgRNWbhh7lLWyRO/62n7PDbpQhhS
 R/HIE4dnjuLEmDS9PZ2ymnaPoJs9FRshSLhZBZP1EV05mC16YX/DQLPyQyaMrrJji6
 OrpJP462dfS73x/YLXeoM+/fFzYmgZXTCm4fslm68dYT1QgUP7+RZtyWaa9zevLtFk
 oV5z13SW1vbvuXw8cQiJi8AvZsC4hkPubsuX82VQCAm2IE4aaEkdoeiTtTUj7aO6LP
 TDjntrIbuCF+K112u6+Qcx4hhw2zO+p8LF3GyWIAI4JPWoVxt1O0iw6gjZbQCtA0Zm
 dgY8SUCmJgmKQ==
To: "Cornij, Nikola" <Nikola.Cornij@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: RE: [PATCH 2/2] drm/amd/display: add cursor pitch check
Message-ID: <vkqrs-73v441dUQBOsO7tDuuHoWp7_DXK8nx99ynWW31yDWo4Nf_Sg7zeq1aDOsZTIWkTWvsLIhha8Id9xWvqCAsl2Wjg8yki1sIn3OEwTg=@emersion.fr>
In-Reply-To: <DM5PR12MB4679A4125CA7B11387B58FF5EECD0@DM5PR12MB4679.namprd12.prod.outlook.com>
References: <7UvPE5okTSEaIRnrg3TJcnkyIBhPPRXCCuMa5wwC18@cp3-web-029.plabs.ch>
 <e1f8e29f-138f-9e1d-0ba7-ce10059f87d0@amd.com>
 <CADnq5_NmrL7=BsUZ-CGiA=0e7W83Sf5Dek9iOYCX7ji8aRJmQg@mail.gmail.com>
 <DM5PR12MB4679A4125CA7B11387B58FF5EECD0@DM5PR12MB4679.namprd12.prod.outlook.com>
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

Hi Nikola,

On Tuesday, December 8th, 2020 at 2:36 AM, Cornij, Nikola <Nikola.Cornij@amd.com> wrote:

> [AMD Public Use]
>
> Hi Simon,
>
> It looks to me I'm kinda late to the party to look at your questions under
> https://lists.freedesktop.org/archives/amd-gfx/2020-November/056032.html...
>
> Does the commit below and
> https://lists.freedesktop.org/archives/amd-gfx/2020-December/057048.html mean
> the above issue is now on its way to resolution?

Yes, I've figured everything out about the cursor, thanks!

If you have time, another thing I need feedback about is overlay planes. I have
some bug reports [1] [2] about corruption when using a small 24x24 buffer near
the edges of the screen. However everything works fine with a bigger 256x256
buffer. Is there a minimum buffer size for the overlay plane?

Simon

[1]: https://gitlab.freedesktop.org/drm/amd/-/issues/1385
[2]: https://gitlab.freedesktop.org/drm/amd/-/issues/1386
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

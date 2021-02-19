Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30031FE1C
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Feb 2021 18:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B946EB75;
	Fri, 19 Feb 2021 17:44:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 5110 seconds by postgrey-1.36 at gabe;
 Fri, 19 Feb 2021 17:44:20 UTC
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBD06EB75
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 17:44:20 +0000 (UTC)
Date: Fri, 19 Feb 2021 17:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613756658;
 bh=kFDqyoxJpY/e2OdbDbLit59Itw7cWS07uag58SdBzYM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UP9K0L9WyiJWZzP2dFR6IEbKo1UpRukC51JPW+GnzmaTfROQ/CXE12TdEU2KVHknP
 mUHSSFUaufStDGjTmmx1TrrE0k01MtmwOPeCeQO7DbGOlsmWNyy+YuARG0HtAAlHFw
 A/MDdjx2EHp2FV4VdQbdKl1mNhsfs8gTrz3DzZFPvx7aTRuiv+gAgcDZYfvyNjQ5Ag
 Z3ZgkUx/Mj1xC2WL6lq4j+Ld6tyZ7MWfkHchVnj3wNvuQOP0FjROH3BduUzWEggeEf
 +6JrYPAOdytKiYw7uBahnuAcTvkZuNy9qFbCw8Y1NXCpLmJ8P0srt0OlbsncihrTj6
 gukm/pIrk1g3w==
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] amd/display: add cursor check for YUV primary plane
Message-ID: <P7dGvqmMnR9Rc5L4Z6L9PH59IZptCJv9A5AqzHNEFLqRhAp1mAr-jzwhML6Z5S7HZi_jx3YRoQsSoJ1xjIKxWPZ7u9DWGEOYlN-on7yjOvQ=@emersion.fr>
In-Reply-To: <c44cea7d-0cb5-d9d0-f38c-0fa617a63394@amd.com>
References: <GKIJ9isuno0PKWRz4qj5CSIfRao35EWMYjtLGdiDIk@cp3-web-020.plabs.ch>
 <2feadc71-19b0-d1af-6302-1ad20e81aa79@amd.com>
 <ooUUHOVWdFJnq4EBspGdEXyMzibYzwXlW-O4boMFyLeCi50oPl8CIYOk_RF8Z22KL2QvzQs47McGU3xebwAyq0358jJJzkADAe79peNYMMM=@emersion.fr>
 <c44cea7d-0cb5-d9d0-f38c-0fa617a63394@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Friday, February 19th, 2021 at 6:41 PM, Kazlauskas, Nicholas <nicholas.kazlauskas@amd.com> wrote:

> > Related: how does this affect scaling? Right now there is a check that makes
> > sure the cursor plane scaling matches the primary plane's. Should we instead
> > check that the cursor plane scaling matches the top-most XRGB/ARGB plane's?
> >
>
> Can't really do scaling on the cursor plane itself. It scales with the
> underlying pipe driving it so it'll only be correct if it matches that.
>
> Primary plane isn't the correct check here since we always use the
> topmost pipe in the blending chain to draw the cursor - in the example I
> gave it'd have to match the overlay plane's scaling, not the primary
> plane's.

OK, thanks for the info. That means the check I introduced some time
ago is wrong (it's right above my patch). I'll send a fix for that too.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

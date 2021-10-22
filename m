Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D243797D
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Oct 2021 17:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52156E5C3;
	Fri, 22 Oct 2021 15:02:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896E06EDA1
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Oct 2021 15:02:09 +0000 (UTC)
Date: Fri, 22 Oct 2021 15:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634914926;
 bh=xUOihb7rBp1CyQmUXC1rYJPXTfx63c3bEiOx70DKcyI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=QH2QieGsiL3WdgIV6UaWnqhTd2+itaPbIDIWaNwfA+4MUdOjanL/CTHATGWffzyfi
 x9DSGF2Wmg1dBfdHhqewWy1FUd5/MwnLEO8Na2QYHhu/IyQc6Z6xEZcfX0NgMoAZn7
 KtoksI9epkaC6CfCKpOdM/W0msZZmYF5t84bissW9fHXJhWjpAM7BIjDJETI2uobAv
 l6+DU0mLrkWi7bZY62Ioua4oC/Q5Y/RuskQrX6h5M5b7ayJxVL7e4fUd4IEf5qWTay
 dEZyirCXtkXgMJbiQl05lCVR95cvKaPSciXZx9zCF5uUGvwI/nBYgUgDhIcp19zgib
 1/7HUo79VINQg==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <hwentlan@amd.com>, Mark Yacoub <markyacoub@google.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] amd/display: remove ChromeOS workaround
Message-ID: <tI6GUqleTpv-LaeBR8URB2_AvRUbdOGhaqcjrg4kTGwLwKDso4x-SUhj5zAgg-4MoxbvJFrujGHnjhH4fNxn8125F1-sfrZB_2-YDTV2xlI=@emersion.fr>
In-Reply-To: <CADnq5_NBpCm8fpueH2LF+Tepm9i33bp_nf-BbLo2pGXqkP3QiA@mail.gmail.com>
References: <20211014153433.169454-1-contact@emersion.fr>
 <f6993cb2-53e0-b4c8-48f2-c5bf4eaaf511@amd.com>
 <25eb363b-e97f-0762-f39a-a8a459ba019f@amd.com>
 <CADnq5_NBpCm8fpueH2LF+Tepm9i33bp_nf-BbLo2pGXqkP3QiA@mail.gmail.com>
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

On Friday, October 22nd, 2021 at 15:58, Alex Deucher <alexdeucher@gmail.com=
> wrote:

> > Agreed that this patch is good but we'll need to also revert the is_chr=
omeos w/a.
>
> I've reverted that and applied this one. Thanks!

Ah, didn't realize I needed to revert that one too. Thank you!

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AF3222C7
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Feb 2021 00:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA87E6E222;
	Mon, 22 Feb 2021 23:50:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DA26E222
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 23:50:21 +0000 (UTC)
Date: Mon, 22 Feb 2021 23:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1614037819;
 bh=ph1ySBEQC0LJpRPum3dD4XtE11mtDK6Kdlwf7VEbw5E=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=cc2FYh0f9I8DcHixptL/3YWq/dc+vUJCOLh2GWZ2BXH22GspZN90hOwFl/9dPFMKK
 6nnqDu8qOUg5XbyFoy+E5IGUA/fPrLGhYFnFIrwWPqs6k6jYFXQd5aIEb2l2b3ArnH
 U4iZ0I4cJEgPoPWD/rF1xJeTuAxvkq5KwaicRzqFIuFnDlg8c0+xXp/tf+T4lN/faZ
 mb5/DaE+mvtRNA2PqzuYGUpar5OSfKvIc/foi2JiQ+O03ckn8vE0qFB4xTAKZHJywc
 +ocqGh0J6I+tg28wbF/fzmNQ96BEY+wPmfvl5sSHQOffXNABk5gweZQQH6ovD7+4S0
 xRt//bY/pcZLA==
To: Nathan Chancellor <nathan@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
Message-ID: <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
In-Reply-To: <20210222234457.GA36153@24bbad8f3778>
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
 <32vjVDssCxltB75h5jHin2U3-cvNjmd_HFnRLiKohhbXkTfZea3hw2Knd80SgcHoyIFldMNwqh49t28hMBvta0HeWed1L0q_efLJ8QCgNw8=@emersion.fr>
 <20210222234457.GA36153@24bbad8f3778>
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
Cc: stylon.wang@amd.com, sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com,
 dri-devel@lists.freedesktop.org, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, airlied@linux.ie, aurabindo.pillai@amd.com,
 Souptick Joarder <jrdr.linux@gmail.com>, daniel@ffwll.ch,
 bas@basnieuwenhuizen.nl, alexander.deucher@amd.com, harry.wentland@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, February 23rd, 2021 at 12:44 AM, Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Feb 22, 2021 at 11:05:17PM +0000, Simon Ser wrote:
> > On Monday, February 22nd, 2021 at 8:25 PM, Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > > >> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9804:38:
> > > >> warning: variable 'i' is uninitialized when used here
> > > >> [-Wuninitialized]
> > >                            timing  = &edid->detailed_timings[i];
> > >                                                              ^
> > >    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9714:7:
> > > note: initialize the variable 'i' to silence this warning
> > >            int i;
> > >                 ^
> > >                  = 0
> > >    1 warning generated.
> > >
> > > Initialize the variable 'i'.
> >
> > Hm, I see this variable already initialized in the loop:
> >
> >     for (i = 0; i < 4; i++) {
> >
> > This is the branch agd5f/drm-next.
>
> That is in the
>
> 	if (amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT
> 		|| amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_EDP) {
>
> branch not the
>
> 	} else if (edid && amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>
> branch, where i is indeed used uninitialized like clang complains about.
>
> I am not at all familiar with the code so I cannot say if this fix is
> the proper one but it is definitely a legitimate issue.

I think you have an outdated branch. In my checkout, i is not used in the first
branch, and is initialized in the second one.

https://cgit.freedesktop.org/~agd5f/linux/tree/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c?h=drm-next#n9700
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

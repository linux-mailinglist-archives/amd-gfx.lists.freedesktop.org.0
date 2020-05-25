Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122951E118B
	for <lists+amd-gfx@lfdr.de>; Mon, 25 May 2020 17:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710DC8915F;
	Mon, 25 May 2020 15:20:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0477A8915F
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 May 2020 15:20:45 +0000 (UTC)
Date: Mon, 25 May 2020 15:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590420043;
 bh=3RdNudmO4hC+GYd+Ig1ZoKDa7xqF0YYW/EZMY3WG7UU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GCgMbpMzR1PD3wYrkwGnmsXzEfPttQN6UX4cG5i5epxeMrmkPNqiouYx2GrwBHIOy
 OKNSX7DyTb8bDqajjrjpInKInekr1138duoIKBf9SPvsVSrh5SuoLi/zUN+lO2Kxt+
 xcOpQXIHdmM6SMjDIkj1vkKeR/xjRpfB2rA2O+SQ=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
Message-ID: <y61UnQ7JgZGomUBsKxwazOBwHB6sLQG3RfeimrIQ97Z35kTL6kwdLyCekZVWVVYA05qTERecIAbZdORUorZVsm_WK7zz9tPYCdGzWc0d2aw=@emersion.fr>
In-Reply-To: <20200525151515.GK206103@phenom.ffwll.local>
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
 <20200525151515.GK206103@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 uday kiran pichika <udaykiran.pichika@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Monday, May 25, 2020 5:15 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:
>
> > Hello,
> > Am working on enabling the Adaptive sync feature as part of the
> > Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver
> > (xf86-video-amdgpu). Below is the commit which i submitted.
> > https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371cc3731ee805cc4a0ace80db
> > I have made the below changes to enable this feature
> >
> > 1.  Enable Adaptive sync in Graphics Driver
> > 2.  Added Xorg.conf file with VariableRefresh property which is read in the
> >     Modesetting driver --> This is working fine.
> >
>
> -modesetting, even in latest git master branch doesn't have VRR support.
>
> So yeah this wont work.

FWIW, Sway supports VRR (via the output adaptive_sync command). So it
would be a way to test your driver.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83082C2C29
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Nov 2020 17:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99F6E441;
	Tue, 24 Nov 2020 16:01:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CA76E441
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 16:01:39 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606233696;
 bh=Ozz4XL/dcZ8nZ7DpP+uhc4zUttCZ0jGxhFf6jBMgp2s=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=T/fBJoHlnEQBat0cd1ZGACP8pDHMZFOVjCE9stlKFpOcbnhNAGV6rN7lQLjBwIP7O
 BgT5z/FvhWzmWJzzWfbY6W2pMmAZgVssZLRQBnDX/NJg7JBPCEGyCUGsZjcnM9xDvd
 gLt5+IkETO8WgShdR1M/q90dY8bavZFTmpHLuIl6gjT8xpsJXRWO/h1zaChIxjmfwS
 6JD2tulsgQON9Sz9GAd/Q/2B4Ktt155EwFXdCImZ1ASKuuh8wGEOeDec39NUdzO6Jv
 9AvXyjBnQLWj6oarU0O49A9S0oDMbwEpgmDjFQ0AcusxhIKC8Arwd8tJLMgvT8XjpC
 JKTnoSDcAIq6Q==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 4/4] drm/amd/display: don't expose rotation prop for
 cursor plane
Message-ID: <gJoZn3x71XOvuq7VkZuv1dJiwbVMe6GytVvXuFQ3gJarb1HsHZNv78F_JuhEpebDxUVemEtuE7DabnmFdDWt908h3xT-ulyvF5wSxINT1Rw=@emersion.fr>
In-Reply-To: <CADnq5_MyoV8Q9_s+2p37CKAWkAxZkjqeR9AWazLTjc8fLCO8Vg@mail.gmail.com>
References: <ou0uzBHIyn5i1sQXWfXck2EDBtFXVmfBnGJXF7Rqo@cp4-web-027.plabs.ch>
 <CADnq5_MyoV8Q9_s+2p37CKAWkAxZkjqeR9AWazLTjc8fLCO8Vg@mail.gmail.com>
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, November 24, 2020 4:46 PM, Alex Deucher <alexdeucher@gmail.com> wrote:

> On Fri, Nov 20, 2020 at 3:19 PM Simon Ser contact@emersion.fr wrote:
>
> > Setting any rotation on the cursor plane is ignored by amdgpu.
> > Because of DCE/DCN design, it's not possible to rotate the cursor.
> > Instead of displaying the wrong result, stop advertising the rotation
> > property for the cursor plane.
> > Now that we check all cursor plane properties in amdgpu_dm_atomic_check,
> > remove the TODO.
> > Signed-off-by: Simon Ser contact@emersion.fr
> > Cc: Alex Deucher alexander.deucher@amd.com
> > Cc: Harry Wentland hwentlan@amd.com
> > Cc: Nicholas Kazlauskas nicholas.kazlauskas@amd.com
>
> Applied the series. Thanks!

Thanks a lot of the review!

Simon
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

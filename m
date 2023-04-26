Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA36EEF61
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Apr 2023 09:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB13510E8ED;
	Wed, 26 Apr 2023 07:37:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB48110E0DB;
 Wed, 26 Apr 2023 04:58:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DD3262906;
 Wed, 26 Apr 2023 04:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988A7C433D2;
 Wed, 26 Apr 2023 04:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1682485128;
 bh=ND7kEeaVi0isIsVRWJ6UNL0heB4TJzmEPRRJFkMtrEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0OiiGg5mvA/RRoHQnEHnEN4C1ipXBE01k2wIwkgEsU9KP/QLPeXNvYA3rD+8OzNp
 o5HK0tkv17GOsy5ShM7Z1C8ZBNYsRH2m+4xlV8P9npo1byjF3ldSWGHi2hfpZQUFJw
 RiC57A/3s27XJn8QDZw6GZqu0a8HpPbHzgk/V+jA=
Date: Wed, 26 Apr 2023 06:58:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add a missing lock for AMDGPU_SCHED
Message-ID: <ZEivhUGdECRpVztZ@kroah.com>
References: <20230426004831.650908-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426004831.650908-1-olvaffe@gmail.com>
X-Mailman-Approved-At: Wed, 26 Apr 2023 07:37:40 +0000
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
Cc: amd-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 05:48:27PM -0700, Chia-I Wu wrote:
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: stable@vger.kernel.org

I know I can not take patches without any changelog text at all, maybe
the DRM developers are more lax, but it's not a good idea at all.

thanks,

greg k-h

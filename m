Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B4486165
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jan 2022 09:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0518113507;
	Thu,  6 Jan 2022 08:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jan 2022 21:33:56 UTC
Received: from forward500p.mail.yandex.net (forward500p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553189BF3
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jan 2022 21:33:56 +0000 (UTC)
Received: from myt5-fd8342da2278.qloud-c.yandex.net
 (myt5-fd8342da2278.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1c89:0:640:fd83:42da])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id DF2B0F01C9F;
 Thu,  6 Jan 2022 00:33:54 +0300 (MSK)
Received: from myt5-cceafa914410.qloud-c.yandex.net
 (myt5-cceafa914410.qloud-c.yandex.net [2a02:6b8:c12:3b23:0:640:ccea:fa91])
 by myt5-fd8342da2278.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 bhtbElYihQ-XsgCOq9V; Thu, 06 Jan 2022 00:33:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1641418434; bh=C9legpcsQTOfSkx06KFG6sJxzl7jmNQSC0Ln4E2Q2pU=;
 h=In-Reply-To:References:Date:To:From:Subject:Message-ID;
 b=BPY9aECEIhkIbFilR0NEo5paSHldfeZzh+fPMTm1pcOwGnmqI88xAvtJ2dF7NdZNk
 wAx8Fof1KnNgpaANOX4Opal2lYvmSLIkr97T/Uo9IgZNC7OBlwWCGD2bJc5SqaErZw
 ymfa0kC26o07CEM1d3tA4HTFOIrsyMt2qXd+QgqY=
Authentication-Results: myt5-fd8342da2278.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt5-cceafa914410.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id oZo1FvvDiC-XsPqitDn; Thu, 06 Jan 2022 00:33:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <997cce3491b9e8cb8b0427cc8c61267407154f58.camel@yandex.ru>
Subject: Re: Bug: amdgpu stutter and spam `Fence fallback timer expired`
 after suspend
From: Konstantin Kharlamov <hi-angel@yandex.ru>
To: linux-i2c@vger.kernel.org, wsa@kernel.org, bibby.hsieh@mediatek.com, 
 amd-gfx@lists.freedesktop.org
Date: Thu, 06 Jan 2022 00:33:54 +0300
In-Reply-To: <7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru>
References: <7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Jan 2022 08:25:13 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Btw, please keep me on CC as I am not subscribed to the lists

On Thu, 2022-01-06 at 00:26 +0300, Konstantin Kharlamov wrote:
> Hello! Just a heads up to this report
> https://gitlab.freedesktop.org/drm/amd/-/issues/1850
> 
> Basically, after waking up on suspend there're freezes in apps using amdgpu,
> and there's a spam in syslog `Fence fallback timer expired on ring …`.
> 
> I bisected that to a commit 
> 
>         5a7b95fb993ec399c8a685552aa6a8fc995c40bd i2c: core: support bus
> regulator controlling in adapter
> 
> Since the commit is not in AMDGPU, I send this email to linux-i2c. The commit
> author CCed as well.
> 
> Should I send a revert, or is there a way to fix this?


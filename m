Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644592DA3BB
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Dec 2020 23:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A96E0C6;
	Mon, 14 Dec 2020 22:56:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5DE6E0C6
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Dec 2020 22:30:09 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0a4700f8dbeb96c83acd3a.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:4700:f8db:eb96:c83a:cd3a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 418381EC04EF;
 Mon, 14 Dec 2020 23:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607985004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=VxTInyq+jG1Px2oSCSmfmngOPvJG7FloDJmqcfyvx1o=;
 b=V5b2GDxlobzpyb4Y8xfMrmz3yA4YXD2tiFavq0DCx/xjwMOWzbfJQdWbpnZyiimsyiKJWg
 CYboNjXr89Tp20vqD4mjt5j+dj/flNAog1kO9fZYJEvff8mAwJhEUtxKCnCJ3gpuJRS9+M
 toDiGqWBaQ24vJiBPCGI9j5+IpG/09k=
Date: Mon, 14 Dec 2020 23:30:00 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: disable stream if pixel clock
 changed with link active"
Message-ID: <20201214223000.GE25916@zn.tnic>
References: <20201214215339.819374-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214215339.819374-1-alexander.deucher@amd.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 22:56:28 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 04:53:39PM -0500, Alex Deucher wrote:
> This reverts commit 8353d30e747f4e5cdd867c6b054dbb85cdcc76a9.
> 
> This causes a hang on a carrizo based laptop.  Revert until we can fix
> it properly.
> 
> Cc: Borislav Petkov <bp@alien8.de>

Reported-by: me

> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 1 +
>  1 file changed, 1 insertion(+)

Lemme know if I should test fixes.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

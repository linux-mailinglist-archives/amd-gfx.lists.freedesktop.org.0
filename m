Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6E320045
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Feb 2021 22:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB56B6EC13;
	Fri, 19 Feb 2021 21:22:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8276EC13
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Feb 2021 21:22:17 +0000 (UTC)
Date: Fri, 19 Feb 2021 21:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613769734;
 bh=5uzKZTRCNRBGtVIqUMAHNOxMRvWLFGGQ1xRiMRikaJw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Mf/tDvyHdBpz7HX3xmRcdssIXSHK/G+UupHh3t5+H/Nup0MAfQymrWTF8ZMHUHYiK
 Ujj9IrsFQeHON65qeEpwnuoFyyQmpAssJ2FeaPqZf2XeI4V3/5t/3qc0mzeFAqNqmG
 OHEt9jRv/z7otQXGUoJEiVFTMpkTnxtzEiVi+Opy0kk/JJ28RZ48ny6/Zz48stoUg4
 Sto62IlHyBQ41Wx0S+4eEh5oupLMzciaN17zLIDELnmFpbR9PwPPI7JtoyiwWW2kyB
 ni/hOvOpnKV3c85EHb8tibhl7hGQ751VBajsrHyqypYDMkglhf1ClLMojTHXBjTw93
 dJ+AjkMjahPPw==
To: "Cornij, Nikola" <Nikola.Cornij@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: RE: Overlay issues
Message-ID: <Zq5awE32--JJaePI-8O0Rd-2AYVUPYgIn1PspErRR_qpQeTlX_L0M_8iQMyN6rGZPJRuBmkf6OGmeQFLYkzB9cswAhdyWbAzEXqT-0ZjFC4=@emersion.fr>
In-Reply-To: <DM5PR12MB46792E5F8DF0F128FF01D79EEEDE0@DM5PR12MB4679.namprd12.prod.outlook.com>
References: <DM5PR12MB4679C807DB8DB502AC4793DCEEC60@DM5PR12MB4679.namprd12.prod.outlook.com>
 <05FNtjCma79AawCUxH3mqJ8sWHmoIXFXhQWW0N_b-mpl7QvuW3JN3AbtPUiR0y1LOf3tLhWFWv8YjuIEvJ3dci9y1EHk_D9a9L1BAyWyxRs=@emersion.fr>
 <DM5PR12MB4679F2B26887B76BC025161AEEC60@DM5PR12MB4679.namprd12.prod.outlook.com>
 <DM5PR12MB46792E5F8DF0F128FF01D79EEEDE0@DM5PR12MB4679.namprd12.prod.outlook.com>
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

Hi,

On Wednesday, December 23rd, 2020 at 6:48 AM, Cornij, Nikola <Nikola.Cornij@amd.com> wrote:

> Another interim update: so far to me it looks like this is an issue if there's
> fewer than 24 pixels left on the screen when moving the FB outside of the left
> edge (e.g. with 300x300 FB size, it repros with X = -280). When this happens,
> what looks like a boundary condition in our driver is hit and destination
> rectangle update is skipped.
>
> I need to do some more digging to fully understand why is this condition in
> place and how to avoid it.

Did you have the chance to continue working on this?

Thanks,

Simon
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

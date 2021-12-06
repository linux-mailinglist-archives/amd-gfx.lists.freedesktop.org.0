Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2446AA8C
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Dec 2021 22:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944B273379;
	Mon,  6 Dec 2021 21:36:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713C673379
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Dec 2021 21:36:15 +0000 (UTC)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
 by smtp5-g21.free.fr (Postfix) with ESMTP id D08495FF27;
 Mon,  6 Dec 2021 22:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638826573;
 bh=56JkZHxxSPjJ9+3JdJmQbsPsgzbCie0RwSuteDtLPaA=;
 h=Date:From:To:Cc:In-Reply-To:Subject:From;
 b=uDg+0txWrtVK4MG+YeLF6fyFaZ9d3A0Xu1FrF+WQwv1Fn+qsekuQ+rRWFPcAyZcuS
 sCJ0Q2OlLfUFPAPsrQYPnodMGkR7hJ4MwkVC+bzYEuV9zH323XIOj/vAokU5L61Hho
 ygBbDJK1h40NvXJins2z3padHO48qvpp0Hc48A5NREOTE8Il05TKCzzAOdlNavIYRT
 mtaG+x/Jndb05Z3LSNiw8Glb1QqDJ2Mz6/jpB2HEpDQbVDKIeFB+sEnhfWHSlrYXNG
 skbhHF5Ifa8MSNICN9WwkyPn3wqTpdDuYd8EXg9WSifRiDGpEWHEvK1msZ6Di0TVuX
 sOSabtFHqpzCw==
Date: Mon, 6 Dec 2021 22:36:12 +0100 (CET)
From: Yann Dirson <ydirson@free.fr>
To: Alex Deucher <alexdeucher@gmail.com>
Message-ID: <2007970240.32601068.1638826572724.JavaMail.root@zimbra39-e7>
In-Reply-To: <CADnq5_P6ZoxFXxTAmMsNqbCO3_FZ4+2qn+YJ5488q6Ew-FaU-A@mail.gmail.com>
Subject: Re: Various problems trying to vga-passthrough a Renoir iGPU to a
 xen/qubes-os hvm
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.120.44.86]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - FF3.0 (Linux)/7.2.0-GA2598)
X-Authenticated-User: ydirson@free.fr
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Alex,

> We have not validated virtualization of our integrated GPUs.  I don't
> know that it will work at all.  We had done a bit of testing but ran
> into the same issues with the PSP, but never had a chance to debug
> further because this feature is not productized.
...
> You need a functional PSP to get the GPU driver up and running.

Ah, thanks for the hint :)

I guess that if I want to have any chance to get the PSP working I'm
going to need more details on it.  A quick search some time ago mostly
brought reverse-engineering work, rather than official AMD doc.  Are
there some AMD resources I missed ?

Best regards,
-- 
Yann

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02AE4CAAE0
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Mar 2022 17:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB4810EB22;
	Wed,  2 Mar 2022 16:55:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1131 seconds by postgrey-1.36 at gabe;
 Wed, 02 Mar 2022 16:20:11 UTC
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8BA10E1BA
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Mar 2022 16:20:11 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K7zPT6j7cz9sSR;
 Wed,  2 Mar 2022 17:01:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5joybHOP63Sd; Wed,  2 Mar 2022 17:01:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K7zNw1930z9sSW;
 Wed,  2 Mar 2022 17:00:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 176128B76D;
 Wed,  2 Mar 2022 17:00:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n6gNmIVrwo7d; Wed,  2 Mar 2022 17:00:48 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C675B8B763;
 Wed,  2 Mar 2022 17:00:47 +0100 (CET)
Message-ID: <b89a2255-fb3c-a834-2565-33303645c51e@csgroup.eu>
Date: Wed, 2 Mar 2022 17:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 0/2] Add generic FPU api similar to x86
Content-Language: fr-FR
To: Anson Jacob <Anson.Jacob@amd.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 amd-gfx@lists.freedesktop.org
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210719195211.520428-1-Anson.Jacob@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 16:55:36 +0000
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
Cc: Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Aurabindo.Pillai@amd.com,
 Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



Le 19/07/2021 à 21:52, Anson Jacob a écrit :
> This is an attempt to have generic FPU enable/disable
> calls similar to x86.
> So that we can simplify gpu/drm/amd/display/dc/os_types.h

Seems like gpu/drm/amd/display/dc/os_types.h has been simplified through 
another way via commit 96ee63730fa3 ("drm/amd/display: Add control 
mechanism for FPU")

Are powerpc changes in patch 1 still relevant ? In that case please rebase.

> 
> Also adds FPU correctness logic seen in x86.
> 
> Anson Jacob (2):
>    ppc/fpu: Add generic FPU api similar to x86
>    drm/amd/display: Use PPC FPU functions
> 
>   arch/powerpc/include/asm/switch_to.h      |  29 ++---
>   arch/powerpc/kernel/process.c             | 130 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/display/dc/os_types.h |  28 +----
>   3 files changed, 139 insertions(+), 48 deletions(-)
> 

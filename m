Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C43CF55E
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Jul 2021 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8D56E241;
	Tue, 20 Jul 2021 07:35:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5666E250
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 06:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zY/bA1mmo80mAzxM6Dqf7zbj0hsJZEwAfFA84ALlcz8=; b=Ihy/jz+o+4KAUoA6iHjBE2hAIk
 1KVtU50DJksORf+Jgi5tF72tnslR5cy7hHwFbg9m7p15Ox9epP3q7P1aAIqa8EqnS0VDizf62TOX8
 yTS1k/oalIUSYym8s3k8gJyn8NPkVn0yVB3AKiCbxd3CA9TTXjsmChIWKQOFj0RetzQG31RxSqktC
 gIqCg8mhmOKnxxrckhaLumo0Tn0rzbL6d/AiBBKnkftU2JBJOWUgEtF9UsqXrmmjhT0EJOSSFqTbU
 cEPJOh95bDAyO13/oCQR4yM+1i36dMG7CETXN1DMt/PiE2YB04CURN5mvt/KZGh1m5QyBxbe9Wqqv
 Kc4ETxvg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m5iu3-007oH6-Lz; Tue, 20 Jul 2021 06:06:56 +0000
Date: Tue, 20 Jul 2021 07:06:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Subject: Re: [RFC 2/2] drm/amd/display: Use PPC FPU functions
Message-ID: <YPZn+wqulTHSR+h2@infradead.org>
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
 <20210719195211.520428-3-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719195211.520428-3-Anson.Jacob@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 20 Jul 2021 07:35:33 +0000
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
Cc: Harry.Wentland@amd.com, Sunpeng.Li@amd.com, mpe@ellerman.id.au,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, Bhawanpreet.Lakha@amd.com,
 Aurabindo.Pillai@amd.com, paulus@samba.org, christophe.leroy@csgroup.eu,
 benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

>  #define DC_FP_END() kernel_fpu_end()
>  #elif defined(CONFIG_PPC64)
>  #include <asm/switch_to.h>
> +#define DC_FP_START() kernel_fpu_begin()
> +#define DC_FP_END() kernel_fpu_end()
>  #endif

Please use the same header as x86 in your first patch and then kill
this ifdefered and the DC_FP_START/DC_FP_END definitions entirely.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

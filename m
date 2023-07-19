Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF07594D1
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jul 2023 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B489010E484;
	Wed, 19 Jul 2023 12:12:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1209 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jul 2023 09:49:45 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD52E10E44C
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jul 2023 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7CficctBvH0/f/2WnPWvQCjSoDFtYP+3xEUu6sJSHYU=; b=AwEHjXzgMNux6iIaljsrFXLYj0
 CyuYr3l+n07xWFw7eEzaELQ2hwsHlUN1pdAApoNylg5AxMIA0xPWctyN+gqMMen348MGvM083EcyI
 rjQPk6Ae+qe5s2UighPxHub7n/OOopo8UO5+OMsTG6QOP9JWergddJvNZSHEHAZn6K4y7qXOVNbGd
 ++MoXGpDmYWZp0ky2JPke07ZWlo5rI6Rs+3mb58qVd/iP8k3uSX01ISjnFDn3y3ot6oNhNX8fwa1E
 KNmLhqHETpG5SCQHBwTg1cbsfEPiv7HBxi6M9w2NHOShu29hsbwH9kR4aYlCe/DkNUR+6YNc83Hfu
 wS6xoKcw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qM3Uj-005uqN-NS; Wed, 19 Jul 2023 09:29:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 32C053008AC;
 Wed, 19 Jul 2023 11:29:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5E5DE2137288F; Wed, 19 Jul 2023 11:29:15 +0200 (CEST)
Date: Wed, 19 Jul 2023 11:29:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 4/4] perf/core: use vma_is_initial_stack() and
 vma_is_initial_heap()
Message-ID: <20230719092915.GA3529602@hirez.programming.kicks-ass.net>
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-5-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719075127.47736-5-wangkefeng.wang@huawei.com>
X-Mailman-Approved-At: Wed, 19 Jul 2023 12:12:37 +0000
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 03:51:14PM +0800, Kefeng Wang wrote:
> Use the helpers to simplify code, also kill unneeded goto cpy_name.

Grrr.. why am I only getting 4/4 ?

I'm going to write a bot that auto NAKs all partial series :/

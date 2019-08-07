Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1E845FF
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 09:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D496E658;
	Wed,  7 Aug 2019 07:27:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516AE6E36B
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 07:08:36 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvG3m-0007yE-Qu; Wed, 07 Aug 2019 07:08:34 +0000
Date: Wed, 7 Aug 2019 00:08:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tao Zhou <tao.zhou1@amd.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807070834.GA24792@infradead.org>
References: <20190807025640.682-1-tao.zhou1@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6oMBJ81nXRB0KFK8KufiKsptCeJsMRRDmyRxvUsPSkQ=; b=G/pio6E5CwweDYTkjY9WyrZyx
 99Og40vF25oNzLL1D4O5lJXOoKtPMSBDBW4UM44fi1NFlerY07eGBN8LZy1Fk7l0osC4S/3hNaI5/
 YkbMubYPzOZfO0zW3EroHHlcanjeqQGDWkHcE81nxYlTVqMKgB3X6xNicXZ3bqTA4KOR+pQRTCIIQ
 BSDpW/THFBljSd46XrrghAsf7Q26y6OeCtqa8fBX2oVeIk5xA5H9gPgVW6eDJ29R9cM/4DGLicTbR
 a+lxRJtA/fV5nMT+E6+h005dvSSAv0Ef8D1r0Wr5LbKgC3xLu4FimAkoc+tsJS2/v/vTgD8Dsttmh
 qsRpkAJ/Q==;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, broonie@kernel.org, linux-next@vger.kernel.org,
 alexander.deucher@amd.com, akpm@linux-foundation.org, christian.koenig@amd.com,
 dennis.li@amd.com, hawking.zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NTY6NDBBTSArMDgwMCwgVGFvIFpob3Ugd3JvdGU6
Cj4gcmVhZHEvd3JpdGVxIGFyZSBub3Qgc3VwcG9ydGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzCgpO
QUsuICBZb3UgbXVzdCBub3QgdXNlIGF0b21pY18qIG9uIF9faW9tZW0gKE1NSU8pIG1lbW9yeS4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEAB188785
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2020 15:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9E26E1F4;
	Tue, 17 Mar 2020 14:30:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935326E1EE
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Mar 2020 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=QWkBVq6F22sOftkJaM+T/BE5V49T+3WQgdRW7zJx9Ms=; b=P0BDRTxf8KOX4lPiB7yA8iuC7S
 dahvW1h3BAcJ8DOXN2Y7fPABl4P0qnkxWEhxcJTaoGfpOsvTQKuHWh8H8vZVVgMlsDOpyDoQQ4X20
 riVC6huDzLd4vWASc+JeNbddpyi7F97AfkvqC9y/dEBohnYz87iF1LK/l4RVaRIpfCB2rpAbroVDW
 a5HaMfCiCYaG1bCgXcDA1MCmIBAUGXyhXAXwoId2o0EsC+rk3H5cskvgqx3Pqsbd0WwqcD74DJqQ3
 FVGdPgI2bE8YsS9qJGWPXD9cwDmd/QZs0PWWX6Nv9uZk3Bjamy3/42N0Cso8UEdyQ6Raj8xhYUpUZ
 Nej28Tig==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEDCt-00007V-V7; Tue, 17 Mar 2020 14:28:35 +0000
Date: Tue, 17 Mar 2020 07:28:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikel Rychliski <mikel@mikelr.com>
Subject: Re: [PATCH 2/4] PCI: Use ioremap, not phys_to_virt for platform rom
Message-ID: <20200317142835.GA23471@infradead.org>
References: <20200303033457.12180-1-mikel@mikelr.com>
 <20200303033457.12180-3-mikel@mikelr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303033457.12180-3-mikel@mikelr.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:30:57 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, linux-pci@vger.kernel.org,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW55IHJlYXNvbiBkcml2ZXJzIGNhbid0IGp1c3QgdXNlIHBjaV9tYXBfcm9tIGluc3RlYWThvIUg
d2hpY2ggYWxyZWFkeQpkb2VzIHRoZSByaWdodCB0aGluZz8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cg==

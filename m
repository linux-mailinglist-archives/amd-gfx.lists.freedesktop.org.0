Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A329959D2
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 10:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A096F6E78E;
	Tue, 20 Aug 2019 08:03:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C76589D8E;
 Mon, 19 Aug 2019 21:53:52 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=[192.168.1.17])
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hzpb1-0006LU-1i; Mon, 19 Aug 2019 21:53:47 +0000
Subject: Re: linux-next: Tree for Aug 19 (gpu/drm/amd/display/)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190819191832.03f1a579@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3557b61e-bca8-1410-ff71-b7383b255c72@infradead.org>
Date: Mon, 19 Aug 2019 14:53:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819191832.03f1a579@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 20 Aug 2019 08:03:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jKYfgZoqVg3kBuPAviW2/HwCRWVw8YLe/13Up6WqEw4=; b=W+t9IfCmBh9jjJVtB7NH+Sxc/Q
 E0NRcVIQh5++6ysFnU/uC7OT4gNh1ZVDTfdzcwj9M28sBQNEBUihlgNTWrPOQ+pSvtB0l4siA+rcw
 TO252sWNdPBqoW3EYWg4kpYRYssZJMaPtkxpOB1YxW8OZxEyri1HnJK9rDx/Hw8MCaggxrSAaVCwb
 XZynam15gNs9LIvNideEWs7s+Q4T8zOmZKcToxABUq4gcgrFWzuiAdSsdFmrjrtJ7Cq9J7QYYjKMP
 x8ObAbcPQwjJSJNswZx000qOu0MxNJ2eMdng8/Seao8CWfzP9qudFm/SUZ+hGWiUZLbp4NCWCAHMA
 6ECpv7UQ==;
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
Cc: amd-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOC8xOS8xOSAyOjE4IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAK
PiBDaGFuZ2VzIHNpbmNlIDIwMTkwODE2Ogo+IAoKCm9uIGkzODY6CgpsZDogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5vOiBpbiBmdW5jdGlvbiBgd2FpdF9mb3Jf
YWx0X21vZGUnOgpkY19saW5rLmM6KC50ZXh0KzB4MWYzOCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYF9fdWRpdmRpMycKbGQ6IGRjX2xpbmsuYzooLnRleHQrMHgxZjcxKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgX191ZGl2ZGkzJwoKCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905231BFA6
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 00:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AA8922F;
	Mon, 13 May 2019 22:49:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCED891FB;
 Mon, 13 May 2019 21:27:21 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF5DB20873;
 Mon, 13 May 2019 21:27:20 +0000 (UTC)
Date: Mon, 13 May 2019 14:27:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Message-Id: <20190513142720.3334a98cbabaae67b4ffbb5a@linux-foundation.org>
In-Reply-To: <20190510195258.9930-2-Felix.Kuehling@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-2-Felix.Kuehling@amd.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 22:49:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557782841;
 bh=Yfjam7vD0AUB5DqGU8V8FZJW53SDZV7722EvBstsCIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bQVmclpGbN4utboxu4rTNRgq2ZFXwilUCLyO4LiN2zUReSfp4m+4xg4KOvWAHaR3n
 A6oAsQrgqiSbfcoykdZWHCpDWhVQMSIKbPszs42Mb4N4fWMJJPVUdTz52IONEYdcYn
 8rOVnAbrDrE/br2wxBc5SuCn/ZGhuCeecAtbKjAY=
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCAxMCBNYXkgMjAxOSAxOTo1MzoyMyArMDAwMCAiS3VlaGxpbmcsIEZlbGl4IiA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6Cgo+IEZyb206IFBoaWxpcCBZYW5nIDxQaGlsaXAu
WWFuZ0BhbWQuY29tPgo+IAo+IFdoaWxlIHRoZSBwYWdlIGlzIG1pZ3JhdGluZyBieSBOVU1BIGJh
bGFuY2luZywgSE1NIGZhaWxlZCB0byBkZXRlY3QgdGhpcwo+IGNvbmRpdGlvbiBhbmQgc3RpbGwg
cmV0dXJuIHRoZSBvbGQgcGFnZS4gQXBwbGljYXRpb24gd2lsbCB1c2UgdGhlIG5ldwo+IHBhZ2Ug
bWlncmF0ZWQsIGJ1dCBkcml2ZXIgcGFzcyB0aGUgb2xkIHBhZ2UgcGh5c2ljYWwgYWRkcmVzcyB0
byBHUFUsCj4gdGhpcyBjcmFzaCB0aGUgYXBwbGljYXRpb24gbGF0ZXIuCj4gCj4gVXNlIHB0ZV9w
cm90bm9uZShwdGUpIHRvIHJldHVybiB0aGlzIGNvbmRpdGlvbiBhbmQgdGhlbiBobW1fdm1hX2Rv
X2ZhdWx0Cj4gd2lsbCBhbGxvY2F0ZSBuZXcgcGFnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGls
aXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KClRoaXMgc2hvdWxkIGhhdmUgaW5jbHVkZWQg
eW91ciBzaWduZWQtb2ZmLWJ5Oiwgc2luY2UgeW91IHdlcmUgb24gdGhlCnBhdGNoIGRlbGl2ZXJ5
IHBhdGguICBJJ2xsIG1ha2UgdGhhdCBjaGFuZ2UgdG8gbXkgY29weSBvZiB0aGUgcGF0Y2gsCk9L
PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

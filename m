Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C11A3CC
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 22:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52926E7B7;
	Fri, 10 May 2019 20:14:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BB06E7B7;
 Fri, 10 May 2019 20:14:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 411C8308FC4E;
 Fri, 10 May 2019 20:14:06 +0000 (UTC)
Received: from redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 802F722718;
 Fri, 10 May 2019 20:14:05 +0000 (UTC)
Date: Fri, 10 May 2019 16:14:03 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Message-ID: <20190510201403.GG4507@redhat.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510195258.9930-3-Felix.Kuehling@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 10 May 2019 20:14:06 +0000 (UTC)
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDc6NTM6MjRQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IERvbid0IHNldCB0aGlzIGZsYWcgYnkgZGVmYXVsdCBpbiBobW1fdm1hX2RvX2Zh
dWx0LiBJdCBpcyBzZXQKPiBjb25kaXRpb25hbGx5IGp1c3QgYSBmZXcgbGluZXMgYmVsb3cuIFNl
dHRpbmcgaXQgdW5jb25kaXRpb25hbGx5Cj4gY2FuIGxlYWQgdG8gaGFuZGxlX21tX2ZhdWx0IGRv
aW5nIGEgbm9uLWJsb2NraW5nIGZhdWx0LCByZXR1cm5pbmcKPiAtRUJVU1kgYW5kIHVubG9ja2lu
ZyBtbWFwX3NlbSB1bmV4cGVjdGVkbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3Nl
IDxqZ2xpc3NlQHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBtbS9obW0uYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L21tL2htbS5jIGIvbW0vaG1tLmMKPiBpbmRleCBiNjVjMjdkNWMxMTkuLjNjNGYxZDYyMjAyZiAx
MDA2NDQKPiAtLS0gYS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTMzOSw3ICszMzks
NyBAQCBzdHJ1Y3QgaG1tX3ZtYV93YWxrIHsKPiAgc3RhdGljIGludCBobW1fdm1hX2RvX2ZhdWx0
KHN0cnVjdCBtbV93YWxrICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIAkJCSAgICBib29s
IHdyaXRlX2ZhdWx0LCB1aW50NjRfdCAqcGZuKQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgZmxhZ3Mg
PSBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIHwgRkFVTFRfRkxBR19SRU1PVEU7Cj4gKwl1bnNpZ25l
ZCBpbnQgZmxhZ3MgPSBGQVVMVF9GTEFHX1JFTU9URTsKPiAgCXN0cnVjdCBobW1fdm1hX3dhbGsg
KmhtbV92bWFfd2FsayA9IHdhbGstPnByaXZhdGU7Cj4gIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZSA9IGhtbV92bWFfd2Fsay0+cmFuZ2U7Cj4gIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9
IHdhbGstPnZtYTsKPiAtLSAKPiAyLjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4

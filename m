Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A13A30BD
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Jun 2021 18:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEA86EDA8;
	Thu, 10 Jun 2021 16:34:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDFC06EDA7;
 Thu, 10 Jun 2021 16:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7F2EE20201B;
 Thu, 10 Jun 2021 18:34:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QTH2Eyqvmnwo; Thu, 10 Jun 2021 18:34:49 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 1153820201A;
 Thu, 10 Jun 2021 18:34:49 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1lrNdn-0002DL-OM; Thu, 10 Jun 2021 18:34:47 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Change how amdgpu stores fences in dma_resv objects
Message-ID: <f3788c24-bb42-4913-6334-fb3549c21fb9@daenzer.net>
Date: Thu, 10 Jun 2021 18:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
Content-Language: en-CA
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wNi0xMCAxMToxNyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFNpbmNl
IHdlIGNhbid0IGZpbmQgYSBjb25zZW5zdXMgb24gaG90IHRvIG1vdmUgZm9yd2FyZCB3aXRoIHRo
ZSBkbWFfcmVzdiBvYmplY3QgSSBjb25jZW50cmF0ZWQgb24gY2hhbmdpbmcgdGhlIGFwcHJvYWNo
IGZvciBhbWRncHUgZmlyc3QuCj4gCj4gVGhpcyBuZXcgYXBwcm9hY2ggY2hhbmdlcyBob3cgdGhl
IGRyaXZlciBzdG9yZXMgdGhlIGNvbW1hbmQgc3VibWlzc2lvbiBmZW5jZSBpbiB0aGUgZG1hX3Jl
c3Ygb2JqZWN0IGluIERNQS1idWYgZXhwb3J0ZWQgQk9zLgo+IAo+IEZvciBleHBvcnRlZCBCT3Mg
d2Ugbm93IHN0b3JlIHRoZSBDUyBmZW5jZSBpbiBhIGRtYV9mZW5jZV9jaGFpbiBjb250YWluZXIg
YW5kIGFzc2lnbiB0aGF0IG9uZSB0byB0aGUgZXhjbHVzaXZlIGZlbmNlcyBzbG90Lgo+IAo+IER1
cmluZyBzeW5jaHJvbml6YXRpb24gdGhpcyBkbWFfZmVuY2VfY2hhaW4gY29udGFpbmVyIGlzIHVu
cGFja2VkIGFnYWluIGFuZCB0aGUgY29udGFpbmluZyBmZW5jZXMgaGFuZGxlZCBpbmRpdmlkdWFs
bHkuCj4gCj4gVGhpcyBoYXMgYSBsaXR0bGUgYml0IG1vcmUgb3ZlcmhlYWQgdGhhbiB0aGUgb2xk
IGFwcHJvYWNoLCBidXQgaXQgYWxsb3dzIGZvciB3YWl0aW5nIGZvciB0aGUgZXhjbHVzaXZlIHNs
b3QgZm9yIHdyaXRlcyBhZ2Fpbi4KCk5pY2UhCgpUaGlzIHNlZW1zIHRvIHdvcmsgYXMgZXhwZWN0
ZWQgd2l0aCBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vbWVyZ2VfcmVx
dWVzdHMvMTg4MDogU29tZSBidWZmZXJzIG5vdyBkb24ndCBwb2xsIHJlYWRhYmxlIGF0IGZpcnN0
LCB1bnRpbCB0aGUgR1BVIGlzIGRvbmUgcHJvY2Vzc2luZyB0aGVtLgoKClVuZm9ydHVuYXRlbHks
IGFzIGV4cGVjdGVkLCB3aXRob3V0IGEgaGlnaCBwcmlvcml0eSBjb250ZXh0IGZvciB0aGUgY29t
cG9zaXRvciB3aGljaCBjYW4gcHJlZW1wdCBjbGllbnQgZHJhd2luZywgdGhpcyBpc24ndCBlbm91
Z2ggdG8gcHJldmVudCBzbG93IGNsaWVudHMgZnJvbSBzbG93aW5nIGRvd24gdGhlIGNvbXBvc2l0
b3IgYXMgd2VsbC4gQnV0IGl0IHNob3VsZCBhbHJlYWR5IGhlbHAgZm9yIGZ1bGxzY3JlZW4gYXBw
cyB3aGVyZSB0aGUgY29tcG9zaXRvciBjYW4gZGlyZWN0bHkgc2NhbiBvdXQgdGhlIGNsaWVudCBi
dWZmZXJzIGF0IGxlYXN0LgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVu
dGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Blcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK

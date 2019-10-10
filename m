Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C0D2EC3
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 18:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEE86E051;
	Thu, 10 Oct 2019 16:45:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B033A6E051
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 16:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A043F2AA14E;
 Thu, 10 Oct 2019 18:45:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Zm3TcUdGk9y7; Thu, 10 Oct 2019 18:45:33 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D40792AA01A;
 Thu, 10 Oct 2019 18:45:32 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iIbZE-0006yn-Aw; Thu, 10 Oct 2019 18:45:32 +0200
Subject: Re: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet
 for pipe sync
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
References: <20191009170923.15479-1-xiaojie.yuan@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <f8d50c0e-daa2-252f-1c7e-b76310ccb3b8@daenzer.net>
Date: Thu, 10 Oct 2019 18:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009170923.15479-1-xiaojie.yuan@amd.com>
Content-Language: en-CA
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wOSA3OjA5IHAubS4sIFl1YW4sIFhpYW9qaWUgd3JvdGU6Cj4gc2RtYSB3aWxs
IGhhbmcgb25jZSBzZXF1ZW5jZSBudW1iZXIgdG8gYmUgcG9sbGVkIHJlYWNoZXMgMHgxMDAwXzAw
MDAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwo+IGluZGV4IGFkNWMzNTY2MzM3Yy4u
MzQ2MGMwMGYzZWFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMK
PiBAQCAtMTEyNiw3ICsxMTI2LDcgQEAgc3RhdGljIHZvaWQgc2RtYV92NV8wX3JpbmdfZW1pdF9w
aXBlbGluZV9zeW5jKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKPiAgIAlhbWRncHVfcmluZ193
cml0ZShyaW5nLCBhZGRyICYgMHhmZmZmZmZmYyk7Cj4gICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgdXBwZXJfMzJfYml0cyhhZGRyKSAmIDB4ZmZmZmZmZmYpOwo+ICAgCWFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIHNlcSk7IC8qIHJlZmVyZW5jZSAqLwo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgMHhmZmZmZmZmKTsgLyogbWFzayAqLwo+ICsJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMHhm
ZmZmZmZmZik7IC8qIG1hc2sgKi8KCkhvdyBhYm91dCB+MHUgaW5zdGVhZD8KCgotLSAKRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8v
cmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4

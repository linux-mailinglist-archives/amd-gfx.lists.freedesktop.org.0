Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B5A4D6D
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 05:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C17899C7;
	Mon,  2 Sep 2019 03:09:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06031899C7
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 03:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9456E10C6960
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 03:09:16 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03AE15D9CD
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 03:09:15 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] radeon: add option so DVI always respect HPD over DDC
Date: Mon,  2 Sep 2019 13:09:15 +1000
Message-Id: <20190902030915.20116-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Mon, 02 Sep 2019 03:09:16 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClB1cmVsaW5rIEZYLUQxMjAg
KERWSSBvdmVyIGZpYnJlIGV4dGVuZGVkZXJzKSBkcml2ZSB0aGUgSFBEIGxpbmUKbG93IG9uIHRo
ZSBHUFUgc2lkZSB3aGVuIHRoZSBtb25pdG9yIHNpZGUgZGV2aWNlIGlzIHVucGx1Z2dlZApvciBs
b3NlcyB0aGUgY29ubmVjdGlvbi4gSG93ZXZlciB0aGUgR1BVIHNpZGUgZGV2aWNlIHNlZW1zIHRv
IGNhY2hlCkVESUQgaW4gdGhpcyBjYXNlLiBQZXIgRFZJIHNwZWMgdGhlIEhQRCBsaW5lIG11c3Qg
YmUgZHJpdmVuIGluIG9yZGVyCmZvciBFRElEIHRvIGJlIGRvbmUsIGJ1dCB3ZSd2ZSBtZXQgZW5v
dWdoIGJyb2tlbiBkZXZpY2VzIChtYWlubHkKVkdBLT5EVkkgY29udmVydG9ycykgdGhhdCBkbyB0
aGUgd3JvbmcgdGhpbmcgd2l0aCBIUEQgdGhhdCB3ZSBpZ25vcmUKaXQgaWYgYSBEREMgcHJvYmUg
c3VjY2VlZHMuCgpUaGlzIHBhdGNoIGFkZHMgYW4gb3B0aW9uIHRvIHRoZSByYWRlb24gZHJpdmVy
IHRvIGFsd2F5cyByZXNwZWN0IEhQRApvbiBEVkkgY29ubmVjdG9ycyBzdWNoIHRoYXQgaWYgdGhl
IEhQRCBsaW5lIGlzbid0IGRyaXZlbiB0aGVuIEVESUQKaXNuJ3QgcHJvYmVkLgoKU2lnbmVkLW9m
Zi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbi5oICAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Nvbm5lY3RvcnMuYyB8IDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMgICAgICAgIHwgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAppbmRleCAzMjgwOGU1MGJlMTIuLmQ1NzJl
OGRlZDliOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCkBAIC0xMTcsNiArMTE3LDcgQEAgZXh0
ZXJuIGludCByYWRlb25fdXZkOwogZXh0ZXJuIGludCByYWRlb25fdmNlOwogZXh0ZXJuIGludCBy
YWRlb25fc2lfc3VwcG9ydDsKIGV4dGVybiBpbnQgcmFkZW9uX2Npa19zdXBwb3J0OworZXh0ZXJu
IGludCByYWRlb25fcmVzcGVjdF9ocGQ7CiAKIC8qCiAgKiBDb3B5IGZyb20gcmFkZW9uX2Rydi5o
IHNvIHdlIGRvbid0IGhhdmUgdG8gaW5jbHVkZSBib3RoIGFuZCBoYXZlIGNvbmZsaWN0aW5nCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKaW5kZXggYzYwZDFhNDRk
MjJhLi5lOWIzOTI0ZGYwNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Nvbm5lY3RvcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25u
ZWN0b3JzLmMKQEAgLTEyNjUsNiArMTI2NSwxMyBAQCByYWRlb25fZHZpX2RldGVjdChzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQogCQlnb3RvIGV4aXQ7CiAJfQog
CisJaWYgKHJhZGVvbl9yZXNwZWN0X2hwZCAmJiByYWRlb25fY29ubmVjdG9yLT5ocGQuaHBkICE9
IFJBREVPTl9IUERfTk9ORSkgeworCQlpZiAoIXJhZGVvbl9ocGRfc2Vuc2UocmRldiwgcmFkZW9u
X2Nvbm5lY3Rvci0+aHBkLmhwZCkpIHsKKwkJCXJldCA9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29u
bmVjdGVkOworCQkJZ290byBleGl0OworCQl9CisJfQorCiAJaWYgKHJhZGVvbl9jb25uZWN0b3It
PmRkY19idXMpIHsKIAkJZHJldCA9IHJhZGVvbl9kZGNfcHJvYmUocmFkZW9uX2Nvbm5lY3Rvciwg
ZmFsc2UpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IGE2Y2JlMTFmNzlj
Ni4uNTU2YWUzODFlYTg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwpAQCAtMjA3
LDYgKzIwNyw3IEBAIGludCByYWRlb25fYXV4Y2ggPSAtMTsKIGludCByYWRlb25fbXN0ID0gMDsK
IGludCByYWRlb25fdXZkID0gMTsKIGludCByYWRlb25fdmNlID0gMTsKK2ludCByYWRlb25fcmVz
cGVjdF9ocGQgPSAwOwogCiBNT0RVTEVfUEFSTV9ERVNDKG5vX3diLCAiRGlzYWJsZSBBR1Agd3Jp
dGViYWNrIGZvciBzY3JhdGNoIHJlZ2lzdGVycyIpOwogbW9kdWxlX3BhcmFtX25hbWVkKG5vX3di
LCByYWRlb25fbm9fd2IsIGludCwgMDQ0NCk7CkBAIC0zMTIsNiArMzEzLDkgQEAgaW50IHJhZGVv
bl9jaWtfc3VwcG9ydCA9IDE7CiBNT0RVTEVfUEFSTV9ERVNDKGNpa19zdXBwb3J0LCAiQ0lLIHN1
cHBvcnQgKDEgPSBlbmFibGVkIChkZWZhdWx0KSwgMCA9IGRpc2FibGVkKSIpOwogbW9kdWxlX3Bh
cmFtX25hbWVkKGNpa19zdXBwb3J0LCByYWRlb25fY2lrX3N1cHBvcnQsIGludCwgMDQ0NCk7CiAK
K01PRFVMRV9QQVJNX0RFU0MocmVzcGVjdF9ocGQsICJGb3IgRFZJIGFsd2F5cyBiZWxpZXZlIEhQ
RCIpOworbW9kdWxlX3BhcmFtX25hbWVkKHJlc3BlY3RfaHBkLCByYWRlb25fcmVzcGVjdF9ocGQs
IGludCwgMDY0NCk7CisKIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9
IHsKIAlyYWRlb25fUENJX0lEUwogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4

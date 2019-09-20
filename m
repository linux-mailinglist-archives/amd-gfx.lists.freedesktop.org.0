Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316FB942E
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 17:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C286E088;
	Fri, 20 Sep 2019 15:40:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAD0A6E088
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 15:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 47A4D2AA168
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 17:40:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3nppLjjBNGQP for <amd-gfx@lists.freedesktop.org>;
 Fri, 20 Sep 2019 17:40:05 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 155242AA0D4
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 17:40:05 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>) id 1iBL0u-0000to-MO
 for amd-gfx@lists.freedesktop.org; Fri, 20 Sep 2019 17:40:04 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati] Don't call unreference FB of pixmaps from
 different screens in LeaveVT
Date: Fri, 20 Sep 2019 17:40:04 +0200
Message-Id: <20190920154004.3413-1-michel@daenzer.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpGaW5kQ2xpZW50UmVz
b3VyY2VzQnlUeXBlIGZpbmRzIHBpeG1hcHMgZnJvbSBhbGwgc2NyZWVucywgYnV0IHRyeWluZyB0
bwpwcm9jZXNzIG9uZXMgZnJvbSBvdGhlciBzY3JlZW5zIGhlcmUgbWFrZXMgbm8gc2Vuc2UgYW5k
IGxpa2VseSByZXN1bHRzCmluIGEgY3Jhc2ggb3IgbWVtb3J5IGNvcnJ1cHRpb24uCgpTaWduZWQt
b2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KLS0tCiBzcmMvcmFk
ZW9uX2ttcy5jIHwgMjcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL3Jh
ZGVvbl9rbXMuYyBiL3NyYy9yYWRlb25fa21zLmMKaW5kZXggNzc3ZmMxNGVlLi45NjUwNTMzNGQg
MTAwNjQ0Ci0tLSBhL3NyYy9yYWRlb25fa21zLmMKKysrIGIvc3JjL3JhZGVvbl9rbXMuYwpAQCAt
MjYwMiwxNiArMjYwMiwyNSBAQCBDQVJEMzIgY2xlYW51cF9ibGFja19mYihPc1RpbWVyUHRyIHRp
bWVyLCBDQVJEMzIgbm93LCBwb2ludGVyIGRhdGEpCiB9CiAKIHN0YXRpYyB2b2lkCi1waXhtYXBf
dW5yZWZfZmIodm9pZCAqdmFsdWUsIFhJRCBpZCwgdm9pZCAqY2RhdGEpCitwaXhtYXBfdW5yZWZf
ZmIoUGl4bWFwUHRyIHBpeG1hcCkKIHsKLSAgICBQaXhtYXBQdHIgcGl4bWFwID0gdmFsdWU7Ci0g
ICAgUkFERU9ORW50UHRyIHBSQURFT05FbnQgPSBjZGF0YTsKKyAgICBTY3JuSW5mb1B0ciBzY3Ju
ID0geGY4NlNjcmVlblRvU2NybihwaXhtYXAtPmRyYXdhYmxlLnBTY3JlZW4pOwogICAgIHN0cnVj
dCBkcm1tb2RlX2ZiICoqZmJfcHRyID0gcmFkZW9uX3BpeG1hcF9nZXRfZmJfcHRyKHBpeG1hcCk7
CisgICAgUkFERU9ORW50UHRyIHBSQURFT05FbnQgPSBSQURFT05FbnRQcml2KHNjcm4pOwogCiAg
ICAgaWYgKGZiX3B0cikKIAlkcm1tb2RlX2ZiX3JlZmVyZW5jZShwUkFERU9ORW50LT5mZCwgZmJf
cHRyLCBOVUxMKTsKIH0KIAorc3RhdGljIHZvaWQKK2NsaWVudF9waXhtYXBfdW5yZWZfZmIodm9p
ZCAqdmFsdWUsIFhJRCBpZCwgdm9pZCAqcFNjcmVlbikKK3sKKyAgICBQaXhtYXBQdHIgcGl4bWFw
ID0gdmFsdWU7CisKKyAgICBpZiAocGl4bWFwLT5kcmF3YWJsZS5wU2NyZWVuID09IHBTY3JlZW4p
CisJcGl4bWFwX3VucmVmX2ZiKHBpeG1hcCk7Cit9CisKIHZvaWQgUkFERU9OTGVhdmVWVF9LTVMo
U2NybkluZm9QdHIgcFNjcm4pCiB7CiAgICAgUkFERU9OSW5mb1B0ciAgaW5mbyAgPSBSQURFT05Q
VFIocFNjcm4pOwpAQCAtMjY2NywxMSArMjY3Niw5IEBAIHZvaWQgUkFERU9OTGVhdmVWVF9LTVMo
U2NybkluZm9QdHIgcFNjcm4pCiAKIAkJCWlmIChwU2Nybi0+aXNfZ3B1KSB7CiAJCQkgICAgaWYg
KGRybW1vZGVfY3J0Yy0+c2Nhbm91dFswXS5waXhtYXApCi0JCQkJcGl4bWFwX3VucmVmX2ZiKGRy
bW1vZGVfY3J0Yy0+c2Nhbm91dFswXS5waXhtYXAsCi0JCQkJCQlOb25lLCBwUkFERU9ORW50KTsK
KwkJCQlwaXhtYXBfdW5yZWZfZmIoZHJtbW9kZV9jcnRjLT5zY2Fub3V0WzBdLnBpeG1hcCk7CiAJ
CQkgICAgaWYgKGRybW1vZGVfY3J0Yy0+c2Nhbm91dFsxXS5waXhtYXApCi0JCQkJcGl4bWFwX3Vu
cmVmX2ZiKGRybW1vZGVfY3J0Yy0+c2Nhbm91dFsxXS5waXhtYXAsCi0JCQkJCQlOb25lLCBwUkFE
RU9ORW50KTsKKwkJCQlwaXhtYXBfdW5yZWZfZmIoZHJtbW9kZV9jcnRjLT5zY2Fub3V0WzFdLnBp
eG1hcCk7CiAJCQl9IGVsc2UgewogCQkJICAgIGRybW1vZGVfY3J0Y19zY2Fub3V0X2ZyZWUoY3J0
Yyk7CiAJCQl9CkBAIC0yNjkxLDExICsyNjk4LDExIEBAIHZvaWQgUkFERU9OTGVhdmVWVF9LTVMo
U2NybkluZm9QdHIgcFNjcm4pCiAJCSghY2xpZW50c1tpXSB8fCBjbGllbnRzW2ldLT5jbGllbnRT
dGF0ZSAhPSBDbGllbnRTdGF0ZVJ1bm5pbmcpKQogCQljb250aW51ZTsKIAotCSAgICBGaW5kQ2xp
ZW50UmVzb3VyY2VzQnlUeXBlKGNsaWVudHNbaV0sIFJUX1BJWE1BUCwgcGl4bWFwX3VucmVmX2Zi
LAotCQkJCSAgICAgIHBSQURFT05FbnQpOworCSAgICBGaW5kQ2xpZW50UmVzb3VyY2VzQnlUeXBl
KGNsaWVudHNbaV0sIFJUX1BJWE1BUCwKKwkJCQkgICAgICBjbGllbnRfcGl4bWFwX3VucmVmX2Zi
LCBwU2NyZWVuKTsKIAl9CiAKLQlwaXhtYXBfdW5yZWZfZmIocFNjcmVlbi0+R2V0U2NyZWVuUGl4
bWFwKHBTY3JlZW4pLCBOb25lLCBwUkFERU9ORW50KTsKKwlwaXhtYXBfdW5yZWZfZmIocFNjcmVl
bi0+R2V0U2NyZWVuUGl4bWFwKHBTY3JlZW4pKTsKICAgICB9IGVsc2UgewogCW1lbXNldChpbmZv
LT5mcm9udF9idWZmZXItPmJvLnJhZGVvbi0+cHRyLCAwLAogCSAgICAgICBwU2Nybi0+ZGlzcGxh
eVdpZHRoICogaW5mby0+cGl4ZWxfYnl0ZXMgKiBwU2Nybi0+dmlydHVhbFkpOwotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

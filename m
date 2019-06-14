Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B04589F
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 11:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ADE894A7;
	Fri, 14 Jun 2019 09:27:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1E3C89487
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 09:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0FC7F2A6042
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 11:27:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id rEtLH_XGJQRW for <amd-gfx@lists.freedesktop.org>;
 Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 375EC2A604A
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hbiUr-0001BF-Qg
 for amd-gfx@lists.freedesktop.org; Fri, 14 Jun 2019 11:27:45 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati 3/3] Remove dri2_drawable_crtc parameter
 consider_disabled
Date: Fri, 14 Jun 2019 11:27:45 +0200
Message-Id: <20190614092745.4488-3-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614092745.4488-1-michel@daenzer.net>
References: <20190614092745.4488-1-michel@daenzer.net>
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpBbGwgY2FsbGVy
cyB3ZXJlIHBhc3NpbmcgVFJVRS4KCihQb3J0ZWQgZnJvbSBhbWRncHUgY29tbWl0IGVhMTlhNTIw
NzA1NGJiMTU5ZmM3ZmI2ZDg4ZTBjZWIxMGMzZGEwMTApCgpTaWduZWQtb2ZmLWJ5OiBNaWNoZWwg
RMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KLS0tCiBzcmMvcmFkZW9uX2RyaTIuYyB8
IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL3JhZGVvbl9kcmkyLmMgYi9zcmMvcmFkZW9uX2RyaTIu
YwppbmRleCBjNTlkNzk5ZmYuLjY2YTIyM2Q4NyAxMDA2NDQKLS0tIGEvc3JjL3JhZGVvbl9kcmky
LmMKKysrIGIvc3JjL3JhZGVvbl9kcmkyLmMKQEAgLTUwOSwxMSArNTA5LDExIEBAIHN0YXRpYyBC
b29sIHJhZGVvbl9kcmkyX2dldF9jcnRjX21zYyh4Zjg2Q3J0Y1B0ciBjcnRjLCBDQVJENjQgKnVz
dCwgQ0FSRDY0ICptc2MpCiB9CiAKIHN0YXRpYwoteGY4NkNydGNQdHIgcmFkZW9uX2RyaTJfZHJh
d2FibGVfY3J0YyhEcmF3YWJsZVB0ciBwRHJhdywgQm9vbCBjb25zaWRlcl9kaXNhYmxlZCkKK3hm
ODZDcnRjUHRyIHJhZGVvbl9kcmkyX2RyYXdhYmxlX2NydGMoRHJhd2FibGVQdHIgcERyYXcpCiB7
CiAgICAgU2NyZWVuUHRyIHBTY3JlZW4gPSBwRHJhdy0+cFNjcmVlbjsKICAgICBTY3JuSW5mb1B0
ciBwU2NybiA9IHhmODZTY3JlZW5Ub1Njcm4ocFNjcmVlbik7Ci0gICAgeGY4NkNydGNQdHIgY3J0
YyA9IHJhZGVvbl9waWNrX2Jlc3RfY3J0YyhwU2NybiwgY29uc2lkZXJfZGlzYWJsZWQsCisgICAg
eGY4NkNydGNQdHIgY3J0YyA9IHJhZGVvbl9waWNrX2Jlc3RfY3J0YyhwU2NybiwgVFJVRSwKIAkJ
CQkJICAgICAgcERyYXctPngsIHBEcmF3LT54ICsgcERyYXctPndpZHRoLAogCQkJCQkgICAgICBw
RHJhdy0+eSwgcERyYXctPnkgKyBwRHJhdy0+aGVpZ2h0KTsKIApAQCAtOTI4LDcgKzkyOCw3IEBA
IENBUkQzMiByYWRlb25fZHJpMl9leHRyYXBvbGF0ZV9tc2NfZGVsYXkoeGY4NkNydGNQdHIgY3J0
YywgQ0FSRDY0ICp0YXJnZXRfbXNjLAogICovCiBzdGF0aWMgaW50IHJhZGVvbl9kcmkyX2dldF9t
c2MoRHJhd2FibGVQdHIgZHJhdywgQ0FSRDY0ICp1c3QsIENBUkQ2NCAqbXNjKQogewotICAgIHhm
ODZDcnRjUHRyIGNydGMgPSByYWRlb25fZHJpMl9kcmF3YWJsZV9jcnRjKGRyYXcsIFRSVUUpOwor
ICAgIHhmODZDcnRjUHRyIGNydGMgPSByYWRlb25fZHJpMl9kcmF3YWJsZV9jcnRjKGRyYXcpOwog
CiAgICAgLyogRHJhd2FibGUgbm90IGRpc3BsYXllZCwgbWFrZSB1cCBhIHZhbHVlICovCiAgICAg
aWYgKCFjcnRjKSB7CkBAIC0xMDQzLDcgKzEwNDMsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9kcmky
X3NjaGVkdWxlX3dhaXRfbXNjKENsaWVudFB0ciBjbGllbnQsIERyYXdhYmxlUHRyIGRyYXcsCiAg
ICAgU2NybkluZm9QdHIgc2NybiA9IHhmODZTY3JlZW5Ub1Njcm4oc2NyZWVuKTsKICAgICBEUkky
RnJhbWVFdmVudFB0ciB3YWl0X2luZm8gPSBOVUxMOwogICAgIHVpbnRwdHJfdCBkcm1fcXVldWVf
c2VxID0gMDsKLSAgICB4Zjg2Q3J0Y1B0ciBjcnRjID0gcmFkZW9uX2RyaTJfZHJhd2FibGVfY3J0
YyhkcmF3LCBUUlVFKTsKKyAgICB4Zjg2Q3J0Y1B0ciBjcnRjID0gcmFkZW9uX2RyaTJfZHJhd2Fi
bGVfY3J0YyhkcmF3KTsKICAgICB1aW50MzJfdCBtc2NfZGVsdGE7CiAgICAgdWludDMyX3Qgc2Vx
OwogICAgIENBUkQ2NCBjdXJyZW50X21zYzsKQEAgLTExOTIsNyArMTE5Miw3IEBAIHN0YXRpYyBp
bnQgcmFkZW9uX2RyaTJfc2NoZWR1bGVfc3dhcChDbGllbnRQdHIgY2xpZW50LCBEcmF3YWJsZVB0
ciBkcmF3LAogewogICAgIFNjcmVlblB0ciBzY3JlZW4gPSBkcmF3LT5wU2NyZWVuOwogICAgIFNj
cm5JbmZvUHRyIHNjcm4gPSB4Zjg2U2NyZWVuVG9TY3JuKHNjcmVlbik7Ci0gICAgeGY4NkNydGNQ
dHIgY3J0YyA9IHJhZGVvbl9kcmkyX2RyYXdhYmxlX2NydGMoZHJhdywgVFJVRSk7CisgICAgeGY4
NkNydGNQdHIgY3J0YyA9IHJhZGVvbl9kcmkyX2RyYXdhYmxlX2NydGMoZHJhdyk7CiAgICAgdWlu
dDMyX3QgbXNjX2RlbHRhOwogICAgIGRybVZCbGFua1NlcVR5cGUgdHlwZTsKICAgICB1aW50MzJf
dCBzZXE7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==

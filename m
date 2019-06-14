Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0744589E
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 11:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490CE894C5;
	Fri, 14 Jun 2019 09:27:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9207E89487
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 09:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id EC0D02A604A
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 11:27:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id xmISeOduBkvN for <amd-gfx@lists.freedesktop.org>;
 Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 365C92A6048
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hbiUr-0001BD-Pu
 for amd-gfx@lists.freedesktop.org; Fri, 14 Jun 2019 11:27:45 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati 2/3] dri2: Re-use previous CRTC when possible
 if pick_best_crtc returns NULL
Date: Fri, 14 Jun 2019 11:27:44 +0200
Message-Id: <20190614092745.4488-2-michel@daenzer.net>
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpUaGlzIHdheSwg
dGhlIE1TQyB3aWxsIGNvbnRpbnVlIHRpY2tpbmcgYXQgdGhlIHJhdGUgb2YgKHRoZSBsYXN0IG1v
ZGUKd2hpY2ggd2FzIGVuYWJsZWQgZm9yKSB0aGF0IENSVEMsIGluc3RlYWQgb2YgdGhlIGNsaWVu
dCBydW5uaW5nCnVudGhyb3R0bGVkLgoKKFBvcnRlZCBmcm9tIGFtZGdwdSBjb21taXQgMzEwOWYw
ODhmZGJkODljMmVlODA3ODYyNWQ0ZjA3Mzg1MjQ5MjY1NikKClNpZ25lZC1vZmYtYnk6IE1pY2hl
bCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBhbWQuY29tPgotLS0KIHNyYy9yYWRlb25fZHJpMi5j
IHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvc3JjL3JhZGVvbl9kcmkyLmMgYi9zcmMvcmFkZW9uX2RyaTIuYwpp
bmRleCAzYzA0ZTZmZTkuLmM1OWQ3OTlmZiAxMDA2NDQKLS0tIGEvc3JjL3JhZGVvbl9kcmkyLmMK
KysrIGIvc3JjL3JhZGVvbl9kcmkyLmMKQEAgLTUxNywxMCArNTE3LDEyIEBAIHhmODZDcnRjUHRy
IHJhZGVvbl9kcmkyX2RyYXdhYmxlX2NydGMoRHJhd2FibGVQdHIgcERyYXcsIEJvb2wgY29uc2lk
ZXJfZGlzYWJsZWQpCiAJCQkJCSAgICAgIHBEcmF3LT54LCBwRHJhdy0+eCArIHBEcmF3LT53aWR0
aCwKIAkJCQkJICAgICAgcERyYXctPnksIHBEcmF3LT55ICsgcERyYXctPmhlaWdodCk7CiAKLSAg
ICBpZiAoY3J0YyAmJiBwRHJhdy0+dHlwZSA9PSBEUkFXQUJMRV9XSU5ET1cpIHsKKyAgICBpZiAo
cERyYXctPnR5cGUgPT0gRFJBV0FCTEVfV0lORE9XKSB7CiAJc3RydWN0IGRyaTJfd2luZG93X3By
aXYgKnByaXYgPSBnZXRfZHJpMl93aW5kb3dfcHJpdigoV2luZG93UHRyKXBEcmF3KTsKIAotCWlm
IChwcml2LT5jcnRjICYmIHByaXYtPmNydGMgIT0gY3J0YykgeworCWlmICghY3J0YykgeworCSAg
ICBjcnRjID0gcHJpdi0+Y3J0YzsKKwl9IGVsc2UgaWYgKHByaXYtPmNydGMgJiYgcHJpdi0+Y3J0
YyAhPSBjcnRjKSB7CiAJICAgIENBUkQ2NCB1c3QsIG1zY29sZCwgbXNjbmV3OwogCiAJICAgIGlm
IChyYWRlb25fZHJpMl9nZXRfY3J0Y19tc2MocHJpdi0+Y3J0YywgJnVzdCwgJm1zY29sZCkgJiYK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

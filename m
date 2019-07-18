Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1D6D1E4
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1146E42A;
	Thu, 18 Jul 2019 16:19:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB5896E42A
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 16:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0914B2B200E
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 18:19:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id xPBsVRTynDeg for <amd-gfx@lists.freedesktop.org>;
 Thu, 18 Jul 2019 18:19:43 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id BDFBF2B200C
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 18:19:43 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1ho98B-00056H-9Q
 for amd-gfx@lists.freedesktop.org; Thu, 18 Jul 2019 18:19:43 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati] Don't disable page flipping completely with SW
 cursor
Date: Thu, 18 Jul 2019 18:19:43 +0200
Message-Id: <20190718161943.19562-1-michel@daenzer.net>
X-Mailer: git-send-email 2.22.0
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpFdmVuIHdpdGgg
U1cgY3Vyc29yLCBwYWdlIGZsaXBwaW5nIGNhbiBiZSB1c2VkIHdoaWxlIG5vIFggY3Vyc29yIGlz
CnZpc2libGUuCgpPY2N1cnJlZCB0byBtZSBpbiB0aGUgY29udGV4dCBvZiB4b3JnL3hzZXJ2ZXIj
ODI4LgooUG9ydGVkIGZyb20gYW1kZ3B1IGNvbW1pdCA4N2Y0MWFjZTQ5MjBmZDIwNjk3OTQyMTE2
ODM2NTllYjI1YjAyNWE2KQoKU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5k
YWVuemVyQGFtZC5jb20+Ci0tLQogc3JjL3JhZGVvbl9rbXMuYyB8IDggKystLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
c3JjL3JhZGVvbl9rbXMuYyBiL3NyYy9yYWRlb25fa21zLmMKaW5kZXggZmY0ZjhkY2Y2Li43Nzdm
YzE0ZWUgMTAwNjQ0Ci0tLSBhL3NyYy9yYWRlb25fa21zLmMKKysrIGIvc3JjL3JhZGVvbl9rbXMu
YwpAQCAtMTkxNywxOSArMTkxNywxNSBAQCBCb29sIFJBREVPTlByZUluaXRfS01TKFNjcm5JbmZv
UHRyIHBTY3JuLCBpbnQgZmxhZ3MpCiAKICAgICBpZiAoIXBTY3JuLT5pc19ncHUpIHsKIAlpZiAo
aW5mby0+ZHJpMi5wS2VybmVsRFJNVmVyc2lvbi0+dmVyc2lvbl9taW5vciA+PSA4KSB7Ci0JICAg
IEJvb2wgc3dfY3Vyc29yID0geGY4NlJldHVybk9wdFZhbEJvb2woaW5mby0+T3B0aW9ucywKLQkJ
CQkJCSAgT1BUSU9OX1NXX0NVUlNPUiwgRkFMU0UpOwotCiAJICAgIGluZm8tPmFsbG93UGFnZUZs
aXAgPSB4Zjg2UmV0dXJuT3B0VmFsQm9vbChpbmZvLT5PcHRpb25zLAogCQkJCQkJICAgICAgIE9Q
VElPTl9QQUdFX0ZMSVAsIFRSVUUpOwogCi0JICAgIGlmIChzd19jdXJzb3IgfHwgaW5mby0+c2hh
ZG93X3ByaW1hcnkpIHsKKwkgICAgaWYgKGluZm8tPnNoYWRvd19wcmltYXJ5KSB7CiAJCXhmODZE
cnZNc2cocFNjcm4tPnNjcm5JbmRleCwKIAkJCSAgIGluZm8tPmFsbG93UGFnZUZsaXAgPyBYX1dB
Uk5JTkcgOiBYX0RFRkFVTFQsCiAJCQkgICAiS01TIFBhZ2VmbGlwcGluZzogZGlzYWJsZWQlc1xu
IiwKIAkJCSAgIGluZm8tPmFsbG93UGFnZUZsaXAgPwotCQkJICAgKHN3X2N1cnNvciA/ICIgYmVj
YXVzZSBvZiBTV2N1cnNvciIgOgotCQkJICAgICIgYmVjYXVzZSBvZiBTaGFkb3dQcmltYXJ5Iikg
OiAiIik7CisJCQkgICAiIGJlY2F1c2Ugb2YgU2hhZG93UHJpbWFyeSIgOiAiIik7CiAJCWluZm8t
PmFsbG93UGFnZUZsaXAgPSBGQUxTRTsKIAkgICAgfSBlbHNlIHsKIAkJeGY4NkRydk1zZyhwU2Ny
bi0+c2NybkluZGV4LCBYX0lORk8sCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D974589D
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 11:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D13689487;
	Fri, 14 Jun 2019 09:27:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2286894A7
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 09:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id D373A2A604B
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EbL4eb47nHdS for <amd-gfx@lists.freedesktop.org>;
 Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 30E602A6042
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 11:27:46 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hbiUr-0001BB-P0
 for amd-gfx@lists.freedesktop.org; Fri, 14 Jun 2019 11:27:45 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati 1/3] dri2: reply to client for WaitMSC request
 in any case
Date: Fri, 14 Jun 2019 11:27:43 +0200
Message-Id: <20190614092745.4488-1-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
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

RnJvbTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4KCm90aGVyd2lzZSBjbGllbnQgd291
bGQgd2FpdCBmb3IgcmVwbHkgZm9yZXZlciBhbmQgZGVza3RvcCBhcHBlYXJzIGhhbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPgooUG9ydGVkIGZyb20gYW1k
Z3B1IGNvbW1pdCBmYjA2ZmI4MTQ3MDBhNDc0NjRhYmQ3NTZlMTExMWRjYzc2ZDBkNzc2KQpTaWdu
ZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KLS0tCiBz
cmMvcmFkZW9uX2RyaTIuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvc3JjL3JhZGVvbl9kcmkyLmMgYi9zcmMvcmFkZW9uX2RyaTIuYwppbmRl
eCBhOWYxNGU4ZDguLjNjMDRlNmZlOSAxMDA2NDQKLS0tIGEvc3JjL3JhZGVvbl9kcmkyLmMKKysr
IGIvc3JjL3JhZGVvbl9kcmkyLmMKQEAgLTExNTYsNiArMTE1Niw5IEBAIHN0YXRpYyBpbnQgcmFk
ZW9uX2RyaTJfc2NoZWR1bGVfd2FpdF9tc2MoQ2xpZW50UHRyIGNsaWVudCwgRHJhd2FibGVQdHIg
ZHJhdywKIG91dF9jb21wbGV0ZToKICAgICBpZiAod2FpdF9pbmZvKQogCXJhZGVvbl9kcmkyX2Rl
ZmVycmVkX2V2ZW50KE5VTEwsIDAsIHdhaXRfaW5mbyk7CisgICAgZWxzZQorCURSSTJXYWl0TVND
Q29tcGxldGUoY2xpZW50LCBkcmF3LCAwLCAwLCAwKTsKKwogICAgIHJldHVybiBUUlVFOwogfQog
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

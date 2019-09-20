Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7256B961F
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 19:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4049C6FD74;
	Fri, 20 Sep 2019 17:01:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 293CA6FD74
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 17:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1C7BA2AA168
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 19:01:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PxQogRCFVPzw for <amd-gfx@lists.freedesktop.org>;
 Fri, 20 Sep 2019 19:00:59 +0200 (CEST)
Received: from kaveri (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D53052AA0D4
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 19:00:59 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>) id 1iBMHD-0001Qu-ET
 for amd-gfx@lists.freedesktop.org; Fri, 20 Sep 2019 19:00:59 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati] Don't set up black scanout buffer if LeaveVT
 is called from CloseScreen
Date: Fri, 20 Sep 2019 19:00:59 +0200
Message-Id: <20190920170059.5465-1-michel@daenzer.net>
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpBdm9pZHMgYSBjcmFz
aCBkZXNjcmliZWQgaW4KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvZHJpdmVy
L3hmODYtdmlkZW8tYW1kZ3B1L21lcmdlX3JlcXVlc3RzLzQzI25vdGVfMjIzNzE4CgooUG9ydGVk
IGZyb20gYW1kZ3B1IGNvbW1pdCA1YjhiYzlmYzUwNWM1NTFkY2Q5YjBlZDVhYjgzNWE0OWZhNGY5
ZmRhKQoKU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+
Ci0tLQogc3JjL3JhZGVvbl9rbXMuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zcmMvcmFkZW9uX2tt
cy5jIGIvc3JjL3JhZGVvbl9rbXMuYwppbmRleCA3NzdmYzE0ZWUuLjEwN2MxY2U3MSAxMDA2NDQK
LS0tIGEvc3JjL3JhZGVvbl9rbXMuYworKysgYi9zcmMvcmFkZW9uX2ttcy5jCkBAIC0yNjI5LDYg
KzI2MjksMTIgQEAgdm9pZCBSQURFT05MZWF2ZVZUX0tNUyhTY3JuSW5mb1B0ciBwU2NybikKIAl1
bnNpZ25lZCB3ID0gMCwgaCA9IDA7CiAJaW50IGk7CiAKKwkvKiBJZiB3ZSdyZSBjYWxsZWQgZnJv
bSBDbG9zZVNjcmVlbiwgdHJ5aW5nIHRvIGNsZWFyIHRoZSBibGFjaworCSAqIHNjYW5vdXQgQk8g
d2lsbCBsaWtlbHkgY3Jhc2ggYW5kIGJ1cm4KKwkgKi8KKwlpZiAoIXBTY3JlZW4tPkdDcGVyRGVw
dGhbMF0pCisJICAgIGdvdG8gaGlkZV9jdXJzb3JzOworCiAJLyogQ29tcHV0ZSBtYXhpbXVtIHNj
YW5vdXQgZGltZW5zaW9ucyBvZiBhY3RpdmUgQ1JUQ3MgKi8KIAlmb3IgKGkgPSAwOyBpIDwgeGY4
Nl9jb25maWctPm51bV9jcnRjOyBpKyspIHsKIAkgICAgY3J0YyA9IHhmODZfY29uZmlnLT5jcnRj
W2ldOwpAQCAtMjcwMSw4ICsyNzA3LDEwIEBAIHZvaWQgUkFERU9OTGVhdmVWVF9LTVMoU2Nybklu
Zm9QdHIgcFNjcm4pCiAJICAgICAgIHBTY3JuLT5kaXNwbGF5V2lkdGggKiBpbmZvLT5waXhlbF9i
eXRlcyAqIHBTY3JuLT52aXJ0dWFsWSk7CiAgICAgfQogCi0gICAgVGltZXJTZXQoTlVMTCwgMCwg
MTAwMCwgY2xlYW51cF9ibGFja19mYiwgcFNjcmVlbik7CisgICAgaWYgKHBTY3JlZW4tPkdDcGVy
RGVwdGhbMF0pCisJVGltZXJTZXQoTlVMTCwgMCwgMTAwMCwgY2xlYW51cF9ibGFja19mYiwgcFNj
cmVlbik7CiAKKyBoaWRlX2N1cnNvcnM6CiAgICAgeGY4Nl9oaWRlX2N1cnNvcnMgKHBTY3JuKTsK
IAogICAgIHJhZGVvbl9kcm9wX2RybV9tYXN0ZXIocFNjcm4pOwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E014D69523
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 16:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868C899BB;
	Mon, 15 Jul 2019 14:57:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 562 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jul 2019 09:39:06 UTC
Received: from smtp180.sjtu.edu.cn (smtp180.sjtu.edu.cn [202.120.2.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22047898C0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:39:06 +0000 (UTC)
Received: from proxy01.sjtu.edu.cn (unknown [202.112.26.54])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id BB34E100869A2;
 Mon, 15 Jul 2019 17:29:36 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by proxy01.sjtu.edu.cn (Postfix) with ESMTP id A8AAB20434636;
 Mon, 15 Jul 2019 16:54:06 +0800 (CST)
X-Virus-Scanned: amavisd-new at proxy01.sjtu.edu.cn
Received: from proxy01.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy01.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZRZ_Xw7jUIaV; Mon, 15 Jul 2019 16:54:06 +0800 (CST)
Received: from xywang-pc.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: xywang.sjtu@sjtu.edu.cn)
 by proxy01.sjtu.edu.cn (Postfix) with ESMTPA id 792E520424204;
 Mon, 15 Jul 2019 16:54:06 +0800 (CST)
From: xywang.sjtu@sjtu.edu.cn
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 yttao@amd.com
Subject: [PATCH] drm/amdgpu: replace simple_strtol() by kstrtou32()
Date: Mon, 15 Jul 2019 16:53:01 +0800
Message-Id: <20190715085301.5311-1-xywang.sjtu@sjtu.edu.cn>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 15 Jul 2019 14:57:06 +0000
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
Cc: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>, amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2FuZyBYaWF5YW5nIDx4eXdhbmcuc2p0dUBzanR1LmVkdS5jbj4KClRoZSBzaW1wbGVf
c3RydG9sKCkgZnVuY3Rpb24gaXMgZGVwcmVjYXRlZC4ga3N0cnRvW2wsdTMyXSgpIGlzCnRoZSBj
b3JyZWN0IHJlcGxhY2VtZW50IGFzIGl0IGNhbiBwcm9wZXJseSBoYW5kbGUgb3ZlcmZsb3dzLgoK
VGhpcyBwYXRjaCByZXBsYWNlcyB0aGUgZGVwcmVjYXRlZCBzaW1wbGVfc3RydG9sKCkgdXNlIGlu
dHJvZHVjZWQgcmVjZW50bHkuCkFzIGNsayBpcyBvZiB0eXBlIHVpbnQzMl90LCB3ZSBhcmUgc2Fm
ZSB0byB1c2Uga3N0cnRvdTMyKCkuCgpJdCBpcyBhbHNvIHNhZmUgdG8gcmV0dXJuIHplcm8gb24g
c3RyaW5nIHBhcnNpbmcgZXJyb3IsCnNpbWlsYXIgdG8gdGhlIGNhc2Ugb2YgcmV0dXJuaW5nIHpl
cm8gaWYgYnVmIGlzIGVtcHR5IGluIHBhcnNlX2NsaygpLgoKRml4ZXM6IGJiNWEyYmRmMzZhOCAo
ImRybS9hbWRncHU6IHN1cHBvcnQgZHBtIGxldmVsIG1vZGlmaWNhdGlvbiB1bmRlciB2aXJ0dWFs
aXphdGlvbiB2MyIpClNpZ25lZC1vZmYtYnk6IFdhbmcgWGlheWFuZyA8eHl3YW5nLnNqdHVAc2p0
dS5lZHUuY24+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMKaW5kZXggN2Q0ODRmYWQzOTA5
Li4yYWRkYTQ3ZGVmNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92aXJ0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQu
YwpAQCAtMzg2LDcgKzM4Niw4IEBAIHN0YXRpYyB1aW50MzJfdCBwYXJzZV9jbGsoY2hhciAqYnVm
LCBib29sIG1pbikKICAgICAgICAgICAgICAgICBpZiAoIXB0cikKICAgICAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgIHB0cis9MjsKLSAgICAgICAgICAgICAgICBj
bGsgPSBzaW1wbGVfc3RydG91bChwdHIsIE5VTEwsIDEwKTsKKwkJaWYgKGtzdHJ0b3UzMihwdHIs
IDEwLCAmY2xrKSkKKwkJCXJldHVybiAwOwogICAgICAgICB9IHdoaWxlICghbWluKTsKIAogICAg
ICAgICByZXR1cm4gY2xrICogMTAwOwotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=

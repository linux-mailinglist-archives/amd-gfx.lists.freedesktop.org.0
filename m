Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD896D9B8
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 05:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4E96E4AF;
	Fri, 19 Jul 2019 03:57:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE72C6E4B2;
 Fri, 19 Jul 2019 03:57:56 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E652C21851;
 Fri, 19 Jul 2019 03:57:55 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 028/171] drm/amdkfd: Fix sdma queue map issue
Date: Thu, 18 Jul 2019 23:54:19 -0400
Message-Id: <20190719035643.14300-28-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508676;
 bh=nxYKYXfveCqtb0rO+c1any+jTsC8a+P3hYgpDWMJbSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ppzYVLhhxtiAzF9JKFSdl9ZK2tATbBZYylqKBJnCLwjJzQo5pCz4Uo3OyGl0oQY8i
 wjeANxXNiXjN2vz42q27JX+vr5w8HQ5ZZ+A9hiT2h5doIbD632kCbc0wOFIYtVc5rt
 vdGYK4UhcEhUDX7SvuGMDlJDPV90xhaAf5gGpZaM=
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
Cc: Sasha Levin <sashal@kernel.org>, Oak Zeng <Oak.Zeng@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCAwNjVl
NGJkZmExZjNhYjI4ODRjMTEwMzk0ZDhiN2U3ZWJlM2I5ODhjIF0KClByZXZpb3VzIGNvZGVzIGFz
c3VtZXMgdGhlcmUgYXJlIHR3byBzZG1hIGVuZ2luZXMuClRoaXMgaXMgbm90IHRydWUgZS5nLiwg
UmF2ZW4gb25seSBoYXMgMSBTRE1BIGVuZ2luZS4KRml4IHRoZSBpc3N1ZSBieSB1c2luZyBzZG1h
IGVuZ2luZSBudW1iZXIgaW5mbyBpbgpkZXZpY2VfaW5mby4KClNpZ25lZC1vZmYtYnk6IE9hayBa
ZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4KLS0tCiAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMg
fCAyMSArKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jCmluZGV4IGFlMzgxNDUwNjAxYy4uYWZiYWY2ZjUx
MzFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuYwpAQCAtMTI2OCwxMiArMTI2OCwxNyBAQCBpbnQgYW1ka2ZkX2ZlbmNl
X3dhaXRfdGltZW91dCh1bnNpZ25lZCBpbnQgKmZlbmNlX2FkZHIsCiAJcmV0dXJuIDA7CiB9CiAK
LXN0YXRpYyBpbnQgdW5tYXBfc2RtYV9xdWV1ZXMoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2Vy
ICpkcW0sCi0JCQkJdW5zaWduZWQgaW50IHNkbWFfZW5naW5lKQorc3RhdGljIGludCB1bm1hcF9z
ZG1hX3F1ZXVlcyhzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkKIHsKLQlyZXR1cm4g
cG1fc2VuZF91bm1hcF9xdWV1ZSgmZHFtLT5wYWNrZXRzLCBLRkRfUVVFVUVfVFlQRV9TRE1BLAot
CQkJS0ZEX1VOTUFQX1FVRVVFU19GSUxURVJfRFlOQU1JQ19RVUVVRVMsIDAsIGZhbHNlLAotCQkJ
c2RtYV9lbmdpbmUpOworCWludCBpLCByZXR2YWwgPSAwOworCisJZm9yIChpID0gMDsgaSA8IGRx
bS0+ZGV2LT5kZXZpY2VfaW5mby0+bnVtX3NkbWFfZW5naW5lczsgaSsrKSB7CisJCXJldHZhbCA9
IHBtX3NlbmRfdW5tYXBfcXVldWUoJmRxbS0+cGFja2V0cywgS0ZEX1FVRVVFX1RZUEVfU0RNQSwK
KwkJCUtGRF9VTk1BUF9RVUVVRVNfRklMVEVSX0RZTkFNSUNfUVVFVUVTLCAwLCBmYWxzZSwgaSk7
CisJCWlmIChyZXR2YWwpCisJCQlyZXR1cm4gcmV0dmFsOworCX0KKwlyZXR1cm4gcmV0dmFsOwog
fQogCiAvKiBkcW0tPmxvY2sgbXV0ZXggaGFzIHRvIGJlIGxvY2tlZCBiZWZvcmUgY2FsbGluZyB0
aGlzIGZ1bmN0aW9uICovCkBAIC0xMzEyLDEwICsxMzE3LDggQEAgc3RhdGljIGludCB1bm1hcF9x
dWV1ZXNfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCiAJcHJfZGVidWco
IkJlZm9yZSBkZXN0cm95aW5nIHF1ZXVlcywgc2RtYSBxdWV1ZSBjb3VudCBpcyA6ICV1XG4iLAog
CQlkcW0tPnNkbWFfcXVldWVfY291bnQpOwogCi0JaWYgKGRxbS0+c2RtYV9xdWV1ZV9jb3VudCA+
IDApIHsKLQkJdW5tYXBfc2RtYV9xdWV1ZXMoZHFtLCAwKTsKLQkJdW5tYXBfc2RtYV9xdWV1ZXMo
ZHFtLCAxKTsKLQl9CisJaWYgKGRxbS0+c2RtYV9xdWV1ZV9jb3VudCA+IDApCisJCXVubWFwX3Nk
bWFfcXVldWVzKGRxbSk7CiAKIAlyZXR2YWwgPSBwbV9zZW5kX3VubWFwX3F1ZXVlKCZkcW0tPnBh
Y2tldHMsIEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUsCiAJCQlmaWx0ZXIsIGZpbHRlcl9wYXJhbSwg
ZmFsc2UsIDApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=

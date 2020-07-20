Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C7227076
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Jul 2020 23:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313C289C5E;
	Mon, 20 Jul 2020 21:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7EC89C49;
 Mon, 20 Jul 2020 21:38:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C93522CAF;
 Mon, 20 Jul 2020 21:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595281113;
 bh=oGUrR/3CifRJrhJzUDoT4zDQtGxfmbqA1TZdgk9HqjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dt/Zcx5hAXics12s2KptXMk/N0LpFuM921zCOGgmsbcoDah1zUbINLAiwsIf7P0lF
 qvywkYTABA6JG9pO2T6eahwcDNZtY1C2PbRob3p3JE1cs/QSQi6gflgb7OX9VYgLer
 c6v20r7/FnTZOTKHrsXuOinRdWTBPwf1NOjEfpnA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 21/34] drm/amdgpu/gfx10: fix race condition for kiq
Date: Mon, 20 Jul 2020 17:37:54 -0400
Message-Id: <20200720213807.407380-21-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213807.407380-1-sashal@kernel.org>
References: <20200720213807.407380-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Jack Xiao <Jack.Xiao@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDdk
NjVhNTc3YmI1OGQ0ZjI3YTMzOThhNGMwY2IwYjAwYWI3ZDA1MTEgXQoKRHVyaW5nIHByZWVtcHRp
b24gdGVzdCBmb3IgZ2Z4MTAsIGl0IHVzZXMga2lxIHRvIHRyaWdnZXIKZ2Z4IHByZWVtcHRpb24s
IHdoaWNoIHdvdWxkIHJlc3VsdCBpbiByYWNlIGNvbmRpdGlvbgp3aXRoIGZsdXNoaW5nIFRMQiBm
b3Iga2lxLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MF8wLmMKaW5kZXggNmYxMTgyOTJlNDBmYi4uNjRkOTZlYjBhMjMzNyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQ2ODMsMTIgKzQ2ODMsMTcgQEAgc3RhdGljIGlu
dCBnZnhfdjEwXzBfcmluZ19wcmVlbXB0X2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7CiAJc3RydWN0IGFtZGdwdV9r
aXEgKmtpcSA9ICZhZGV2LT5nZngua2lxOwogCXN0cnVjdCBhbWRncHVfcmluZyAqa2lxX3Jpbmcg
PSAma2lxLT5yaW5nOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlpZiAoIWtpcS0+cG1mIHx8
ICFraXEtPnBtZi0+a2lxX3VubWFwX3F1ZXVlcykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlpZiAo
YW1kZ3B1X3JpbmdfYWxsb2Moa2lxX3JpbmcsIGtpcS0+cG1mLT51bm1hcF9xdWV1ZXNfc2l6ZSkp
CisJc3Bpbl9sb2NrX2lycXNhdmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7CisKKwlpZiAoYW1k
Z3B1X3JpbmdfYWxsb2Moa2lxX3JpbmcsIGtpcS0+cG1mLT51bm1hcF9xdWV1ZXNfc2l6ZSkpIHsK
KwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgma2lxLT5yaW5nX2xvY2ssIGZsYWdzKTsKIAkJcmV0
dXJuIC1FTk9NRU07CisJfQogCiAJLyogYXNzZXJ0IHByZWVtcHRpb24gY29uZGl0aW9uICovCiAJ
YW1kZ3B1X3Jpbmdfc2V0X3ByZWVtcHRfY29uZF9leGVjKHJpbmcsIGZhbHNlKTsKQEAgLTQ2OTks
NiArNDcwNCw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX3JpbmdfcHJlZW1wdF9pYihzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcpCiAJCQkJICAgKytyaW5nLT50cmFpbF9zZXEpOwogCWFtZGdwdV9y
aW5nX2NvbW1pdChraXFfcmluZyk7CiAKKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZraXEtPnJp
bmdfbG9jaywgZmxhZ3MpOworCiAJLyogcG9sbCB0aGUgdHJhaWxpbmcgZmVuY2UgKi8KIAlmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKIAkJaWYgKHJpbmctPnRyYWls
X3NlcSA9PQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK

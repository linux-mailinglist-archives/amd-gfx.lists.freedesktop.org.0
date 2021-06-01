Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F000338E9F2
	for <lists+amd-gfx@lfdr.de>; Mon, 24 May 2021 16:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5F76E871;
	Mon, 24 May 2021 14:50:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DD66E871;
 Mon, 24 May 2021 14:50:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4696161477;
 Mon, 24 May 2021 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867838;
 bh=seJzjGs9sZ6zHofGNTUjuqpT4Swidg4xyrcoyTpbhH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QCd5AturtuDd/gnYJBC4GcRDuqDCYs8DmcywDX75d9ab2dhY00JkZH1UU6eGxHJGC
 MpHzwOcAUfJTvNXc5sH51/LUAvPrwcooAQShbgjVUafR6/5biVkmSuiWAp0ny3Z14c
 CwbJUGBkjL5E4mTfjWt92tqBl4qfjA5C8BAvj1gviCDGd/D33wns2RyuJpnYcT0mSo
 UApwqa+pA1nZ+OK6FYrGXNgd5Xzi10CCP0ELKPHrT+9q1U2aqt4lXR794LD68qSGAz
 jIHdyIDk9MSBgXea0qztajtz7v7ANH9/Di4zFxk0JoGnNTYKdctqGfAd6y+Bkgf74E
 gCKLNnsA8qSfA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 24/25] drm/amd/amdgpu: fix refcount leak
Date: Mon, 24 May 2021 10:50:07 -0400
Message-Id: <20210524145008.2499049-24-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524145008.2499049-1-sashal@kernel.org>
References: <20210524145008.2499049-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmluZ3dlbiBDaGVuIDxKaW5nd2VuLkNoZW4yQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCBmYTdlNmFiYzc1ZjNkNDkxYmM1NjE3MzQzMTJkMDY1ZGM5ZGMyYTc3IF0KCltXaHldCnRo
ZSBnZW0gb2JqZWN0IHJmYi0+YmFzZS5vYmpbMF0gaXMgZ2V0IGFjY29yZGluZyB0byBudW1fcGxh
bmVzCmluIGFtZGdwdWZiX2NyZWF0ZSwgYnV0IGlzIG5vdCBwdXQgYWNjb3JkaW5nIHRvIG51bV9w
bGFuZXMKCltIb3ddCnB1dCByZmItPmJhc2Uub2JqWzBdIGluIGFtZGdwdV9mYmRldl9kZXN0cm95
IGFjY29yZGluZyB0byBudW1fcGxhbmVzCgpTaWduZWQtb2ZmLWJ5OiBKaW5nd2VuIENoZW4gPEpp
bmd3ZW4uQ2hlbjJAYW1kLmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZiLmMgfCAzICsrKwog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2ZiLmMKaW5kZXggNjljNWQyMmYyOWJkLi5kNTVmZjU5NTg0YzggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCkBAIC0yOTcsMTAgKzI5NywxMyBAQCBzdGF0aWMg
aW50IGFtZGdwdWZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLAogc3RhdGlj
IGludCBhbWRncHVfZmJkZXZfZGVzdHJveShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3Qg
YW1kZ3B1X2ZiZGV2ICpyZmJkZXYpCiB7CiAJc3RydWN0IGFtZGdwdV9mcmFtZWJ1ZmZlciAqcmZi
ID0gJnJmYmRldi0+cmZiOworCWludCBpOwogCiAJZHJtX2ZiX2hlbHBlcl91bnJlZ2lzdGVyX2Zi
aSgmcmZiZGV2LT5oZWxwZXIpOwogCiAJaWYgKHJmYi0+YmFzZS5vYmpbMF0pIHsKKwkJZm9yIChp
ID0gMDsgaSA8IHJmYi0+YmFzZS5mb3JtYXQtPm51bV9wbGFuZXM7IGkrKykKKwkJCWRybV9nZW1f
b2JqZWN0X3B1dChyZmItPmJhc2Uub2JqWzBdKTsKIAkJYW1kZ3B1ZmJfZGVzdHJveV9waW5uZWRf
b2JqZWN0KHJmYi0+YmFzZS5vYmpbMF0pOwogCQlyZmItPmJhc2Uub2JqWzBdID0gTlVMTDsKIAkJ
ZHJtX2ZyYW1lYnVmZmVyX3VucmVnaXN0ZXJfcHJpdmF0ZSgmcmZiLT5iYXNlKTsKLS0gCjIuMzAu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==

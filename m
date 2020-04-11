Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366971A54E2
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Apr 2020 01:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905436E290;
	Sat, 11 Apr 2020 23:08:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BD56E359;
 Sat, 11 Apr 2020 23:08:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FED821835;
 Sat, 11 Apr 2020 23:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646502;
 bh=zBiznQ4vy/QHiHdic6RZO1pzloRdk2UmaY60wJRZ9Hw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AomB5NAVTENVXHiFtO6bg4IbJpwlOmg5OXBXoynJ2pRm48kBXueGcMSmrTflf5G+E
 ZK5EE2C+oTDt3fdHQggalmIPY8xyC8vvSjlrtG3CZdtY2OZRgd1RXhQucSleyGe0l2
 Z7RuPiHEvzqNObnTPooFTafnkiMbpGR74823zL+o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 062/121] drm/amdgpu: fix parentheses in
 amdgpu_vm_update_ptes
Date: Sat, 11 Apr 2020 19:06:07 -0400
Message-Id: <20200411230706.23855-62-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgYmZjZDZjNjllNGMzZjczZjJmOTJiOTk3OTgzNTM3ZjlhM2FjM2IyOSBdCgpG
b3IgdGhlIHJvb3QgUEQgbWFzayBjYW4gYmUgMHhmZmZmZmZmZiBhcyB3ZWxsIHdoaWNoIHdvdWxk
Cm92ZXJydW4gdG8gMCBpZiB3ZSBkb24ndCBjYXN0IGl0IGJlZm9yZSB3ZSBhZGQgb25lLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpU
ZXN0ZWQtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXgg
NTk4YzI0NTA1YzczYi4uZDM3ZDljMzcyZTdkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmMKQEAgLTE0NjgsNyArMTQ2OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3Vw
ZGF0ZV9wdGVzKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcGFyYW1zLAogCQlpbmNy
ID0gKHVpbnQ2NF90KUFNREdQVV9HUFVfUEFHRV9TSVpFIDw8IHNoaWZ0OwogCQltYXNrID0gYW1k
Z3B1X3ZtX2VudHJpZXNfbWFzayhhZGV2LCBjdXJzb3IubGV2ZWwpOwogCQlwZV9zdGFydCA9ICgo
Y3Vyc29yLnBmbiA+PiBzaGlmdCkgJiBtYXNrKSAqIDg7Ci0JCWVudHJ5X2VuZCA9ICh1aW50NjRf
dCkobWFzayArIDEpIDw8IHNoaWZ0OworCQllbnRyeV9lbmQgPSAoKHVpbnQ2NF90KW1hc2sgKyAx
KSA8PCBzaGlmdDsKIAkJZW50cnlfZW5kICs9IGN1cnNvci5wZm4gJiB+KGVudHJ5X2VuZCAtIDEp
OwogCQllbnRyeV9lbmQgPSBtaW4oZW50cnlfZW5kLCBlbmQpOwogCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=

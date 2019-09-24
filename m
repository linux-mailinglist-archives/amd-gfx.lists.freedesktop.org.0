Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB840BCDB1
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 18:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA576EAB1;
	Tue, 24 Sep 2019 16:49:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602BF6EAAF;
 Tue, 24 Sep 2019 16:49:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AC2B21971;
 Tue, 24 Sep 2019 16:49:22 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 18/50] drm/amd/powerplay/smu7: enforce minimal
 VBITimeout (v2)
Date: Tue, 24 Sep 2019 12:48:15 -0400
Message-Id: <20190924164847.27780-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343763;
 bh=4aQFDbSQL+d9zrO7he+q/JybfPW4JziCkkso1/CsaKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XeDjPvB1MkOWUZXtv/BMilLiLMMzfESVAtiCX526GMX9SksdjSMkcwok57bUkr+LI
 bLwwzVQuTlgCbGQ/Pf4y7k6ViICtNfbRddjmuNsubX22KD6zcaEdXpczV0HxkUDpiG
 hhdL3qpgtnBHRpZxRyfM+zp38PsqEw12Cal7ABXw=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Ahzo <Ahzo@tutanota.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBmNjU5YmI2
ZGFlNThjMTEzODA1ZjkyODIyZTRjMTZkZGQzMTU2Yjc5IF0KClRoaXMgZml4ZXMgc2NyZWVuIGNv
cnJ1cHRpb24vZmxpY2tlcmluZyBvbiA3NSBIeiBkaXNwbGF5cy4KCnYyOiBtYWtlIHByaW50IHN0
YXRlbWVudCBkZWJ1ZyBvbmx5IChBbGV4KQoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVz
a3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjY0NgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKaW5kZXggYjUyY2NhYjQyOGE5ZS4uYzdjNTA1
MDk1NDAyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211N19od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dTdfaHdtZ3IuYwpAQCAtNDA1Miw2ICs0MDUyLDExIEBAIHN0YXRpYyBpbnQgc211N19wcm9ncmFt
X2Rpc3BsYXlfZ2FwKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAKIAlkYXRhLT5mcmFtZV90aW1l
X3gyID0gZnJhbWVfdGltZV9pbl91cyAqIDIgLyAxMDA7CiAKKwlpZiAoZGF0YS0+ZnJhbWVfdGlt
ZV94MiA8IDI4MCkgeworCQlwcl9kZWJ1ZygiJXM6IGVuZm9yY2UgbWluaW1hbCBWQklUaW1lb3V0
OiAlZCAtPiAyODBcbiIsIF9fZnVuY19fLCBkYXRhLT5mcmFtZV90aW1lX3gyKTsKKwkJZGF0YS0+
ZnJhbWVfdGltZV94MiA9IDI4MDsKKwl9CisKIAlkaXNwbGF5X2dhcDIgPSBwcmVfdmJpX3RpbWVf
aW5fdXMgKiAocmVmX2Nsb2NrIC8gMTAwKTsKIAogCWNnc193cml0ZV9pbmRfcmVnaXN0ZXIoaHdt
Z3ItPmRldmljZSwgQ0dTX0lORF9SRUdfX1NNQywgaXhDR19ESVNQTEFZX0dBUF9DTlRMMiwgZGlz
cGxheV9nYXAyKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4

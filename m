Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B5BA59A
	for <lists+amd-gfx@lfdr.de>; Sun, 22 Sep 2019 21:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433F56E878;
	Sun, 22 Sep 2019 19:00:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2EC6E878;
 Sun, 22 Sep 2019 19:00:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF707208C2;
 Sun, 22 Sep 2019 19:00:53 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 57/60] drm/amd/powerplay/smu7: enforce minimal
 VBITimeout (v2)
Date: Sun, 22 Sep 2019 14:59:30 -0400
Message-Id: <20190922185934.4305-57-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922185934.4305-1-sashal@kernel.org>
References: <20190922185934.4305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569178854;
 bh=cdpXAyC0QgX4B0pAmhmXYPJ+N0Wzzx+vtMzo2FD9JFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2P98hJA9x1wksRzMwVPbcJdYyLgccd48XX7d7UTKZHc7tBt/Wdav8xUgH4rHTEG2e
 mB9l65MEQWyb92gjbv9B0cB/KNx8IxSOUjf1AL1luMUKQPaVyz3watSKzCnokA4uhn
 FgrHvUjJKV9rJKw1EUNOJjU1i/UwZPwd0g1Y3fTo=
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
L3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKaW5kZXggMzkwNzQzOTQxN2U3Ni4uYzBkYjNi
NTdkZmU1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211N19od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dTdfaHdtZ3IuYwpAQCAtMzczOSw2ICszNzM5LDExIEBAIGludCBzbXU3X3Byb2dyYW1fZGlzcGxh
eV9nYXAoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAogCWRhdGEtPmZyYW1lX3RpbWVfeDIgPSBm
cmFtZV90aW1lX2luX3VzICogMiAvIDEwMDsKIAorCWlmIChkYXRhLT5mcmFtZV90aW1lX3gyIDwg
MjgwKSB7CisJCXByX2RlYnVnKCIlczogZW5mb3JjZSBtaW5pbWFsIFZCSVRpbWVvdXQ6ICVkIC0+
IDI4MFxuIiwgX19mdW5jX18sIGRhdGEtPmZyYW1lX3RpbWVfeDIpOworCQlkYXRhLT5mcmFtZV90
aW1lX3gyID0gMjgwOworCX0KKwogCWRpc3BsYXlfZ2FwMiA9IHByZV92YmlfdGltZV9pbl91cyAq
IChyZWZfY2xvY2sgLyAxMDApOwogCiAJY2dzX3dyaXRlX2luZF9yZWdpc3Rlcihod21nci0+ZGV2
aWNlLCBDR1NfSU5EX1JFR19fU01DLCBpeENHX0RJU1BMQVlfR0FQX0NOVEwyLCBkaXNwbGF5X2dh
cDIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

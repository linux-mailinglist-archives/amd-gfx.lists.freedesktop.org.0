Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46670A6E36
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 18:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA248970E;
	Tue,  3 Sep 2019 16:25:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD889704;
 Tue,  3 Sep 2019 16:25:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFB692377D;
 Tue,  3 Sep 2019 16:25:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 009/167] drm/amdgpu/gfx9: Update gfx9 golden
 settings.
Date: Tue,  3 Sep 2019 12:22:41 -0400
Message-Id: <20190903162519.7136-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527938;
 bh=XlxNZltnNdt+6EtfyRaBtW3SLGlCNlWUzNKBkJGyq/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SaY/pN1ZiAJlU8M2uM47SkfHk8jxx4hJgAqdtycNv+Y77a5Furqy3hLKY9svk2wRa
 1LnX+yJt05B6Z5D3bTDRyJ6P2j3indIBuYK10fDja9Vja9PMrHUmCi0HiXJRCmtyBP
 QWRDfiJlaaV2N6lIE9f1k60PIFY9Xo9dIdVVB2do=
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
Cc: Sasha Levin <sashal@kernel.org>, Feifei Xu <Feifei.Xu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDU0
ZDY4MmQ5YTViMzU3ZWI3MTE5OTRmYTk0ZWYxYmM0NGQ3Y2U5ZDkgXQoKVXBkYXRlIHRoZSBnb2xk
ZW5zZXR0aW5ncyBmb3IgdmVnYTIwLgoKU2lnbmVkLW9mZi1ieTogRmVpZmVpIFh1IDxGZWlmZWku
WHVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmlu
ZGV4IDQ2NTY4NDk3ZWYxODEuLmYwNDBlYzEwZWVjZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYwpAQCAtODIsNyArODIsNyBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9y
YXZlbl9ybGMuYmluIik7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBn
b2xkZW5fc2V0dGluZ3NfZ2NfOV8wW10gPQogewotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0Ms
IDAsIG1tREJfREVCVUcyLCAweGYwMGZmZmZmLCAweDAwMDAwNDIwKSwKKwlTT0MxNV9SRUdfR09M
REVOX1ZBTFVFKEdDLCAwLCBtbURCX0RFQlVHMiwgMHhmMDBmZmZmZiwgMHgwMDAwMDQwMCksCiAJ
U09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HQl9HUFVfSUQsIDB4MDAwMDAwMGYsIDB4
MDAwMDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfQklOTkVS
X0VWRU5UX0NOVExfMywgMHgwMDAwMDAwMywgMHg4MjQwMDAyNCksCiAJU09DMTVfUkVHX0dPTERF
Tl9WQUxVRShHQywgMCwgbW1QQV9TQ19FTkhBTkNFLCAweDNmZmZmZmZmLCAweDAwMDAwMDAxKSwK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

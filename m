Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2280402
	for <lists+amd-gfx@lfdr.de>; Sat,  3 Aug 2019 04:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D06F6E434;
	Sat,  3 Aug 2019 02:37:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E29E6E40C
 for <amd-gfx@lists.freedesktop.org>; Sat,  3 Aug 2019 00:09:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 17:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,340,1559545200"; d="scan'208";a="181162617"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.7.201.137])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2019 17:09:14 -0700
Received: by tassilo.localdomain (Postfix, from userid 1000)
 id 5164C3020A6; Fri,  2 Aug 2019 17:09:14 -0700 (PDT)
From: Andi Kleen <andi@firstfloor.org>
To: alexander.deucher@amd.com
Subject: [PATCH] radeon: Use only a single work queue thread for crt
Date: Fri,  2 Aug 2019 17:09:08 -0700
Message-Id: <20190803000908.5310-1-andi@firstfloor.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 03 Aug 2019 02:37:29 +0000
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
Cc: Andi Kleen <ak@linux.intel.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW5kaSBLbGVlbiA8YWtAbGludXguaW50ZWwuY29tPgoKSSBnb3QgdGlyZWQgb2Ygc2Vl
aW5nIGEgbG90IG9mIHJhZGVvbi1jcnQga2VybmVsIHRocmVhZHMgaW4gcHMgb24gbXkKd29ya3N0
YXRpb24sIG9uZSBmb3IgZWFjaCBDUFUgYW5kIG9uZSBmb3IgZWFjaCBkaXNwbGF5LCB3aGljaCBu
ZXZlciB1c2UgYW55IENQVSB0aW1lLgpTdXJlbHkgYSBzaW5nbGUga2VybmVsIHRocmVhZCBpcyBl
bm91Z2ggdG8gaGFuZGxlIHRoZSBkaXNwbGF5LgoKU2lnbmVkLW9mZi1ieTogQW5kaSBLbGVlbiA8
YWtAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rp
c3BsYXkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXku
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwppbmRleCBiZDUyZjE1
ZTYzMzAuLmZiMGNhNjg4ZjZmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3Bs
YXkuYwpAQCAtNjgyLDcgKzY4Miw3IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl9jcnRjX2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGluZGV4KQogCiAJZHJtX21vZGVfY3J0Y19zZXRfZ2Ft
bWFfc2l6ZSgmcmFkZW9uX2NydGMtPmJhc2UsIDI1Nik7CiAJcmFkZW9uX2NydGMtPmNydGNfaWQg
PSBpbmRleDsKLQlyYWRlb25fY3J0Yy0+ZmxpcF9xdWV1ZSA9IGFsbG9jX3dvcmtxdWV1ZSgicmFk
ZW9uLWNydGMiLCBXUV9ISUdIUFJJLCAwKTsKKwlyYWRlb25fY3J0Yy0+ZmxpcF9xdWV1ZSA9IGFs
bG9jX3dvcmtxdWV1ZSgicmFkZW9uLWNydGMiLCBXUV9ISUdIUFJJfFdRX1VOQk9VTkQsIDApOwog
CXJkZXYtPm1vZGVfaW5mby5jcnRjc1tpbmRleF0gPSByYWRlb25fY3J0YzsKIAogCWlmIChyZGV2
LT5mYW1pbHkgPj0gQ0hJUF9CT05BSVJFKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

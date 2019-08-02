Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281677F8D1
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 15:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69BE6EE41;
	Fri,  2 Aug 2019 13:23:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF3A6EE3E;
 Fri,  2 Aug 2019 13:23:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C709520644;
 Fri,  2 Aug 2019 13:23:17 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 08/42] drm/amd/display: use encoder's engine id
 to find matched free audio device
Date: Fri,  2 Aug 2019 09:22:28 -0400
Message-Id: <20190802132302.13537-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132302.13537-1-sashal@kernel.org>
References: <20190802132302.13537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752198;
 bh=/VUQXObd5d36mN8buAAx0ArPY1wAc9/+9jzjFmMUX6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCYgquac5Xt6g1UWPMEeyNpObQlE8tsz4RPqcfZwCD299WsnedYS+8qudOhGb+MjJ
 NlAre2OgLBZZipNXhriX6GBoT1gKmvLE99QtziZYOejpwtlu6sQ8vjxHyjJtjRLY+K
 9YVgNjV/+KcodYfmiQDyRYUsgoT/kl/nDsya6/PI=
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Tai Man <taiman.wong@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFpIE1hbiA8dGFpbWFuLndvbmdAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDc0
ZWRhNzc2ZDdhNGU2OWVjN2FhMWNlMzBhODc2MzZmMTQyMjBmYmIgXQoKW1doeV0KT24gc29tZSBw
bGF0Zm9ybXMsIHRoZSBlbmNvZGVyIGlkIDMgaXMgbm90IHBvcHVsYXRlZC4gU28gdGhlIGVuY29k
ZXJzCmFyZSBub3Qgc3RvcmVkIGluIHJpZ2h0IG9yZGVyIGFzIGluZGV4IChpZDogMCwgMSwgMiwg
NCwgNSkgYXQgcG9vbC4gVGhpcwp3b3VsZCBjYXVzZSBlbmNvZGVycyBpZCA0ICYgaWQgNSB0byBm
YWlsIHdoZW4gZmluZGluZyBjb3JyZXNwb25kaW5nCmF1ZGlvIGRldmljZSwgZGVmYXVsdGluZyB0
byB0aGUgZmlyc3QgYXZhaWxhYmxlIGF1ZGlvIGRldmljZS4gQXMgcmVzdWx0LAp3ZSBjYW5ub3Qg
c3RyZWFtIGF1ZGlvIGludG8gdHdvIERQIHBvcnRzIHdpdGggZW5jb2RlcnMgaWQgNCAmIGlkIDUu
CgpbSG93XQpJdCBuZWVkIHRvIGNyZWF0ZSBlbm91Z2ggYXVkaW8gZGV2aWNlIG9iamVjdHMgKDAg
LSA1KSB0byBwZXJmb3JtIG1hdGNoaW5nLgpUaGVuIHVzZSBlbmNvZGVyIGVuZ2luZSBpZCB0byBm
aW5kIG1hdGNoZWQgYXVkaW8gZGV2aWNlLgoKU2lnbmVkLW9mZi1ieTogVGFpIE1hbiA8dGFpbWFu
LndvbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFt
ZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwppbmRleCBlMGE5NmFiYjNjNDZj
Li4wNmQ1OTg4ZGZmNzIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX3Jlc291cmNlLmMKQEAgLTIyMiw3ICsyMjIsNyBAQCBib29sIHJlc291cmNlX2Nv
bnN0cnVjdCgKIAkJICogUE9SVF9DT05ORUNUSVZJVFkgPT0gMSAoYXMgaW5zdHJ1Y3RlZCBieSBI
VyB0ZWFtKS4KIAkJICovCiAJCXVwZGF0ZV9udW1fYXVkaW8oJnN0cmFwcywgJm51bV9hdWRpbywg
JnBvb2wtPmF1ZGlvX3N1cHBvcnQpOwotCQlmb3IgKGkgPSAwOyBpIDwgcG9vbC0+cGlwZV9jb3Vu
dCAmJiBpIDwgbnVtX2F1ZGlvOyBpKyspIHsKKwkJZm9yIChpID0gMDsgaSA8IGNhcHMtPm51bV9h
dWRpbzsgaSsrKSB7CiAJCQlzdHJ1Y3QgYXVkaW8gKmF1ZCA9IGNyZWF0ZV9mdW5jcy0+Y3JlYXRl
X2F1ZGlvKGN0eCwgaSk7CiAKIAkJCWlmIChhdWQgPT0gTlVMTCkgewpAQCAtMTcxMyw2ICsxNzEz
LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgYXVkaW8gKmZpbmRfZmlyc3RfZnJlZV9hdWRpbygKIAkJCXJl
dHVybiBwb29sLT5hdWRpb3NbaV07CiAJCX0KIAl9CisKKyAgICAvKiB1c2UgZW5naW5lIGlkIHRv
IGZpbmQgZnJlZSBhdWRpbyAqLworCWlmICgoaWQgPCBwb29sLT5hdWRpb19jb3VudCkgJiYgKHJl
c19jdHgtPmlzX2F1ZGlvX2FjcXVpcmVkW2lkXSA9PSBmYWxzZSkpIHsKKwkJcmV0dXJuIHBvb2wt
PmF1ZGlvc1tpZF07CisJfQorCiAJLypub3QgZm91bmQgdGhlIG1hdGNoaW5nIG9uZSwgZmlyc3Qg
Y29tZSBmaXJzdCBzZXJ2ZSovCiAJZm9yIChpID0gMDsgaSA8IHBvb2wtPmF1ZGlvX2NvdW50OyBp
KyspIHsKIAkJaWYgKHJlc19jdHgtPmlzX2F1ZGlvX2FjcXVpcmVkW2ldID09IGZhbHNlKSB7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

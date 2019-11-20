Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5C1043B8
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Nov 2019 19:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674C56E113;
	Wed, 20 Nov 2019 18:56:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6F6E58B;
 Wed, 20 Nov 2019 17:22:45 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iXTgg-00062b-Ag; Wed, 20 Nov 2019 17:22:42 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix double assignment to msg_id field
Date: Wed, 20 Nov 2019 17:22:42 +0000
Message-Id: <20191120172242.347072-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2019 18:56:11 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBtc2df
aWQgZmllbGQgaXMgYmVpbmcgYXNzaWduZWQgdHdpY2UuIEZpeCB0aGlzIGJ5IHJlcGxhY2luZyB0
aGUgc2Vjb25kCmFzc2lnbm1lbnQgd2l0aCBhbiBhc3NpZ25tZW50IHRvIG1zZ19zaXplLgoKQWRk
cmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCkZpeGVzOiAxMWEwMDk2NWQyNjEgKCJk
cm0vYW1kL2Rpc3BsYXk6IEFkZCBQU1AgYmxvY2sgdG8gdmVyaWZ5IEhEQ1AyLjIgc3RlcHMiKQpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9w
c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3Au
YwppbmRleCAyZGQ1ZmVlYzhlNmMuLjY3OTFjNTg0NGU0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuYwpAQCAtNDIsNyArNDIs
NyBAQCBzdGF0aWMgdm9pZCBoZGNwMl9tZXNzYWdlX2luaXQoc3RydWN0IG1vZF9oZGNwICpoZGNw
LAogCWluLT5wcm9jZXNzLm1zZzJfZGVzYy5tc2dfaWQgPSBUQV9IRENQX0hEQ1AyX01TR19JRF9f
TlVMTF9NRVNTQUdFOwogCWluLT5wcm9jZXNzLm1zZzJfZGVzYy5tc2dfc2l6ZSA9IDA7CiAJaW4t
PnByb2Nlc3MubXNnM19kZXNjLm1zZ19pZCA9IFRBX0hEQ1BfSERDUDJfTVNHX0lEX19OVUxMX01F
U1NBR0U7Ci0JaW4tPnByb2Nlc3MubXNnM19kZXNjLm1zZ19pZCA9IDA7CisJaW4tPnByb2Nlc3Mu
bXNnM19kZXNjLm1zZ19zaXplID0gMDsKIH0KIGVudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNw
X3JlbW92ZV9kaXNwbGF5X3RvcG9sb2d5KHN0cnVjdCBtb2RfaGRjcCAqaGRjcCkKIHsKLS0gCjIu
MjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

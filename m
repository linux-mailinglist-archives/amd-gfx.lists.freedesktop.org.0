Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8B10A0AC
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Nov 2019 15:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE79D6E415;
	Tue, 26 Nov 2019 14:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mac1807s-mbp.amd.com (unknown [165.204.55.250])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFF326E415
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Nov 2019 14:46:59 +0000 (UTC)
Received: by mac1807s-mbp.amd.com (Postfix, from userid 501)
 id 22677E4DA74; Tue, 26 Nov 2019 09:46:58 -0500 (EST)
From: Zhan liu <zhan.liu@amd.com>
To: amd-gfx@lists.freedesktop.org,
	zhan.liu@amd.com
Subject: drm/amd/display: Modify comments to match the code
Date: Tue, 26 Nov 2019 09:46:56 -0500
Message-Id: <20191126144656.55811-1-zhan.liu@amd.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhpcyBsaW5lIG9mIGNvZGUgd2FzIG1vZGlmaWVkLiBIb3dldmVyLCBjb21tZW50cwpy
ZW1haW5lZCB1bmNoYW5nZWQuIEFzIGEgcmVzdWx0LCBjb21tZW50cyBhbmQgY29kZSBhcmUKbWlz
bWF0Y2hpbmcuCgpbSG93XQpNb2RpZnlpbmcgY29tbWVudHMgdG8gcmVmbGVjdCBjb2RlLiBBdCB0
aGUgc2FtZSB0aW1lLApleHBsYWluaW5nIHdoeSB0aGUgdmFsdWUgd2FzIGNoYW5nZWQgZnJvbSAy
MDBtcyB0bwozMDAwbXMuCgpTaWduZWQtb2ZmLWJ5OiBaaGFuIExpdSA8emhhbi5saXVAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmMgfCA3ICsr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmMKaW5kZXggOGRhNDU3NmUy
OTA4Li5lNDFiZWZhMDY3Y2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY19oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNf
aGVscGVyLmMKQEAgLTQ4NSw3ICs0ODUsMTIgQEAgdm9pZCBnZW5lcmljX3JlZ193YWl0KGNvbnN0
IHN0cnVjdCBkY19jb250ZXh0ICpjdHgsCiAJCXJldHVybjsKIAl9CiAKLQkvKiBzb21ldGhpbmcg
aXMgdGVycmlibHkgd3JvbmcgaWYgdGltZSBvdXQgaXMgPiAyMDBtcy4gKDVIeikgKi8KKwkvKgor
CSAqIFNvbWV0aGluZyBpcyB0ZXJyaWJseSB3cm9uZyBpZiB0aW1lIG91dCBpcyA+IDMwMDBtcy4K
KwkgKiAzMDAwbXMgaXMgdGhlIG1heGltdW0gdGltZSBuZWVkZWQgZm9yIFNNVSB0byBwYXNzIHZh
bHVlcyBiYWNrLgorCSAqIFRoaXMgdmFsdWUgY29tZXMgZnJvbSBleHBlcmltZW50cy4KKwkgKgor
CSAqLwogCUFTU0VSVChkZWxheV9iZXR3ZWVuX3BvbGxfdXMgKiB0aW1lX291dF9udW1fdHJpZXMg
PD0gMzAwMDAwMCk7CiAKIAlmb3IgKGkgPSAwOyBpIDw9IHRpbWVfb3V0X251bV90cmllczsgaSsr
KSB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817776E198
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4346E5AA;
	Fri, 19 Jul 2019 07:19:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp180.sjtu.edu.cn (smtp180.sjtu.edu.cn [202.120.2.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D326E487
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 01:20:38 +0000 (UTC)
Received: from proxy01.sjtu.edu.cn (unknown [202.112.26.54])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 5A61A1008B387;
 Fri, 19 Jul 2019 09:20:34 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by proxy01.sjtu.edu.cn (Postfix) with ESMTP id 4A39620424204;
 Fri, 19 Jul 2019 09:20:34 +0800 (CST)
X-Virus-Scanned: amavisd-new at proxy01.sjtu.edu.cn
Received: from proxy01.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy01.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JR1W1M8O2lFW; Fri, 19 Jul 2019 09:20:34 +0800 (CST)
Received: from xywang-pc.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: xywang.sjtu@sjtu.edu.cn)
 by proxy01.sjtu.edu.cn (Postfix) with ESMTPA id 1EFC120424202;
 Fri, 19 Jul 2019 09:20:34 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: 
Subject: [PATCH] drm/amdgpu: fix two documentation mismatch issues
Date: Fri, 19 Jul 2019 09:19:43 +0800
Message-Id: <20190719011943.10920-1-xywang.sjtu@sjtu.edu.cn>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:19:32 +0000
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
Cc: David1.Zhou@amd.com, Wang Xiayang <xywang.sjtu@sjtu.edu.cn>,
 trivial@kernel.org, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9uIG5hbWUgbWVudGlvbmVkIGluIHRoZSBkb2N1bWVudGF0aW9uYWwgY29tbWVu
dHMgbWlzbWF0Y2hlcwp0aGUgYWN0dWFsIG9uZS4gVGhlIG1pc21hdGNoIG1heSBtYWtlIHRyb3Vi
bGUgZm9yIGF1dG9tYXRpYyBkb2N1bWVudGF0aW9uCmdlbmVyYXRpb24uIE9uZSBvZiB0aGUgZXJy
b25vdXMgbmFtZSBoYXMgc2VlbiB0byBiZSBtaXN1c2VkCmFuZCBmaXhlZCBpbiBjb21taXQgYmM1
YWIyZDI5YjhhICgiZHJtL2FtZGdwdTogZml4IHR5cG8gaW4gZnVuY3Rpb24Kc2RtYV92NF8wX3Bh
Z2VfcmVzdW1lIikuCgpUaGVyZSBpcyBhcHBhcmVudGx5IG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlu
IHRoZSBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFdhbmcgWGlheWFuZyA8eHl3YW5nLnNqdHVAc2p0
dS5lZHUuY24+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCA0NDI4MDE4NjcyZDMuLjM3
NDgwNzQyMjBiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92
NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTQ1
NSw3ICs0NTUsNyBAQCBzdGF0aWMgdWludDY0X3Qgc2RtYV92NF8wX3BhZ2VfcmluZ19nZXRfd3B0
cihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiB9CiAKIC8qKgotICogc2RtYV92NF8wX3Jpbmdf
c2V0X3dwdHIgLSBjb21taXQgdGhlIHdyaXRlIHBvaW50ZXIKKyAqIHNkbWFfdjRfMF9wYWdlX3Jp
bmdfc2V0X3dwdHIgLSBjb21taXQgdGhlIHdyaXRlIHBvaW50ZXIKICAqCiAgKiBAcmluZzogYW1k
Z3B1IHJpbmcgcG9pbnRlcgogICoKQEAgLTY4OCw3ICs2ODgsNyBAQCBzdGF0aWMgdm9pZCBzZG1h
X3Y0XzBfcGFnZV9zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogfQogCiAvKioKLSAq
IHNkbWFfdl8wX2N0eF9zd2l0Y2hfZW5hYmxlIC0gc3RvcCB0aGUgYXN5bmMgZG1hIGVuZ2luZXMg
Y29udGV4dCBzd2l0Y2gKKyAqIHNkbWFfdjRfMF9jdHhfc3dpdGNoX2VuYWJsZSAtIHN0b3AgdGhl
IGFzeW5jIGRtYSBlbmdpbmVzIGNvbnRleHQgc3dpdGNoCiAgKgogICogQGFkZXY6IGFtZGdwdV9k
ZXZpY2UgcG9pbnRlcgogICogQGVuYWJsZTogZW5hYmxlL2Rpc2FibGUgdGhlIERNQSBNRXMgY29u
dGV4dCBzd2l0Y2guCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==

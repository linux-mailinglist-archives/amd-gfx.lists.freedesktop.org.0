Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D531C3ADB
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 18:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408489F27;
	Tue,  1 Oct 2019 16:41:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E351289F27;
 Tue,  1 Oct 2019 16:41:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F37EF21924;
 Tue,  1 Oct 2019 16:41:17 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 68/71] drm/radeon: Bail earlier when
 radeon.cik_/si_support=0 is passed
Date: Tue,  1 Oct 2019 12:39:18 -0400
Message-Id: <20191001163922.14735-68-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001163922.14735-1-sashal@kernel.org>
References: <20191001163922.14735-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569948078;
 bh=o4RGWiH6oPbtLY4bWIZ3b6R3x0ifsch3zIJ7Q8PddEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y1UW0umKNCLdIAYsqgDUQa1vl1/R9zovs6WELw51y4nH4z+xP81ePP+yQN3qlr+z2
 avUFx9VUSxSjoEXVpxt0KzVIY+zt6ytxg+POx8U3hqahEP6utgcvVLCbF8TMSzq3+/
 1ptXtmSoIw9NrdGBenAPtfFgt6M2hvzFLuESC0v8=
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
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDlkYmM4OGQwMTNiNzljNjJiZDg0NWNiOWU3YzAyNTZlNjYwOTY3YzUgXQoKQmFpbCBmcm9t
IHRoZSBwY2lfZHJpdmVyIHByb2JlIGZ1bmN0aW9uIGluc3RlYWQgb2YgZnJvbSB0aGUgZHJtX2Ry
aXZlcgpsb2FkIGZ1bmN0aW9uLgoKVGhpcyBhdm9pZCAvZGV2L2RyaS9jYXJkMCB0ZW1wb3Jhcmls
eSBnZXR0aW5nIHJlZ2lzdGVyZWQgYW5kIHRoZW4KdW5yZWdpc3RlcmVkIGFnYWluLCBzZW5kaW5n
IHVud2FudGVkIGFkZCAvIHJlbW92ZSB1ZGV2IGV2ZW50cyB0bwp1c2Vyc3BhY2UuCgpTcGVjaWZp
Y2FsbHkgdGhpcyBhdm9pZHMgdHJpZ2dlcmluZyB0aGUgKHVzZXJzcGFjZSkgYnVnIGZpeGVkIGJ5
IHRoaXMKcGx5bW91dGggbWVyZ2UtcmVxdWVzdDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL3BseW1vdXRoL3BseW1vdXRoL21lcmdlX3JlcXVlc3RzLzU5CgpOb3RlIHRoYXQgZGVzcGl0
ZSB0aGF0IGJlaW5nIGFuIHVzZXJzcGFjZSBidWcsIG5vdCBzZW5kaW5nIHVubmVjZXNzYXJ5CnVk
ZXYgZXZlbnRzIGlzIGEgZ29vZCBpZGVhIGluIGdlbmVyYWwuCgpCdWdMaW5rOiBodHRwczovL2J1
Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE0OTA0OTAKUmV2aWV3ZWQtYnk6IE1p
Y2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9rbXMuYyB8IDI1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMKaW5kZXggYTZjYmUxMWY3OWM2MS4uNzAzM2YzYTM4Yzg3OCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKQEAgLTMyNSw4ICszMjUsMzkgQEAgYm9vbCByYWRl
b25fZGV2aWNlX2lzX3ZpcnR1YWwodm9pZCk7CiBzdGF0aWMgaW50IHJhZGVvbl9wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJCQkgICAgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQg
KmVudCkKIHsKKwl1bnNpZ25lZCBsb25nIGZsYWdzID0gMDsKIAlpbnQgcmV0OwogCisJaWYgKCFl
bnQpCisJCXJldHVybiAtRU5PREVWOyAvKiBBdm9pZCBOVUxMLXB0ciBkZXJlZiBpbiBkcm1fZ2V0
X3BjaV9kZXYgKi8KKworCWZsYWdzID0gZW50LT5kcml2ZXJfZGF0YTsKKworCWlmICghcmFkZW9u
X3NpX3N1cHBvcnQpIHsKKwkJc3dpdGNoIChmbGFncyAmIFJBREVPTl9GQU1JTFlfTUFTSykgewor
CQljYXNlIENISVBfVEFISVRJOgorCQljYXNlIENISVBfUElUQ0FJUk46CisJCWNhc2UgQ0hJUF9W
RVJERToKKwkJY2FzZSBDSElQX09MQU5EOgorCQljYXNlIENISVBfSEFJTkFOOgorCQkJZGV2X2lu
Zm8oJnBkZXYtPmRldiwKKwkJCQkgIlNJIHN1cHBvcnQgZGlzYWJsZWQgYnkgbW9kdWxlIHBhcmFt
XG4iKTsKKwkJCXJldHVybiAtRU5PREVWOworCQl9CisJfQorCWlmICghcmFkZW9uX2Npa19zdXBw
b3J0KSB7CisJCXN3aXRjaCAoZmxhZ3MgJiBSQURFT05fRkFNSUxZX01BU0spIHsKKwkJY2FzZSBD
SElQX0tBVkVSSToKKwkJY2FzZSBDSElQX0JPTkFJUkU6CisJCWNhc2UgQ0hJUF9IQVdBSUk6CisJ
CWNhc2UgQ0hJUF9LQUJJTkk6CisJCWNhc2UgQ0hJUF9NVUxMSU5TOgorCQkJZGV2X2luZm8oJnBk
ZXYtPmRldiwKKwkJCQkgIkNJSyBzdXBwb3J0IGRpc2FibGVkIGJ5IG1vZHVsZSBwYXJhbVxuIik7
CisJCQlyZXR1cm4gLUVOT0RFVjsKKwkJfQorCX0KKwogCWlmICh2Z2Ffc3dpdGNoZXJvb19jbGll
bnRfcHJvYmVfZGVmZXIocGRldikpCiAJCXJldHVybiAtRVBST0JFX0RFRkVSOwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2ttcy5jCmluZGV4IDA3ZjdhY2U0MmM0YmEuLmU4NWM1NTRlZWFhOTQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jCkBAIC0xMDAsMzEgKzEwMCw2IEBAIGlu
dCByYWRlb25fZHJpdmVyX2xvYWRfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGxvbmcgZmxhZ3MpCiAJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXY7CiAJaW50IHIsIGFjcGlf
c3RhdHVzOwogCi0JaWYgKCFyYWRlb25fc2lfc3VwcG9ydCkgewotCQlzd2l0Y2ggKGZsYWdzICYg
UkFERU9OX0ZBTUlMWV9NQVNLKSB7Ci0JCWNhc2UgQ0hJUF9UQUhJVEk6Ci0JCWNhc2UgQ0hJUF9Q
SVRDQUlSTjoKLQkJY2FzZSBDSElQX1ZFUkRFOgotCQljYXNlIENISVBfT0xBTkQ6Ci0JCWNhc2Ug
Q0hJUF9IQUlOQU46Ci0JCQlkZXZfaW5mbyhkZXYtPmRldiwKLQkJCQkgIlNJIHN1cHBvcnQgZGlz
YWJsZWQgYnkgbW9kdWxlIHBhcmFtXG4iKTsKLQkJCXJldHVybiAtRU5PREVWOwotCQl9Ci0JfQot
CWlmICghcmFkZW9uX2Npa19zdXBwb3J0KSB7Ci0JCXN3aXRjaCAoZmxhZ3MgJiBSQURFT05fRkFN
SUxZX01BU0spIHsKLQkJY2FzZSBDSElQX0tBVkVSSToKLQkJY2FzZSBDSElQX0JPTkFJUkU6Ci0J
CWNhc2UgQ0hJUF9IQVdBSUk6Ci0JCWNhc2UgQ0hJUF9LQUJJTkk6Ci0JCWNhc2UgQ0hJUF9NVUxM
SU5TOgotCQkJZGV2X2luZm8oZGV2LT5kZXYsCi0JCQkJICJDSUsgc3VwcG9ydCBkaXNhYmxlZCBi
eSBtb2R1bGUgcGFyYW1cbiIpOwotCQkJcmV0dXJuIC1FTk9ERVY7Ci0JCX0KLQl9Ci0KIAlyZGV2
ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHJhZGVvbl9kZXZpY2UpLCBHRlBfS0VSTkVMKTsKIAlp
ZiAocmRldiA9PSBOVUxMKSB7CiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

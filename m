Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4948EF0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9507989AA2;
	Mon, 17 Jun 2019 19:28:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F0189AA7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:24 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s15so12198885qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQqMB2frhEkO+Zw4SaeCLMJZrcHi5J5ZLf2T6Xugg/A=;
 b=B2+iyFtM9a+uHVrlG0PWKS2sIp8/MUBOvM3si9a3QoNcjK1QrleXXj5MVbvlTBHwsq
 6kG/UwCwgu0WpFdOITNg06mj29HyZ7Z8DNZiStY83f5MsL4+8XEnI7eHUcAjrHUULD7Q
 ZEXIKZLpx5Q7rSzlsyTfgoXnE6dUYUKuWGyMz7+gnbvfdeHUu9Gyad2kT0wvYROUuqxH
 GDEtnyGaj4gC2dYsM+H2FjVqqRrmbULK91QQ3Ik++zNSTAjT7AQNNbK9EySvK2VfQ+xP
 dz7d1B3/2QfR1xHBMjzdp1KiTt6AN9j5Uz0+DesL8sNzlNpSozHHevbEYm3VL6lfGUhe
 Altg==
X-Gm-Message-State: APjAAAViG+l1drRZZJ7AVKXqHQxp8VFJK4xswaf+qKyIMVx3DqEtastj
 faSw8YhVJ1G57Gw77Z5IRgHsGJASAAc=
X-Google-Smtp-Source: APXvYqxKBuyZCaURDHS57IIwXvvpdnm4OIoxikWEHt2o6mB9FibbknS26quqif2LPKaOyQJgdE9fXA==
X-Received: by 2002:a0c:93cb:: with SMTP id g11mr4067626qvg.133.1560799703444; 
 Mon, 17 Jun 2019 12:28:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 176/459] drm/amd/powerplay: add tables_init interface for each
 asic
Date: Mon, 17 Jun 2019 14:26:41 -0500
Message-Id: <20190617192704.18038-77-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQqMB2frhEkO+Zw4SaeCLMJZrcHi5J5ZLf2T6Xugg/A=;
 b=kHLjEAzLjEDZdY/PbpIlJrlTFA5FI22dFvRm3Bgg/FkV86ISNUybLial1fdTANVmKP
 89K9QDHsltAmXDMFE5X8iWmSTubkg8ceHyHmXWJruHIoJKMCpMCLawaKzBlP7xUs6Jwu
 r/W7xQyS11fP4xLPzk5j8cWiBeevPevlwOS38yRErJOgkI5XJaW9BKjKvPl0VAx5GxDF
 ESfpppy6oB8YSQhGoV5UQwPHaZL94k03jfSzpYUJTwFZ3v5qPSvQtTlBaeSMFlaBWwYm
 5DyNf2zaszsgsNJ+iPy0E/UmUIQkw+EgwXxtvhRleDKlLdcG012ahAL06RwJ/EPOlWgY
 6KTg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoZSBzbWMgdGFibGVzIGRlZmlu
ZXMgc2hvdWxkIGJlIGluIHRoZSBhc2ljIGxldmVsLgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5n
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwgIDMg
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMV8wLmggIHwgIDIg
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICAgfCAxOCAr
KysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFf
MC5jICAgICAgfCAxNiArLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS92ZWdhMjBfcHB0LmMgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDYzMWUyZmMxZTA1NS4u
NTdhYjIzZDlkZGZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmgKQEAgLTU2OCw2ICs1NjgsNyBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7CiAJ
aW50ICgqc2V0X3BwZmVhdHVyZV9zdGF0dXMpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50
NjRfdCBwcGZlYXR1cmVzKTsKIAlpbnQgKCpnZXRfcHBmZWF0dXJlX3N0YXR1cykoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGNoYXIgKmJ1Zik7CiAJYm9vbCAoKmlzX2RwbV9ydW5uaW5nKShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSk7CisJdm9pZCAoKnRhYmxlc19pbml0KShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwgc3RydWN0IHNtdV90YWJsZSAqdGFibGVzKTsKIH07CiAKIHN0cnVjdCBzbXVf
ZnVuY3MKQEAgLTc1NCw2ICs3NTUsOCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5wcHRf
ZnVuY3MtPnNldF9vZF9wZXJjZW50YWdlID8gKHNtdSktPnBwdF9mdW5jcy0+c2V0X29kX3BlcmNl
bnRhZ2UoKHNtdSksICh0eXBlKSwgKHZhbHVlKSkgOiAwKQogI2RlZmluZSBzbXVfb2RfZWRpdF9k
cG1fdGFibGUoc211LCB0eXBlLCBpbnB1dCwgc2l6ZSkgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5v
ZF9lZGl0X2RwbV90YWJsZSA/IChzbXUpLT5wcHRfZnVuY3MtPm9kX2VkaXRfZHBtX3RhYmxlKChz
bXUpLCAodHlwZSksIChpbnB1dCksIChzaXplKSkgOiAwKQorI2RlZmluZSBzbXVfdGFibGVzX2lu
aXQoc211LCB0YWIpIFwKKwkoKHNtdSktPnBwdF9mdW5jcy0+dGFibGVzX2luaXQgPyAoc211KS0+
cHB0X2Z1bmNzLT50YWJsZXNfaW5pdCgoc211KSwgKHRhYikpIDogMCkKICNkZWZpbmUgc211X3N0
YXJ0X3RoZXJtYWxfY29udHJvbChzbXUpIFwKIAkoKHNtdSktPmZ1bmNzLT5zdGFydF90aGVybWFs
X2NvbnRyb2w/IChzbXUpLT5mdW5jcy0+c3RhcnRfdGhlcm1hbF9jb250cm9sKChzbXUpKSA6IDAp
CiAjZGVmaW5lIHNtdV9yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSkgXApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oCmluZGV4IGRjYzFl
ZGU5N2MwNC4uYTcwOGM1ZDViODJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvc211X3YxMV8wLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL3NtdV92MTFfMC5oCkBAIC00MCw2ICs0MCw4IEBACiAjZGVmaW5lIFRFTVBfUkFOR0Vf
TUlOCQkJKDApCiAjZGVmaW5lIFRFTVBfUkFOR0VfTUFYCQkJKDgwICogMTAwMCkKIAorI2RlZmlu
ZSBTTVUxMV9UT09MX1NJWkUJCQkweDE5MDAwCisKICNkZWZpbmUgQ0xLX01BUChjbGssIGluZGV4
KSBcCiAJW1NNVV8jI2Nsa10gPSBpbmRleAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKaW5kZXggNWFiMzVmZmY4OGJhLi4yZDBmNzY0ZDRmMTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTM3Niw2ICszNzYsMjMg
QEAgc3RhdGljIGludCBuYXZpMTBfc3RvcmVfcG93ZXJwbGF5X3RhYmxlKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBuYXZpMTBfdGFibGVzX2lu
aXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHN0cnVjdCBzbXVfdGFibGUgKnRhYmxlcykKK3sK
KwlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9QUFRBQkxFLCBzaXplb2YoUFBUYWJs
ZV90KSwKKwkJICAgICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSk7CisJU01V
X1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfV0FURVJNQVJLUywgc2l6ZW9mKFdhdGVybWFy
a3NfdCksCisJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOworCVNN
VV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1NNVV9NRVRSSUNTLCBzaXplb2YoU211TWV0
cmljc190KSwKKwkJICAgICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSk7CisJ
U01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfT1ZFUkRSSVZFLCBzaXplb2YoT3ZlckRy
aXZlVGFibGVfdCksCisJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0p
OworCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1BNU1RBVFVTTE9HLCBTTVUxMV9U
T09MX1NJWkUsCisJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwor
CVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX0FDVElWSVRZX01PTklUT1JfQ09FRkYs
CisJCSAgICAgICBzaXplb2YoRHBtQWN0aXZpdHlNb25pdG9yQ29lZmZJbnRfdCksIFBBR0VfU0la
RSwKKwkgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKK30KKwogc3RhdGlj
IGludCBuYXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
CiB7CiAJc3RydWN0IHNtdV9kcG1fY29udGV4dCAqc211X2RwbSA9ICZzbXUtPnNtdV9kcG07CkBA
IC00MzMsNiArNDUwLDcgQEAgc3RhdGljIGludCBuYXZpMTBfc2V0X2RlZmF1bHRfZHBtX3RhYmxl
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFi
bGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKKwkudGFibGVzX2luaXQgPSBuYXZpMTBfdGFi
bGVzX2luaXQsCiAJLmFsbG9jX2RwbV9jb250ZXh0ID0gbmF2aTEwX2FsbG9jYXRlX2RwbV9jb250
ZXh0LAogCS5zdG9yZV9wb3dlcnBsYXlfdGFibGUgPSBuYXZpMTBfc3RvcmVfcG93ZXJwbGF5X3Rh
YmxlLAogCS5jaGVja19wb3dlcnBsYXlfdGFibGUgPSBuYXZpMTBfY2hlY2tfcG93ZXJwbGF5X3Rh
YmxlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCBkMDVl
MjYzODU5YTAuLmJmZWUwYjQxM2NhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211X3YxMV8wLmMKQEAgLTQ1LDcgKzQ1LDYgQEAKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Zl
Z2EyMF9zbWMuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTBfc21jLmJpbiIp
OwogCi0jZGVmaW5lIFNNVTExX1RPT0xfU0laRQkJMHgxOTAwMAogI2RlZmluZSBTTVUxMV9USEVS
TUFMX01JTklNVU1fQUxFUlRfVEVNUCAgICAgIDAKICNkZWZpbmUgU01VMTFfVEhFUk1BTF9NQVhJ
TVVNX0FMRVJUX1RFTVAgICAgICAyNTUKIApAQCAtNDEwLDIwICs0MDksNyBAQCBzdGF0aWMgaW50
IHNtdV92MTFfMF9pbml0X3NtY190YWJsZXMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIAlz
bXVfdGFibGUtPnRhYmxlcyA9IHRhYmxlczsKIAotCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgVEFC
TEVfUFBUQUJMRSwgc2l6ZW9mKFBQVGFibGVfdCksCi0JCSAgICAgICBQQUdFX1NJWkUsIEFNREdQ
VV9HRU1fRE9NQUlOX1ZSQU0pOwotCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgVEFCTEVfV0FURVJN
QVJLUywgc2l6ZW9mKFdhdGVybWFya3NfdCksCi0JCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9H
RU1fRE9NQUlOX1ZSQU0pOwotCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgVEFCTEVfU01VX01FVFJJ
Q1MsIHNpemVvZihTbXVNZXRyaWNzX3QpLAotCQkgICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VN
X0RPTUFJTl9WUkFNKTsKLQlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFRBQkxFX09WRVJEUklWRSwg
c2l6ZW9mKE92ZXJEcml2ZVRhYmxlX3QpLAotCQkgICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VN
X0RPTUFJTl9WUkFNKTsKLQlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFRBQkxFX1BNU1RBVFVTTE9H
LCBTTVUxMV9UT09MX1NJWkUsIFBBR0VfU0laRSwKLQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlO
X1ZSQU0pOwotCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgVEFCTEVfQUNUSVZJVFlfTU9OSVRPUl9D
T0VGRiwKLQkJICAgICAgIHNpemVvZihEcG1BY3Rpdml0eU1vbml0b3JDb2VmZkludF90KSwKLQkJ
ICAgICAgIFBBR0VfU0laRSwKLQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOworCXNt
dV90YWJsZXNfaW5pdChzbXUsIHRhYmxlcyk7CiAKIAlyZXQgPSBzbXVfdjExXzBfaW5pdF9kcG1f
Y29udGV4dChzbXUpOwogCWlmIChyZXQpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMKaW5kZXggMTdhOTU0YmQ1YWE0Li5kNzFiNjgyMDAyYmQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTI1NSw2ICsyNTUsMjMgQEAg
c3RhdGljIGludCB2ZWdhMjBfZ2V0X3NtdV9tc2dfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpz
bWMsIHVpbnQzMl90IGluZGV4KQogCXJldHVybiB2YWw7CiB9CiAKK3N0YXRpYyB2b2lkIHZlZ2Ey
MF90YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgc3RydWN0IHNtdV90YWJsZSAq
dGFibGVzKQoreworCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1BQVEFCTEUsIHNp
emVvZihQUFRhYmxlX3QpLAorCQkgICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VNX0RPTUFJTl9W
UkFNKTsKKwlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9XQVRFUk1BUktTLCBzaXpl
b2YoV2F0ZXJtYXJrc190KSwKKwkJICAgICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01BSU5f
VlJBTSk7CisJU01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfU01VX01FVFJJQ1MsIHNp
emVvZihTbXVNZXRyaWNzX3QpLAorCQkgICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VNX0RPTUFJ
Tl9WUkFNKTsKKwlTTVVfVEFCTEVfSU5JVCh0YWJsZXMsIFNNVV9UQUJMRV9PVkVSRFJJVkUsIHNp
emVvZihPdmVyRHJpdmVUYWJsZV90KSwKKwkJICAgICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9E
T01BSU5fVlJBTSk7CisJU01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfUE1TVEFUVVNM
T0csIFNNVTExX1RPT0xfU0laRSwKKwkJICAgICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01B
SU5fVlJBTSk7CisJU01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfQUNUSVZJVFlfTU9O
SVRPUl9DT0VGRiwKKwkJICAgICAgIHNpemVvZihEcG1BY3Rpdml0eU1vbml0b3JDb2VmZkludF90
KSwgUEFHRV9TSVpFLAorCSAgICAgICAgICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwor
fQorCiBzdGF0aWMgaW50IHZlZ2EyMF9hbGxvY2F0ZV9kcG1fY29udGV4dChzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKIHsKIAlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0ICpzbXVfZHBtID0gJnNtdS0+
c211X2RwbTsKQEAgLTI5NDQsNiArMjk2MSw3IEBAIHN0YXRpYyBib29sIHZlZ2EyMF9pc19kcG1f
cnVubmluZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBwcHRhYmxlX2Z1bmNzIHZlZ2EyMF9wcHRfZnVuY3MgPSB7CisJLnRhYmxlc19pbml0ID0gdmVn
YTIwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9IHZlZ2EyMF9hbGxvY2F0ZV9k
cG1fY29udGV4dCwKIAkuc3RvcmVfcG93ZXJwbGF5X3RhYmxlID0gdmVnYTIwX3N0b3JlX3Bvd2Vy
cGxheV90YWJsZSwKIAkuY2hlY2tfcG93ZXJwbGF5X3RhYmxlID0gdmVnYTIwX2NoZWNrX3Bvd2Vy
cGxheV90YWJsZSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4

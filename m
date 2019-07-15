Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7A69E20
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359C489EB8;
	Mon, 15 Jul 2019 21:25:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05D189E9E
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:25 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so17248619qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+GqCj5OxdsQQZouvAaJzCmtcFNK6zss24YDYEczr3Y=;
 b=QZHsPzk9uSmaQYZMFPNnTpEZaYiqL/7X+4O6F717Q3ebO0sX6wAGVdUll8gPUleFGg
 IrjtXJWI62aWA10piy04qUOZH7wtNrKadf7Bqg6rrmpymugbUS8gBV4j+99wyx6ooWu/
 jXDMJcBdG+6OPk4tId7uSFKucLn6g4jwQrVzmCGX2NHRj8BsFXKmHu4UvsaF/qRYJri0
 riDVuM0GUx0iCtsMelxTfflTS4IRmg94lSRrJJntep4BVOTtu74vEqjPtdedDXd6zeH1
 9JrFHtERVD3NBY4nJsEKKOnCRkgy3q8NKH2SYcePKT1UAYSBX9VFavka+YtTTuwFRybj
 RSGw==
X-Gm-Message-State: APjAAAVNgQ5WVmw3zF3E0KnIExALmo3zFotAZFzBU7fHTxVx1PstdEkX
 FY8yo1Kgxq/LSTXtan6mnllBc5eD
X-Google-Smtp-Source: APXvYqza5DVfuEmCOq5BQGDxrEdvh9q83OQ0N+1NqqwISj1afZieXni2Ypyt559rObLEuOafyhWDYA==
X-Received: by 2002:a0c:b90a:: with SMTP id u10mr20977641qvf.201.1563225924881; 
 Mon, 15 Jul 2019 14:25:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 045/102] drm/amdkfd: Expose function
 mmhub_v9_4_setup_vm_pt_regs() for kfd to use
Date: Mon, 15 Jul 2019 16:23:40 -0500
Message-Id: <20190715212437.31793-43-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+GqCj5OxdsQQZouvAaJzCmtcFNK6zss24YDYEczr3Y=;
 b=MuWsXaXe/bsAm36QxhFQAXOoRtl19yziGgVO6Tg5s6cgRO9RsMY2HNfAPfx2i3+tJg
 +0gmHpwW7hO5Z09s5/r/twNUmcF3Xm2lb/G41Xy4Q4IlVkapgviQlt8iQgtFec4gFTxC
 rw+PTU3rUp+cHxjBBZxv9Ewaov0TNlTwW2orc55Xt6eRcWCNzjevOmkfmjCtEizbg/79
 0dZlxyDB/n46dNkQyH+wolriRGk3Yk4+D45b8cnCdX1O/tw7x05NnM3KsIBy1IYqy2+L
 0BJDZQqHNg0aZqPkCPVDZm6NT+s2NVaFr5noPvwwEI7jCjIrNjKyTVqCl/4GBzI2Lr1P
 oYMQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IFlvbmcg
WmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuaCAgIHwg
IDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIHwgMTcg
KysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuaAppbmRleCA1Yzhk
ZWFjNjU1ODAuLjk3MWMwODQwMzU4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5oCkBAIC0zNyw0ICszNywxMSBAQAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBhbWRfaXBfZnVuY3Mg
Z21jX3Y5XzBfaXBfZnVuY3M7CiBleHRlcm4gY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192
ZXJzaW9uIGdtY192OV8wX2lwX2Jsb2NrOwogCisvKiBhbWRncHVfYW1ka2ZkKi5jICovCit2b2lk
IGdmeGh1Yl92MV8wX3NldHVwX3ZtX3B0X3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVpbnQzMl90IHZtaWQsCisJCQkJdWludDY0X3QgdmFsdWUpOwordm9pZCBtbWh1Yl92MV8wX3Nl
dHVwX3ZtX3B0X3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQs
CisJCQkJdWludDY0X3QgdmFsdWUpOwordm9pZCBtbWh1Yl92OV80X3NldHVwX3ZtX3B0X3JlZ3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBodWJpZCwKKwkJCQl1aW50MzJfdCB2bWlk
LCB1aW50NjRfdCB2YWx1ZSk7CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L21taHViX3Y5XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHVi
X3Y5XzQuYwppbmRleCBhYTliNDNiNmJhNmIuLjdmNzlmYTRiNmFkMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYwpAQCAtNDYsMTggKzQ2LDIzIEBAIHU2NCBtbWh1Yl92
OV80X2dldF9mYl9sb2NhdGlvbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4g
YmFzZTsKIH0KIAotc3RhdGljIHZvaWQgbW1odWJfdjlfNF9pbml0X2dhcnRfcHRfcmVncyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGh1YmlkKQordm9pZCBtbWh1Yl92OV80X3NldHVw
X3ZtX3B0X3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBodWJpZCwKKwkJCQl1
aW50MzJfdCB2bWlkLCB1aW50NjRfdCB2YWx1ZSkKIHsKLQl1aW50NjRfdCB2YWx1ZSA9IGFtZGdw
dV9nbWNfcGRfYWRkcihhZGV2LT5nYXJ0LmJvKTsKKwkvKiB0d28gcmVnaXN0ZXJzIGRpc3RhbmNl
IGJldHdlZW4gbW1WTUwyVkMwX1ZNX0NPTlRFWFQwXyogdG8KKwkgKiBtbVZNTDJWQzBfVk1fQ09O
VEVYVDFfKgorCSAqLworCWludCBkaXN0ID0gbW1WTUwyVkMwX1ZNX0NPTlRFWFQxX1BBR0VfVEFC
TEVfQkFTRV9BRERSX0xPMzIKKwkJCS0gbW1WTUwyVkMwX1ZNX0NPTlRFWFQwX1BBR0VfVEFCTEVf
QkFTRV9BRERSX0xPMzI7CiAKIAlXUkVHMzJfU09DMTVfT0ZGU0VUKE1NSFVCLCAwLAogCQkJICAg
IG1tVk1MMlZDMF9WTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9MTzMyLAotCQkJICAg
IGh1YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VULAorCQkJICAgIGRpc3QgKiB2
bWlkICsgaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZTRVQsCiAJCQkgICAgbG93
ZXJfMzJfYml0cyh2YWx1ZSkpOwogCiAJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwKIAkJ
CSAgICBtbVZNTDJWQzBfVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfSEkzMiwKLQkJ
CSAgICBodWJpZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVSX09GRlNFVCwKKwkJCSAgICBkaXN0
ICogdm1pZCArIGh1YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VULAogCQkJICAg
IHVwcGVyXzMyX2JpdHModmFsdWUpKTsKIAogfQpAQCAtNjUsNyArNzAsOSBAQCBzdGF0aWMgdm9p
ZCBtbWh1Yl92OV80X2luaXRfZ2FydF9wdF9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBpbnQgaHViaWQpCiBzdGF0aWMgdm9pZCBtbWh1Yl92OV80X2luaXRfZ2FydF9hcGVydHVyZV9y
ZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkgICAgICAgaW50IGh1YmlkKQog
ewotCW1taHViX3Y5XzRfaW5pdF9nYXJ0X3B0X3JlZ3MoYWRldiwgaHViaWQpOworCXVpbnQ2NF90
IHB0X2Jhc2UgPSBhbWRncHVfZ21jX3BkX2FkZHIoYWRldi0+Z2FydC5ibyk7CisKKwltbWh1Yl92
OV80X3NldHVwX3ZtX3B0X3JlZ3MoYWRldiwgaHViaWQsIDAsIHB0X2Jhc2UpOwogCiAJV1JFRzMy
X1NPQzE1X09GRlNFVChNTUhVQiwgMCwKIAkJCSAgICBtbVZNTDJWQzBfVk1fQ09OVEVYVDBfUEFH
RV9UQUJMRV9TVEFSVF9BRERSX0xPMzIsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==

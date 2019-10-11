Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAFD3754
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DC06EBA7;
	Fri, 11 Oct 2019 01:46:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F266EB9C
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:46:05 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w2so7507000qkf.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLP8WqFYu4bQKTiP0klsdbGYwuzNt8QzinOXFINd874=;
 b=ibwlHidtD70m7qAXf//BeHT3W2k+iHscysLerVD2dii4hsPm8xocNN8YYqWzuF8rM+
 VIYSSYYLc3484bmC8aU/7VjbItx218yWrF/j0B0BTPuWxWJkSpTnzA7pKc81BFTINSZA
 mJCo58B6RnQYVkq3XOVIEcGbjAV3E0Leu20fT6D4vXkTijeHYxZVLfZH80EOsyNBMaf+
 K5HFQSYINxGxmD1bqDmIPurlUtRJZAaC1PuJSmbvbB1shCcOoO9aexPuFSK/D6kF/bcX
 CeTlRZUc2DOKwBcaJ3L/9KRonRoWJNkc1NiBtQWjd9HOBGmM2HwWI6hPg8fk4tBNaEIi
 MyJw==
X-Gm-Message-State: APjAAAVEVoaTW7LjJjdXyugKQS86ZTB37aPlT35euA59t4c9awD+tVui
 c6DHN5mRqAqtgd8ClVf487W1eQke
X-Google-Smtp-Source: APXvYqw7j6vm75akdEc4C1l56bTiOCtcagikNnEg7t7GDJhmilApBnECrfbJpWHBs55dAVXm6bieYg==
X-Received: by 2002:a05:620a:1205:: with SMTP id
 u5mr13468377qkj.430.1570758363906; 
 Thu, 10 Oct 2019 18:46:03 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:46:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 17/19] ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD
Date: Thu, 10 Oct 2019 20:45:34 -0500
Message-Id: <20191011014536.10869-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLP8WqFYu4bQKTiP0klsdbGYwuzNt8QzinOXFINd874=;
 b=s6AutVXMNQ918Ck+31NxCoB579NOgwr1UQ81PNrhkMU4LyYukYkGIk3Db118KivU87
 qSJg4g8B/q0cC3tBAz7TCHJymPsAKIeHwoAsb5ot9OPx2kxCMBeQnfM+Dlz4OUkc0au3
 yzEMlayWsh7Ez6eBb7ikRR3ehBpiAU9S1BfPXaR7QyOM7x3eZywCemAXC66ip1FSIL7b
 wQPzyAHkDZhj3JVyac6Oiwymja731eIbMUPxhjl/5HgiO1tw3J+LZZRLh/s4rH2kOVnO
 TaweYkPuZZTKTvdqRZZRR9h7z/OApRRi2fN+cSfD1H5Bm9kdj/ouml4v6bDje6B+HKON
 kDiQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T25seSBlbmFibGUgdGhlIHZnYV9zd2l0Y2hlcm9vIGxvZ2ljIG9uIHN5c3RlbXMgd2l0aCB0aGUK
QVRQWCBBQ1BJIG1ldGhvZC4gIFRoaXMgbG9naWMgaXMgbm90IG5lZWRlZCBmb3IgYXNpY3MKdGhh
dCBhcmUgbm90IHBhcnQgb2YgYSBQWCAoUG93ZXJYcHJlc3MpL0hHIChIeWJyaWQgR3JhcGhpY3Mp
CnBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIHNvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMgfCAzOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyBiL3NvdW5kL3Bj
aS9oZGEvaGRhX2ludGVsLmMKaW5kZXggMWUxNGQ3MjcwYWRmLi45YjkwMzEyZDczMTQgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKKysrIGIvc291bmQvcGNpL2hkYS9oZGFf
aW50ZWwuYwpAQCAtMzUsNiArMzUsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsb2Nrc291cmNlLmg+
CiAjaW5jbHVkZSA8bGludXgvdGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L2NvbXBsZXRpb24uaD4K
KyNpZmRlZiBTVVBQT1JUX1ZHQV9TV0lUQ0hFUk9PCisjaW5jbHVkZSA8bGludXgvYWNwaS5oPgor
I2VuZGlmCiAKICNpZmRlZiBDT05GSUdfWDg2CiAvKiBmb3Igc25vb3AgY29udHJvbCAqLwpAQCAt
MTM0NSw2ICsxMzQ4LDI2IEBAIHN0YXRpYyBpbnQgYXp4X2Rldl9mcmVlKHN0cnVjdCBzbmRfZGV2
aWNlICpkZXZpY2UpCiB9CiAKICNpZmRlZiBTVVBQT1JUX1ZHQV9TV0lUQ0hFUk9PCisvKiBBVFBY
IGlzIGluIHRoZSBpbnRlZ3JhdGVkIEdQVSdzIG5hbWVzcGFjZSAqLworc3RhdGljIHN0cnVjdCBw
Y2lfZGV2ICphdHB4X3ByZXNlbnQodm9pZCkKK3sKKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IE5V
TEw7CisJYWNwaV9oYW5kbGUgZGhhbmRsZSwgYXRweF9oYW5kbGU7CisJYWNwaV9zdGF0dXMgc3Rh
dHVzOworCisJd2hpbGUgKChwZGV2ID0gcGNpX2dldF9jbGFzcyhQQ0lfQkFTRV9DTEFTU19ESVNQ
TEFZIDw8IDE2LCBwZGV2KSkgIT0gTlVMTCkgeworCQlkaGFuZGxlID0gQUNQSV9IQU5ETEUoJnBk
ZXYtPmRldik7CisJCWlmICghZGhhbmRsZSkKKwkJCWNvbnRpbnVlOworCisJCXN0YXR1cyA9IGFj
cGlfZ2V0X2hhbmRsZShkaGFuZGxlLCAiQVRQWCIsICZhdHB4X2hhbmRsZSk7CisJCWlmIChBQ1BJ
X0ZBSUxVUkUoc3RhdHVzKSkKKwkJCWNvbnRpbnVlOworCQlyZXR1cm4gcGRldjsKKwl9CisJcmV0
dXJuIE5VTEw7Cit9CisKIC8qCiAgKiBDaGVjayBvZiBkaXNhYmxlZCBIRE1JIGNvbnRyb2xsZXIg
YnkgdmdhX3N3aXRjaGVyb28KICAqLwpAQCAtMTM1Niw2ICsxMzc5LDIyIEBAIHN0YXRpYyBzdHJ1
Y3QgcGNpX2RldiAqZ2V0X2JvdW5kX3ZnYShzdHJ1Y3QgcGNpX2RldiAqcGNpKQogCXN3aXRjaCAo
cGNpLT52ZW5kb3IpIHsKIAljYXNlIFBDSV9WRU5ET1JfSURfQVRJOgogCWNhc2UgUENJX1ZFTkRP
Ul9JRF9BTUQ6CisJCWlmIChwY2ktPmRldmZuID09IDEpIHsKKwkJCXAgPSBwY2lfZ2V0X2RvbWFp
bl9idXNfYW5kX3Nsb3QocGNpX2RvbWFpbl9ucihwY2ktPmJ1cyksCisJCQkJCQkJcGNpLT5idXMt
Pm51bWJlciwgMCk7CisJCQlpZiAocCkgeworCQkJCS8qIEFUUFggaXMgaW4gdGhlIGludGVncmF0
ZWQgR1BVJ3MgQUNQSSBuYW1lc3BhY2UKKwkJCQkgKiByYXRoZXIgdGhhbiB0aGUgZEdQVSdzIG5h
bWVzcGFjZS4gSG93ZXZlciwKKwkJCQkgKiB0aGUgZEdQVSBpcyB0aGUgb25lIHdobyBpcyBpbnZv
bHZlZCBpbgorCQkJCSAqIHZnYXN3aXRjaGVyb28uCisJCQkJICovCisJCQkJaWYgKCgocC0+Y2xh
c3MgPj4gMTYpID09IFBDSV9CQVNFX0NMQVNTX0RJU1BMQVkpICYmCisJCQkJICAgIGF0cHhfcHJl
c2VudCgpKQorCQkJCQlyZXR1cm4gcDsKKwkJCQlwY2lfZGV2X3B1dChwKTsKKwkJCX0KKwkJfQor
CQlicmVhazsKIAljYXNlIFBDSV9WRU5ET1JfSURfTlZJRElBOgogCQlpZiAocGNpLT5kZXZmbiA9
PSAxKSB7CiAJCQlwID0gcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KHBjaV9kb21haW5fbnIo
cGNpLT5idXMpLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=

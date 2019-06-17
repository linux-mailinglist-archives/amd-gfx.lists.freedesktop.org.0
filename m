Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9C48ECC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E31F899B7;
	Mon, 17 Jun 2019 19:28:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606089996
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:00 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c70so6938085qkg.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5GfWsEeIMzCqi5gdoGgbvtgAtFHqJTw+0Xmy3NPyOE=;
 b=n35mmBqIHlz8Z1OOw1dZr+zSyRUZsf3sl5OCn9IzG8RbriajxjQTj++7FdgXokVZZA
 fN7J09iT4Ji4vSoWOXZK3HRic8Hp1ZdUMeK/7ulZ6MPG1JukyGOonK9vQs8APdEVpXE0
 XlNvynNUuYZRWmzhD9olfLacgTDS/RbbSuaCT9JFKnqJh99/HuJaECA9NyTZzIWDaw3m
 PWE/AfO1cZupjg+rED4f9l7j57vXnjetLCugha+dbP4/wKFbYIeE/j9KKqtPU1wpCOlt
 rU38seE2sc0OZT53i2mc5KX9s3b7bQIEggSwtinEdoZ6RcRi5KksepgTrgqWfpfjbjT6
 QADA==
X-Gm-Message-State: APjAAAUHJTrzTq5HmWFlzMXFOdzxfE+TDThpswzys4kbRjFWOoSsKJQR
 olbCR+pP040v58jaXOmqVk8mp2dI9fQ=
X-Google-Smtp-Source: APXvYqwto6BwZrEHmFOuykPsakNSxmX2IO8D45+RMskw/Mhr639k+fA5CzRrbJ3b+6BOIiLheqFVew==
X-Received: by 2002:a37:9d50:: with SMTP id g77mr90210688qke.311.1560799678999; 
 Mon, 17 Jun 2019 12:27:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 149/459] drm/amd/powerplay: update smu11 driver if header for
 navi10 (v2)
Date: Mon, 17 Jun 2019 14:26:14 -0500
Message-Id: <20190617192704.18038-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5GfWsEeIMzCqi5gdoGgbvtgAtFHqJTw+0Xmy3NPyOE=;
 b=JuQUr11HcxWjQkuvRBjezZ25mixxJiz12ZArnso+qMxCHj9v7hBtcLvIQI5lLJysvY
 KSFsdGGfZujLdb9IFIrz2BNL8TByyUwaX3IswZBtMNyKzDPwIFJiNcAU6g2B/zDIKU/v
 aelsFWwXVmViLDOvEZMpI7D72MaUT5DIp+/yjX/pY+mVRPHebBntYkvUDxWy148VgZb4
 SSQThsYn3H8ngJD3M56XOM85uoOxQfB5egUADSJ9Aff8EqlsXVE56C03WnzgsrKgc+di
 MUpga7DCGIZTnRmULckQlIphpkVl7UM+9X7zSzrj5gdd21ijDLdYg1sUTIA9SwuMmQWk
 P24A==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggdXBkYXRlcyBz
bXUxMSBkcml2ZXIgaWYgaGVhZGVyIGZvciBuYXZpMTAgdG8gbWF0Y2ggNDIuMDkuMDAgc211CmZp
cm13YXJlLgoKdjI6IGNsZWFuIHVwIGNvbW1lbnRzCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211XzExXzBf
ZHJpdmVyX2lmLmggICAgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvc211XzExXzBfZHJpdmVyX2lmLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvc211XzExXzBfZHJpdmVyX2lmLmgKaW5kZXggYjk4Y2IwMDVhNDZjLi5h
NTM1NDdmYTg5ODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2lu
Yy9zbXVfMTFfMF9kcml2ZXJfaWYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211XzExXzBfZHJpdmVyX2lmLmgKQEAgLTQsNyArNCw3IEBACiAvLyAqKiogSU1QT1JU
QU5UICoqKgogLy8gU01VIFRFQU06IEFsd2F5cyBpbmNyZW1lbnQgdGhlIGludGVyZmFjZSB2ZXJz
aW9uIGlmIAogLy8gYW55IHN0cnVjdHVyZSBpcyBjaGFuZ2VkIGluIHRoaXMgZmlsZQotI2RlZmlu
ZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTiAweDJECisjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9W
RVJTSU9OIDB4MkUKIAogI2RlZmluZSBQUFRBQkxFX05WMTBfU01VX1ZFUlNJT04gOAogCkBAIC0y
OTcsNiArMjk3LDE1IEBAIHR5cGVkZWYgc3RydWN0IHsKICAgCiB9IFN3STJjUmVxdWVzdF90OyAv
LyBTVyBJMkMgUmVxdWVzdCBUYWJsZQogCisvL0QzSE9UIHNlcXVlbmNlcwordHlwZWRlZiBlbnVt
IHsKKyAgQkFDT19TRVFVRU5DRSwKKyAgTVNSX1NFUVVFTkNFLAorICBCQU1BQ09fU0VRVUVOQ0Us
CisgIFVMUFNfU0VRVUVOQ0UsCisgIEQzSE9UX1NFUVVFTkNFX0NPVU5ULAorfUQzSE9UU2VxdWVu
Y2VfZTsKKwogLy9USGlzIGlzIGFsaWduZWQgd2l0aCBSU01VIFBHRlNNIFJlZ2lzdGVyIE1hcHBp
bmcKIHR5cGVkZWYgZW51bSB7CiAgIFBHX0RZTkFNSUNfTU9ERSA9IDAsCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

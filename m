Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163C48E08
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A4489568;
	Mon, 17 Jun 2019 19:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EB48955D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:13 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c70so6916407qkg.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kuTvE3GX8iGplN938qIrqpr0QPfc7upM93fJrsS+D38=;
 b=a/vYyweyMLCw5dsjpaxGpbyJNkoIiHAlsALPgh3LDGOxmPH5sK2TZKK8HKu8qtyhOr
 PJ5L1Jt8sXoj0FvfMoZqK+B11vWSsdwtjJ3N7Dw97yvgSD9b8X6UmEqgI46iwPHtmhOX
 /Jm2GThEu1QFe04KSO4J7C8zCNVqk+JY4UhcG3yCA0JrbRF88qK8mcTea+7nwjMZZlbi
 bRrN9uXszjMa4fGM8QY4yq1i/3iFn/nRfyPqT+mibHmqWzR8ckRu77JCDP8MNaM61ZiQ
 aVPGXwdxFIZZ8YBIL3ghG8H6hZUrbENTrWafv8OTL5lv5IYE3+txeZJH0iwxLZ816w6x
 6oww==
X-Gm-Message-State: APjAAAWnM2Fr1zTGCdIDimZLSEi3Vypm+MBpp0C19WAOZHkQZwnEa3Wt
 qXchYrrSBMd9S8UlgKPxz69R6/NuvNM=
X-Google-Smtp-Source: APXvYqzGVfeK6C1HObcDg30rHffn8tCB3IGKpSekXg29it6CpyOy2Pi9rJhycEy3RfwhBCvxJwl07A==
X-Received: by 2002:ae9:d601:: with SMTP id r1mr91200626qkk.231.1560799092148; 
 Mon, 17 Jun 2019 12:18:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 072/459] drm/amdgpu/psp: support print out psp firmware header
 v1_1 info
Date: Mon, 17 Jun 2019 14:10:33 -0500
Message-Id: <20190617191700.17899-61-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kuTvE3GX8iGplN938qIrqpr0QPfc7upM93fJrsS+D38=;
 b=TqmrxkJM+n+pRkf13z3FFFHPGoQ20btbzUlFPJdulflDFTEJRUqYjlYh68kvC5/KwM
 rxYBAfjPJ3AATw6lhfj28UBGKFujhqBTDz5ZFT3O93lEv1CYAs9m6YG/owj8ruNPmz7M
 +YTBNRfgIWL+qk6fYWvCQFg/XEslaDr0cLNcrXKVUhsbuR5IRnH7Zkh0q03KXy4ac8jq
 24svBBusactkEsounTClyCZmYcoKBqUyPiyR49yr+Ol8+t4fFYC16z9BS6vgpVRteZsx
 US8w5g17ZGJRAyYRvw4REFCMUEnuZYYTrk5TrDLAkKPcPsLP79siZR4nNBWnIOIFQcWI
 eEUA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUg
TWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dWNvZGUuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYwppbmRleCAwNGQwMDdk
YjA2ZjcuLmVlNTRkOWUwY2UxZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Vjb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Vjb2RlLmMKQEAgLTI0NSw2ICsyNDUsMTYgQEAgdm9pZCBhbWRncHVfdWNvZGVfcHJpbnRfcHNw
X2hkcihjb25zdCBzdHJ1Y3QgY29tbW9uX2Zpcm13YXJlX2hlYWRlciAqaGRyKQogCQkJICBsZTMy
X3RvX2NwdShwc3BfaGRyLT5zb3Nfb2Zmc2V0X2J5dGVzKSk7CiAJCURSTV9ERUJVRygic29zX3Np
emVfYnl0ZXM6ICV1XG4iLAogCQkJICBsZTMyX3RvX2NwdShwc3BfaGRyLT5zb3Nfc2l6ZV9ieXRl
cykpOworCQlpZiAodmVyc2lvbl9taW5vciA9PSAxKSB7CisJCQljb25zdCBzdHJ1Y3QgcHNwX2Zp
cm13YXJlX2hlYWRlcl92MV8xICpwc3BfaGRyX3YxXzEgPQorCQkJCWNvbnRhaW5lcl9vZihwc3Bf
aGRyLCBzdHJ1Y3QgcHNwX2Zpcm13YXJlX2hlYWRlcl92MV8xLCB2MV8wKTsKKwkJCURSTV9ERUJV
RygidG9jX2hlYWRlcl92ZXJzaW9uOiAldVxuIiwKKwkJCQkgIGxlMzJfdG9fY3B1KHBzcF9oZHJf
djFfMS0+dG9jX2hlYWRlcl92ZXJzaW9uKSk7CisJCQlEUk1fREVCVUcoInRvY19vZmZzZXRfYnl0
ZXM6ICV1XG4iLAorCQkJCSAgbGUzMl90b19jcHUocHNwX2hkcl92MV8xLT50b2Nfb2Zmc2V0X2J5
dGVzKSk7CisJCQlEUk1fREVCVUcoInRvY19zaXplX2J5dGVzOiAldVxuIiwKKwkJCQkgIGxlMzJf
dG9fY3B1KHBzcF9oZHJfdjFfMS0+dG9jX3NpemVfYnl0ZXMpKTsKKwkJfQogCX0gZWxzZSB7CiAJ
CURSTV9FUlJPUigiVW5rbm93biBQU1AgdWNvZGUgdmVyc2lvbjogJXUuJXVcbiIsCiAJCQkgIHZl
cnNpb25fbWFqb3IsIHZlcnNpb25fbWlub3IpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
